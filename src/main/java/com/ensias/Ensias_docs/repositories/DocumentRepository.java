package com.ensias.Ensias_docs.repositories;

import com.ensias.Ensias_docs.models.Document;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.print.Doc;
import java.util.Optional;

@Repository
public interface DocumentRepository extends JpaRepository<Document,Integer> {


}
