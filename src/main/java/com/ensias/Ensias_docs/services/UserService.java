package com.ensias.Ensias_docs.services;

import com.ensias.Ensias_docs.dto.EventDto;
import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.models.todos;
import com.ensias.Ensias_docs.repositories.ElementRepository;
import com.ensias.Ensias_docs.repositories.TodosRepository;
import com.ensias.Ensias_docs.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Service;


import java.text.DateFormatSymbols;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;

@Service
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder;

    private final TodosRepository todosRepository;
    private final ElementRepository elementRepository;

    @Autowired
    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder, TodosRepository todosRepository, ElementRepository elementRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;

        this.todosRepository = todosRepository;
        this.elementRepository = elementRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        final Optional<User> optionalUser = userRepository.findByEmail(s.trim());

        if (optionalUser.isPresent()) {

            UserDetails userDetails =  optionalUser.get();
            return userDetails;
        }
        else {
            throw new UsernameNotFoundException(MessageFormat.format("User with email {0} cannot be found.", s));
        }
    }

    public User loadUserByEmail(String s) throws UsernameNotFoundException {

        final Optional<User> optionalUser = userRepository.findByEmail(s.trim());

        if (optionalUser.isPresent()) {

            User userDetails =  optionalUser.get();
            return userDetails ;
        }
        else {
            throw new UsernameNotFoundException(MessageFormat.format("User with email {0} cannot be found.", s));
        }
    }



    public void saveUser(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        System.out.println(user.getPassword().length());
        userRepository.save(user);
    }

    public User getCurrentUser(){
        User user = null;
        Object principal = (SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        UserDetails details = principal instanceof UserDetails ? (UserDetails) principal:null;
        if(details!=null){
            user = loadUserByEmail(details.getUsername());
        }
        return user;
    }
    public void createTodo(String todo_name,String date_str,User user){

        todos todo = new todos(0,todo_name,"",0,toDate(date_str),user.getUser_id());

        todosRepository.save(todo);


    }

    public void updateTodoDone(int todo_id,int todo_done){
        Optional<todos> todoOp = todosRepository.findById(todo_id);

        if(todoOp.isPresent()){
            todos todo = todoOp.get();
            todo.setDone(todo_done);
            todosRepository.save(todo);
        }

    }
    public boolean isInscrit(Optional<Element> el,User user){
        List<Element> elements=user.getElements();
        if(elements.contains(el.get())){
            return true;
        }
        return false;

    }

    public void deleteTodo(int todo_id){
        todosRepository.deleteById(todo_id);
    }



    public List<EventDto> getUserEvents(User user){

        List<EventDto> events = new ArrayList<>();

        for (todos todo : user.getTodos()){
            events.add(new EventDto(todo));
        }
        List<Element> elements = elementRepository.findElementByDateExamNotNull();
        for (Element element : elements){
            events.add(new EventDto(element));
        }

        return events;
    }

    public void saveUserTodo(todos todo){
        todosRepository.save(todo);
    }


    public Date toDate(String todo_date) {


        try {
            String[] date_splitted =  todo_date.split(" ");
            todo_date = date_splitted[0]+" " + date_splitted[1] +" "+ date_splitted[2];
            DateFormatSymbols DFS = new DateFormatSymbols();
            DFS.setMonths(new String[] {
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
            });
            System.out.println(todo_date);

            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("d MMMM u", Locale.ENGLISH);
            LocalDate date = LocalDate.parse(todo_date, dateFormatter);

            return Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());

        }catch (DateTimeParseException |ArrayIndexOutOfBoundsException  e){
            System.out.println(todo_date);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                return dateFormat.parse(todo_date);
            } catch (ParseException parseException) {
                parseException.printStackTrace();
                return null;
            }
        }
    }
}
