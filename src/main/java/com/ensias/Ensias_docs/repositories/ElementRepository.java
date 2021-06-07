package com.ensias.Ensias_docs.repositories;

import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;


@Repository

public interface ElementRepository extends CrudRepository<Element,Integer> {

    @Transactional
    @Modifying
    @Query("UPDATE Element e set e.dateExam=?2 WHERE e.elm_id = ?1")
    void updateDate(int elm_id, Date date);
    @Query("SELECT u FROM Element u WHERE u.elmName = ?1")
    Element findElementByName(String name);

    List<Element> findElementByDateExamNotNull();

}
