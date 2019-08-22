package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.spring.boot.springexample.Service.SubscribeService;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;
import ru.spring.boot.springexample.security.details.UserDetailsImpl;

@Controller
public class ForeignPageController {

    @Autowired
    SubscribeService subscribeService;

    @Autowired
    UserRepo userRepo;

    @GetMapping("/user/{id}")
    public String getUser(@PathVariable("id") User user, ModelMap modelMap){
        modelMap.addAttribute("user", user);
        return "foreignPage";
    }

    @PostMapping("/user/{id}")
    public String subscribe(@PathVariable("id") User user, Authentication authentication){
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        User presentUser = details.getUser();
        subscribeService.subscribe(presentUser, user);
        return "redirect:/user/" + user.getId();
    }


}

