package ru.spring.boot.springexample.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(Authentication authentication){
        if (authentication != null){
            return "redirect:/profile";
        }
        return "/login";
    }
}
