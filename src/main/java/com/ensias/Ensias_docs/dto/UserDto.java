package com.ensias.Ensias_docs.dto;


import com.ensias.Ensias_docs.models.Filiere;
import com.ensias.Ensias_docs.models.User;
import org.springframework.validation.Errors;

import javax.validation.constraints.*;

public class UserDto {




    @Size(min = 5)
    private String firstName;




    @Size(min = 5)
    private String lastName;


    @Pattern(regexp = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")
    private String email;



    @Size(min = 5)
    private String password;


    @Pattern(regexp = "^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*$")
    private String num;



    @NotNull
    private String niv;


    @NotNull
    private Filiere user_filiere;


    private String confirm_password;




    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public void setNiv(String niv) {
        this.niv = niv;
    }

    public void setUser_filiere(Filiere user_filiere) {
        this.user_filiere = user_filiere;
    }

    public UserDto() {
    }
    public UserDto(User user) {
        this(user.getFirstName(),user.getLastName(),user.getEmail(),user.getPassword(), user.getNum(), user.getNiv(), user.getUser_filiere(),null);
    }

    public UserDto(String firstName, String lastName, String email, String password, String num, String niv, Filiere user_filiere,String confirm_password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.num = num;
        this.niv = niv;
        this.user_filiere = user_filiere;
        this.confirm_password = confirm_password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getNum() {
        return num;
    }

    public String getNiv() {
        return niv;
    }

    public Filiere getUser_filiere() {
        return user_filiere;
    }


    @Override
    public String toString() {
        return "UserDto{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", num='" + num + '\'' +
                ", niv='" + niv + '\'' +
                ", user_filiere=" + user_filiere +
                '}';
    }

    public User getAsUser(){

        return new User(firstName,lastName,email,password,num,niv,user_filiere);
    }
    public boolean password_confirm(){
        return password.equals(confirm_password) ;

    }

    public String getConfirm_password() {
        return confirm_password;
    }

    public void setConfirm_password(String confirm_password) {
        this.confirm_password = confirm_password;
    }
}
