package com.ensias.Ensias_docs.models;


import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@Entity
@Table(name="todos")
@AllArgsConstructor
public class todos {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int todo_id;

    @JoinColumn(name = "todo_title")
    @Column(name = "todo_title")
    private String title;

    @JoinColumn(name = "todo_description")
    @Column(name = "todo_description")
    private String description;

    @JoinColumn(name = "todo_is_done")
    @Column(name = "todo_is_done")
    private int done;

    @JoinColumn(name = "todo_delai")
    @Column(name = "todo_delai")
    private Date delai;

    @JoinColumn(name = "todo_user")
    @Column(name = "todo_user")
    private int todo_user;

    public boolean getIsclose() {

        long difference = delai.getTime() - new Date().getTime();
        long days = (difference
                / (1000 * 60 * 60 * 24))
                % 365;
        System.out.println(days);
        return days<=1;
    }

    public String getDelai(){

        return new SimpleDateFormat("dd MMMM yyyy").format(delai);
    }
    public Date getDelaiAsDate(){
        return delai;
    }

    public todos() {

    }
}
