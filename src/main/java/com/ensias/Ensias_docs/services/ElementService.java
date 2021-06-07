package com.ensias.Ensias_docs.services;


import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.repositories.ElementRepository;
import com.ensias.Ensias_docs.repositories.InscriptionRepository;
import com.ensias.Ensias_docs.repositories.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Data
@Service
public class ElementService {
    @Autowired
    ElementRepository ep;

    @Autowired
    InscriptionRepository ir;

    @Autowired
    UserRepository ur ;

    public List<Element> getElementsByUser(int user_id){
        return ur.getById(user_id).getElements();
    }
    public Optional<Element> getElementsById(int id_elm){
        return ep.findById(id_elm);
    }
    public List<Element> getAllElements(){
        List<Element> list = new ArrayList<Element>();
        Iterator iterator = ep.findAll().iterator();
        while (iterator.hasNext())
            list.add((Element) iterator.next());
        return list;
    }

    public void createElement( Element element ){
        ep.save(element);
        List<User> users = ur.findUserByFiliereAndNiv(element.getFilieres(),element.getElmAnnee());
        System.out.println(users.size());
        ir.InscrirUsers(users,element);
    }
    public void updateElement(Element element){
        ep.save(element);
    }

    public void updateExam(int elm_id, Date date){
        ep.updateDate(elm_id,date);
    }

    public List<Element> getDisplayedModules(List<Element> elements,int taille,int index){
        List<Element> mod = new ArrayList<>();
        if(elements.size()<index) index =0;
        for(int i =index;i<(index+taille);i++) {
            if(i<elements.size()) {
                mod.add(elements.get(i));
            }
        }
        return mod;
    }
    public Element getElementByName(String Name){
        return ep.findElementByName(Name);
    }



}
