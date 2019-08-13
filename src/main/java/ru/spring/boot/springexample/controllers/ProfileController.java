package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.spring.boot.springexample.forms.EditForm;
import ru.spring.boot.springexample.models.Message;
import ru.spring.boot.springexample.models.Role;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.MessageRepo;
import ru.spring.boot.springexample.repositories.UserRepo;
import ru.spring.boot.springexample.security.details.UserDetailsImpl;

import javax.swing.text.DateFormatter;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Controller
public class ProfileController {
    @Autowired
    UserRepo userRepo;
    @Autowired
    MessageRepo messageRepo;
    @Autowired
    PasswordEncoder passwordEncoder;


    @GetMapping("/profile")
    public String getProfilePage(Authentication authentication, ModelMap model){
        if (authentication == null){
            return "redirect:/login";
        }
        UserDetails details = (UserDetailsImpl) authentication.getPrincipal();
        Collection<? extends GrantedAuthority> roles = details.getAuthorities();
        boolean isAdmin = roles.contains(Role.ADMIN);
        model.addAttribute("isAdmin", isAdmin);
        List<Message> list = messageRepo.findByAuthor_Id(((UserDetailsImpl) details).getId());
        model.addAttribute("messages", list);
        model.addAttribute("user", ((UserDetailsImpl) details).getUser());
        return "profile";

    }
    @PostMapping("/add")
    public String addMessage(@RequestParam(name = "message") String string_message, Authentication authentication){
        if (string_message.equals("")){
            return "redirect:/profile";
        }
        UserDetailsImpl details = (UserDetailsImpl)authentication.getPrincipal();
        Message message = new Message();
        message.setAuthor(details.getUser());
        message.setText(string_message);
        message.setCreationTime(LocalDateTime.now());
        messageRepo.save(message);

        return "redirect:/profile";
    }

    @PostMapping("/delete/{id}")
    public String deleteMessage(@PathVariable Long id){
        messageRepo.deleteById(id);
        return "redirect:/profile";
    }



    @GetMapping("/profile/users")
    public String getUsers(ModelMap modelMap){
        modelMap.addAttribute("users", userRepo.findAll());
        return "users";
    }




}
