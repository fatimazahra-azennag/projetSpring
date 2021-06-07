package com.ensias.Ensias_docs.repositories;

import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class InscriptionRepository {
    @Autowired
    EntityManager entityManager;

    @Transactional
    public void InscrirUsers(List<User> users, Element element){

        String query = "INSERT into inscrit(id_user,id_elm) VALUES \n";
        for(User u : users){
            query += "("+u.getUser_id()+","+element.getElm_id()+")\n,";
        }
        if(query.contains(")\n,")){
            query = query.substring(0,query.lastIndexOf(","));
            System.out.println("Query : "+query);
            entityManager.createNativeQuery(query) .executeUpdate();

        }


    }
}
