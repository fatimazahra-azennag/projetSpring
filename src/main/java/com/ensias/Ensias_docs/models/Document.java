package com.ensias.Ensias_docs.models;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="document")
public class Document {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int doc_id;


    @Column(name = "doc_name")
    private String docName;

    @Column(name = "doc_path")
    private String  docPath;


    @Column(name = "doc_type")
    private String docType;


    @Column(name = "doc_mime")
    private String docMime;


    @ManyToOne
    @JoinColumn(name = "doc_elm")
    private Element doc_elm;



}
