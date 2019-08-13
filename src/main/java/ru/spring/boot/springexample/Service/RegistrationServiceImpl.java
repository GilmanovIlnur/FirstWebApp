package ru.spring.boot.springexample.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.spring.boot.springexample.forms.UserForm;
import ru.spring.boot.springexample.models.Role;
import ru.spring.boot.springexample.models.State;
import ru.spring.boot.springexample.models.User;

import java.util.Collection;
import java.util.Collections;

@Service
public class RegistrationServiceImpl implements RegistrationService {

    @Autowired
    UsersService service;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public boolean registration(UserForm userForm) {
        boolean check = service.checkByLogin(userForm.getLogin());
        if (check){
            String hashPassword = passwordEncoder.encode(userForm.getPassword());
            User user = User.builder()
                    .login(userForm.getLogin())
                    .hashPassword(hashPassword)
                    .name(userForm.getName())
                    .lastName(userForm.getLastName())
                    .roles(Collections.singleton(Role.USER))
                    .state(State.ACTIVE)
                    .build();
            service.save(user);
        }
        return check;
    }
}
