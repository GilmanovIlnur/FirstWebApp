package ru.spring.boot.springexample.forms;

import lombok.Data;

@Data
public class PasswordEditForm {
    private String oldPassword;
    private String newPassword;
    private String repeatedNewPassword;
}
