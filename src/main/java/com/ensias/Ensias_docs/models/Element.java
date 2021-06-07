package com.ensias.Ensias_docs.models;

import lombok.Data;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name="element")
public class Element {

    public Element(String elmName, String elmModule, String elmDesc, String elmAnnee, String elmSem, List<Filiere> filieres) {
        this.elmName = elmName;
        this.elmModule = elmModule;
        this.elmDesc = elmDesc;
        this.elmAnnee = elmAnnee;
        this.elmSem = elmSem;
        this.filieres = filieres;
    }
    public Element(int elm_id ,String elmName, String elmModule, String elmDesc, String elmAnnee, String elmSem, List<Filiere> filieres) {
        this.elm_id = elm_id;
        this.elmName = elmName;
        this.elmModule = elmModule;
        this.elmDesc = elmDesc;
        this.elmAnnee = elmAnnee;
        this.elmSem = elmSem;
        this.filieres = filieres;
    }

    public Element() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int elm_id;

    @Column(name = "elm_name")
    private String elmName;

    @Column(name = "elm_module")
    private String elmModule;

    @Column(name = "elm_description")
    private String elmDesc;

    @Column(name = "elm_annee")
    private String elmAnnee;

    @Column(name = "elm_semester")
    private String elmSem;

    @Column(name = "date_exam")
    private Date dateExam;


    @ManyToMany
    @JoinTable( name = "filiere_element",
            joinColumns = @JoinColumn( name = "id_elm" ),
            inverseJoinColumns = @JoinColumn( name = "id_fil" )
    )
    private List<Filiere> filieres = new ArrayList<>();


    @ManyToMany
    @JoinTable( name = "inscrit",
            joinColumns = @JoinColumn( name = "id_elm" ),
            inverseJoinColumns = @JoinColumn( name = "id_user" ) )
    private List<User> users= new ArrayList<>();





}
