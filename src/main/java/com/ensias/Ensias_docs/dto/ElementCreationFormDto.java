package com.ensias.Ensias_docs.dto;

import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.Filiere;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ElementCreationFormDto {

    public ElementCreationFormDto() {
    }

    private int elm_id;
    @NotNull
    @Size(min=5)
    private String elmName;

    @NotNull
    @Size(min=5)
    private String elmModule;

    @NotNull
    @Size(min=5)
    private String elmDesc;

    @NotNull
    private String elmAnnee;

    @NotNull
    private String elmSem;

    @NotNull
    @NotEmpty
    private String[] filieres;




    public String getElmName() {
        return elmName;
    }

    public String getElmModule() {
        return elmModule;
    }

    public String getElmDesc() {
        return elmDesc;
    }

    public String getElmAnnee() {
        return elmAnnee;
    }

    public String getElmSem() {
        return elmSem;
    }

    public String[] getFilieres() {
        return filieres;
    }

    public void setFilieres(String[] filieres) {
        this.filieres = filieres;
    }

    public void setElmName(String elmName) {
        this.elmName = elmName;
    }

    public void setElmModule(String elmModule) {
        this.elmModule = elmModule;
    }

    public void setElmDesc(String elmDesc) {
        this.elmDesc = elmDesc;
    }

    public void setElmAnnee(String elmAnnee) {
        this.elmAnnee = elmAnnee;
    }

    public void setElmSem(String elmSem) {
        this.elmSem = elmSem;
    }


    //TODO : ADD FILIERE
    public Element getAsElement(){

        ArrayList<Filiere> filiereList = new ArrayList<>();
        for(String s: filieres){
            Filiere f = new Filiere();
            f.setFiliere_name(s);
            filiereList.add(f);
        }
    return new Element(elmName,elmModule,elmDesc,elmAnnee,elmSem,filiereList );
    }

    @Override
    public String toString() {
        return "ElementCreationFormDto{" +
                "elm_id=" + elm_id +
                ", elmName='" + elmName + '\'' +
                ", elmModule='" + elmModule + '\'' +
                ", elmDesc='" + elmDesc + '\'' +
                ", elmAnnee='" + elmAnnee + '\'' +
                ", elmSem='" + elmSem + '\'' +
                ", filieres=" + filieres +
                '}';
    }
}
