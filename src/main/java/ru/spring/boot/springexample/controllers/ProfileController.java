package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.spring.boot.springexample.Service.ProfileService;

@Controller
public class ProfileController {
    @Autowired
    ProfileService profileService;

    @GetMapping("/profile")
    public String getProfilePage(Authentication authentication, ModelMap model){
        if (authentication == null){
            return "redirect:/login";
        }
        model.addAttribute("isAdmin", profileService.isAdmin(authentication));
        model.addAttribute("messages", profileService.getMessages(authentication));
        model.addAttribute("subscriptions",profileService.getUser(authentication).getSubscriptions());
        model.addAttribute("subscribers",profileService.getUser(authentication).getSubscribers());
        model.addAttribute("user", profileService.getUser(authentication));
        return "profile";

    }
    @PostMapping("/add")
    public String addMessage(@RequestParam(name = "message") String message, Authentication authentication){
        profileService.addMessage(message, authentication);
        return "redirect:/profile";
    }

    @PostMapping("/delete/{id}")
    public String deleteMessage(@PathVariable Long id,Authentication authentication){
        profileService.delete(id);
        return "redirect:/profile";
    }



    @GetMapping("/profile/users")
    public String getUsers(ModelMap modelMap){
        modelMap.addAttribute("users", profileService.getUsers());
        return "users";
    }
}
