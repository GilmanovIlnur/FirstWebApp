package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.spring.boot.springexample.Service.EditService;
import ru.spring.boot.springexample.forms.EditForm;
import ru.spring.boot.springexample.forms.PasswordEditForm;
import ru.spring.boot.springexample.models.Role;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;
import ru.spring.boot.springexample.security.details.UserDetailsImpl;

import java.util.Set;


@Controller
public class EditController {

    @Autowired
    EditService editService;


    @GetMapping("/profile/users/{id}")
    public String userEdit(@PathVariable("id") User editUser, ModelMap modelMap,
                           Authentication authentication){
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        modelMap.addAttribute("roles", Role.values());
        if (details.getUser().isAdmin() && !editUser.equals(details.getUser())){
            modelMap.addAttribute("isAdmin", true);
        }

        modelMap.addAttribute("user",editUser);
        return "userEdit";
    }

    @PostMapping("/profile/users/{id}")
    public String edit(@PathVariable("id") User user,
                       EditForm editForm,
                       @RequestParam(required = false) Set<Role> roles){
        editService.edit(user,editForm,roles);

        return "redirect:/profile/users";
    }

    @GetMapping("/profile/changePassword/{id}")
    public String getchangePasswordPage(@PathVariable("id") User user,
                                 ModelMap modelMap){
        modelMap.addAttribute("user", user);
        return "changePassword";
    }

    @PostMapping("/profile/changePassword/{id}")
    public  String changePassword(@PathVariable("id") User user,
                                   PasswordEditForm editForm,
                                  ModelMap modelMap){
        String condition = editService.changePassword(user, editForm, modelMap);
        modelMap.addAttribute("user",user);
        modelMap.addAttribute("condition",condition);
        return "changePassword";
    }

}
