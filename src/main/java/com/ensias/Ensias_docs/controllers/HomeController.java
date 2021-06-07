package com.ensias.Ensias_docs.controllers;

import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.services.ElementService;
import com.ensias.Ensias_docs.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller

@RequestMapping("/ensiasdocs")
public class HomeController {
    @Autowired
    private ElementService es;

    @Autowired
    private UserService us;

    public HomeController(ElementService es) {
          this.es=es;
    }

    @RequestMapping("/home")

    public String home(Model model, @RequestParam(name = "page",defaultValue ="0") String page, @RequestParam(name = "find",defaultValue = "") String find){
        User user= us.getCurrentUser();
        boolean auth = user!=null;
        model.addAttribute("auth",auth);

        if(find==null || find.equals("null")|| find.trim().equals("")){

            model.addAttribute("search", false);


            List<Element> elements=  es.getAllElements();

            model.addAttribute("user",user);

            model.addAttribute("nbpages",((elements.size()-1)/4));
            int requestedPage=0;
            try {
                requestedPage = Integer.parseInt(page);
            }catch(NumberFormatException e) {
                requestedPage=0;
            }

            model.addAttribute("requestedPage",(requestedPage*4>elements.size())?0:requestedPage);


            List<Element> elements1 = es.getDisplayedModules(elements,4,requestedPage*4);
            model.addAttribute("modules",elements1);}
        else{

            Element element=es.getElementByName(find);
            model.addAttribute("search",true);
            model.addAttribute("module",element);


        }

        return "Home";

    }
    @GetMapping("/profile")
    public String getProfile(Model model){
        addAttributes(model);
        return "profile";
    }

    private void addAttributes(Model model){
        User user = us.getCurrentUser();
        boolean auth = user!=null;
        model.addAttribute("auth",auth);
        if(user!=null)model.addAttribute("user",user);
    }


}
