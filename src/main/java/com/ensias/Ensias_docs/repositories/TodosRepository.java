package com.ensias.Ensias_docs.repositories;

import com.ensias.Ensias_docs.models.todos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TodosRepository extends JpaRepository<todos,Integer>{

}