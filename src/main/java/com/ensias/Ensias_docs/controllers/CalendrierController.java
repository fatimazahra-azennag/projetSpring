package com.ensias.Ensias_docs.controllers;

import com.ensias.Ensias_docs.dto.EventDto;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.models.todos;
import com.ensias.Ensias_docs.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ensiasdocs")
public class CalendrierController {

    final UserService userService;

    public CalendrierController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/calendrier")
    public String getCalendrier(Model model){
        User user = userService.getCurrentUser();
        addAttributes(model,user);
        List<EventDto> events = userService.getUserEvents(user);
        model.addAttribute("events",events);

        return "calendrier";

    }

    @PostMapping("/todo/calendardelete")
    public String todoCalendarDelete(@RequestParam("calendar_todo_id") int todo_id){

        userService.deleteTodo(todo_id);
        return "redirect:/ensiasdocs/calendrier";
    }

    @PostMapping("/calendartodo")
    public String calendarTodo(@RequestParam("todo_name") String todo_name,@RequestParam("todo_desc") String todo_desc,@RequestParam("todo_is_done") String done,@RequestParam("todo_date") String date_str  ){

        if(!todo_name.trim().equals("") && !date_str.trim().equals("")) {
            todos todo = new todos(0, todo_name, todo_desc, done.equals("done") ? 1 : 0, userService.toDate(date_str), userService.getCurrentUser().getUser_id());
            userService.saveUserTodo(todo);
        }

        return "redirect:/ensiasdocs/calendrier";

    }
    private void addAttributes(Model model,User user){

        boolean auth = user!=null;
        model.addAttribute("auth",auth);
        if(user!=null)model.addAttribute("user",user);
    }
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public String HandleException(MissingServletRequestParameterException e){
        System.out.println("name " + e.getMessage());

        return "redirect:/ensiasdocs/calendrier";
    }
}
