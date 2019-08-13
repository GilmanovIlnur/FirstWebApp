package ru.spring.boot.springexample.forms;

import lombok.Data;

@Data
public class UserForm {

    private String name;
    private String lastName;
    private String login;
    private String password;

}
