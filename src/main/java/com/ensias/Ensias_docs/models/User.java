package com.ensias.Ensias_docs.models;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.ensias.Ensias_docs.models.Filiere;
import lombok.NonNull;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

@Data
@Entity
@Table(name="user")
public class User implements UserDetails {

    public User() {
    }



    public User(String firstName, String lastName, String email, String password, String num, String niv, Filiere user_filiere) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.num = num;
        this.niv = niv;
        this.user_filiere = user_filiere;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int user_id;

    @Column(name = "user_f_name")

    private String firstName;

    @Column(name = "user_l_name")

    private String lastName;

    @Column(name = "user_email", nullable = false, length = 50)

    private String email;

    @Column(name = "user_password")

    private String password;

    @Column(name = "user_is_admin")
    private int isadmin;

    @Column(name = "user_num")
    private String num;

    @Column(name = "user_nv")

    private String niv;

    @ManyToOne
    @JoinColumn(name = "user_filiere")
    private Filiere user_filiere;

    @ManyToMany
    @JoinTable( name = "inscrit",
            joinColumns = @JoinColumn( name = "id_user" ),
            inverseJoinColumns = @JoinColumn( name = "id_elm" ) )
    private List<Element> elements = new ArrayList<>();

    @OneToMany(targetEntity=todos.class,mappedBy="todo_user")
    private List<todos> todos =new ArrayList<>();



    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Arrays.asList(new SimpleGrantedAuthority((isadmin==1)?"ADMIN":"USER"));
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}





