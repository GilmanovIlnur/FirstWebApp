package ru.spring.boot.springexample.Service;

import ru.spring.boot.springexample.forms.UserForm;

public interface RegistrationService {
    boolean registration(UserForm userForm);
}
