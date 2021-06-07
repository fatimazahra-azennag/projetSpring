package com.ensias.Ensias_docs.controllers;

import com.ensias.Ensias_docs.models.Document;
import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.services.DocumentService;
import com.ensias.Ensias_docs.services.ElementService;
import com.ensias.Ensias_docs.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/ensiasdocs")
public class ModuleController {
    @Autowired
    private ElementService es;
    @Autowired
    private UserService us;
    @Autowired
    private DocumentService ds;


    public ModuleController(ElementService es) {
        this.es=es;
    }
    @RequestMapping("/module")

    public  String module(Model model, @RequestParam("idM") String idM){
        User user=us.getCurrentUser();
        boolean auth = user!=null;
        model.addAttribute("auth",auth);
        model.addAttribute("user",user);

        Optional<Element> element=es.getElementsById(Integer.parseInt(idM));

        if(element.isPresent()){
            model.addAttribute("module",element.get());
            boolean inscrit= us.isInscrit(element,user);
            if(inscrit){

                model.addAttribute("auth",auth);
                List<Document> documents=ds.findDocByElement(Integer.parseInt(idM));
                if(documents==null) System.out.println("plein");
                List<String>  types=ds.getTypes(documents);
                model.addAttribute("docs",documents);
                model.addAttribute("types",types);
            }
            model.addAttribute("inscrit",inscrit);

        }
        return "module";

    }
    @RequestMapping("/abonner")
    public String abonner(Model model ,@RequestParam("id") String id){

        User user= us.getCurrentUser();
        boolean auth = user!=null;
        model.addAttribute("auth",auth);
        model.addAttribute("user",user);
        Element element=es.getElementsById(Integer.parseInt(id)).get();
        List<Element> elements=user.getElements();
        elements.add(element);
        user.setElements(elements);
        us.saveUser(user);
        return module(model,id);

    }
    @RequestMapping("/document")
    public String visualiser(Model model,@RequestParam("idDoc") String id ){
        User user= us.getCurrentUser();
        boolean auth = user!=null;
        Document doc=ds.finddocument(Integer.parseInt(id));
        model.addAttribute("doc",doc);
        model.addAttribute("auth",auth);
        model.addAttribute("user",user);

        return "Document";
    }



}
