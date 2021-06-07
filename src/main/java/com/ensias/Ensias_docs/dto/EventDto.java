package com.ensias.Ensias_docs.dto;

import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.models.todos;
import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
public class EventDto {

    public EventDto(todos todo){
        event_id = todo.getTodo_id();
        event_name = todo.getTitle();
        event_description = todo.getDescription();
        event_start = todo.getDelaiAsDate().toString();
        event_end = todo.getDelaiAsDate().toString();
        event_type = "todo";
        event_icon = "laptop-code";
        event_class = "fc-bg-default";
    }
    public EventDto(Element element){
        event_id = element.getElm_id();
        event_name = element.getElmName();
        event_description ="Examen : " + element.getElmName();
        event_type = "examen";
        event_icon = "laptop-code";
        event_class = "fc-bg-default";
        event_start = element.getDateExam().toString();
        event_end = element.getDateExam().toString();
    }

    @Min(value = 1)
    private int event_id;
    @NotNull
    @Size(min = 3)
    private String event_name;

    private String event_description;
    private String event_type;
    @NotNull
    @Size(min = 5)
    private String event_start;
    private String event_end;
    private String event_class;
    private String event_icon;
}
