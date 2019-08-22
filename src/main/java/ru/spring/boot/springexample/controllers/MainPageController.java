package ru.spring.boot.springexample.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import ru.spring.boot.springexample.models.Message;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;

import java.time.LocalDateTime;

@Controller
public class MainPageController {
    @Autowired
    UserRepo userRepo;

    @GetMapping("/")
    public String mainPage() {
        return "MainPage";
    }
}