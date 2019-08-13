package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.spring.boot.springexample.Service.RegistrationService;
import ru.spring.boot.springexample.forms.UserForm;

@Controller
public class RegistrationController {

    @Autowired
    RegistrationService service;

    @GetMapping("/registration")
    public String login(){
        return "registration";
    }

    @PostMapping("/registration")
    public String log(ModelMap map, UserForm userForm){
        boolean check = service.registration(userForm);
        if (check){
            return "/login";
        }
        map.addAttribute( "message", true);
        return "registration";
    }
}
