package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;

import java.util.List;

@Controller
public class HelloController {

    @Autowired
    UserRepo userRepo;

    @GetMapping("/hello")
    public String hello(@RequestParam(name = "name",required = false, defaultValue = "World") String name, ModelMap model){
        List<User> list = userRepo.findAll();
        model.addAttribute("users", list);
        return "hello";
    }


}
