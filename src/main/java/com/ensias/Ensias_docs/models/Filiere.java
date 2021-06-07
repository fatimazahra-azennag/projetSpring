package com.ensias.Ensias_docs.models;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name="filiere")
public class Filiere {
    @Id
    @Column(name = "filiere_name")
    private String filiere_name;
    @Column(name = "filiere_abs")
    private String filiere_abs;
    @ManyToMany
    @JoinTable( name = "filiere_element",
            joinColumns = @JoinColumn( name = "id_fil" ),
            inverseJoinColumns = @JoinColumn( name = "id_elm" ) )
    private List<Element> elements = new ArrayList<>();



}
