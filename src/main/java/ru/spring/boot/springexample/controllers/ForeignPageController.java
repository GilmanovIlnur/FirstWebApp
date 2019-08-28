package ru.spring.boot.springexample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.spring.boot.springexample.Service.ProfileService;
import ru.spring.boot.springexample.Service.SubscribeService;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.security.details.UserDetailsImpl;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ForeignPageController {

    @Autowired
    SubscribeService subscribeService;
    @Autowired
    ProfileService profileService;

    @GetMapping("/user/{id}")
    public String getUser(@PathVariable("id") User user, ModelMap modelMap, Authentication authentication){
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("messages", profileService.getMessages(user));
        modelMap.addAttribute("currentUser", profileService.getUser(details.getId()));
        modelMap.addAttribute("subscriptions",profileService.getUser(user.getId()).getSubscriptions());
        modelMap.addAttribute("subscribers",profileService.getUser(user.getId()).getSubscribers());
        return "foreignPage";
    }

    @PostMapping("/user/subscribe/{id}")
    public String subscribe(@PathVariable("id") User user, Authentication authentication,
                            HttpServletRequest httpServletRequest){
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        User presentUser = details.getUser();
        subscribeService.subscribe(presentUser, user);
        return "redirect:" + httpServletRequest.getHeader("referer");
    }

    @PostMapping("/user/unsubscribe/{userId}")
    public String unsubscribe(@PathVariable("userId") User user, Authentication authentication, HttpServletRequest httpServletRequest){
        String lastURL= httpServletRequest.getHeader("referer");
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        User presentUser = details.getUser();
        subscribeService.unSubscribe(presentUser,user);
        return "redirect:" + lastURL;
    }


}

