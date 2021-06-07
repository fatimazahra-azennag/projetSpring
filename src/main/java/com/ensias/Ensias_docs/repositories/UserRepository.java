package com.ensias.Ensias_docs.repositories;

import com.ensias.Ensias_docs.models.Filiere;
import com.ensias.Ensias_docs.models.User;
import jdk.dynalink.linker.LinkerServices;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface UserRepository extends JpaRepository<User,Integer> {

    Optional<User> findByEmail(String email);
    @Query("SELECT u FROM User u WHERE u.niv = ?2 and u.user_filiere IN ?1")
    List<User> findUserByFiliereAndNiv(List<Filiere> user_filiere,String niv);

}


