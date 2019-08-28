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
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.security.details.UserDetailsImpl;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ProfileController {
    @Autowired
    ProfileService profileService;

    @GetMapping("/profile")
    public String getProfilePage(Authentication authentication, ModelMap model,
                                 HttpServletRequest httpServletRequest){

        if (authentication == null){
            return "redirect:/login";
        }
        UserDetailsImpl details = (UserDetailsImpl)authentication.getPrincipal();
        Long userId = details.getId();
        model.addAttribute("isAdmin", profileService.isAdmin(authentication));
        model.addAttribute("messages", profileService.getMessages(details.getUser()));
        model.addAttribute("subscriptions",profileService.getUser(userId).getSubscriptions());
        model.addAttribute("subscribers",profileService.getUser(userId).getSubscribers());
        model.addAttribute("user", profileService.getUser(userId));
        return "profile";

    }
    @PostMapping("/add")
    public String addMessage(@RequestParam(name = "message") String message, Authentication authentication){
        profileService.addMessage(message, authentication);
        return "redirect:/profile";
    }

    @PostMapping("/delete/{id}")
    public String deleteMessage(@PathVariable Long id){
        profileService.delete(id);
        return "redirect:/profile";
    }



    @GetMapping("/profile/users")
    public String getUsers(ModelMap modelMap, Authentication authentication){
        modelMap.addAttribute("users", profileService.getUsers());
        boolean isAdmin = profileService.isAdmin(authentication);
        modelMap.addAttribute("currentUser",profileService.getUser(authentication));
        if (isAdmin) {
            modelMap.addAttribute("admin", true);
        }
        return "users";
    }

    @GetMapping("/{type}/{id}")
    public String getSubscrbrs(@PathVariable String type,
                               @PathVariable("id") User user,
                               ModelMap modelMap,
                               Authentication authentication){
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        modelMap.addAttribute("currentUser", details.getUser());
        modelMap.addAttribute("subs",
                profileService.getSubs(type, user));
        switch (type) {
            case "subscriptions" :{
                modelMap.addAttribute("type", "Подписки");
                break;
            }
            case "subscribers" :{
                modelMap.addAttribute("type", "Подписчики");
                break;
            }
        }
        return "subs";
    }

}
