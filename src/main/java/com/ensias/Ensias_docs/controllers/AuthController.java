package com.ensias.Ensias_docs.controllers;


import com.ensias.Ensias_docs.dto.UserDto;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.services.UserService;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;



@Controller
public class AuthController {



    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")

    public String index(Model model) {

        User user = userService.getCurrentUser();
        boolean auth = user!=null;
        model.addAttribute("auth",auth);
        if(user!=null)model.addAttribute("user",user);
        return "index";

    }

    /**
     * registering page
     * Still not working (need beans + session management!)
     * */

    @GetMapping("register")
    public String getRegister(Model model){
        User u = userService.getCurrentUser();
        UserDto user = (u!=null?new UserDto(u):null);
        boolean auth = user!=null;
        model.addAttribute("auth",auth);
        if(user==null){
            user = new UserDto();
        }

        model.addAttribute("user",user);

        return "inscription";
    }

    @GetMapping("login")
    public String getlogin(Model model) {

        User user = userService.getCurrentUser();
        boolean auth = user!=null;
        model.addAttribute("auth",auth);

        if(user==null){
            user = new User();
        }
        model.addAttribute(user);
        return "connexion";
    }

    @PostMapping("register")
    public String inscription( @ModelAttribute(name = "user") @Valid UserDto user, Errors errors, Model model){
        boolean user_saved = false;
        System.out.println(model.asMap());
        if(!errors.hasErrors() && user.password_confirm()){

            userService.saveUser(user.getAsUser());

            user_saved = true;

        }
        if(!user.password_confirm()){
            errors.reject("confirm_password");
        }
        System.out.println(errors);

        model.addAttribute("user_saved",user_saved);
        model.addAttribute("errors",errors);
        return "inscription";
    }

    @GetMapping("logout")
    public String logout(){
        SecurityContextHolder.getContext().setAuthentication(null);
        return "redirect:/login";
    }

}
