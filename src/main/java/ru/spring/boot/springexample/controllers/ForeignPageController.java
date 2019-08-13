package ru.spring.boot.springexample.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.spring.boot.springexample.models.User;

@Controller
public class ForeignPageController {

    @GetMapping("/user/{id}")
    public String getUser(@PathVariable("id") User user, ModelMap modelMap){
        modelMap.addAttribute("user", user);
        return "foreignPage";
    }
}
