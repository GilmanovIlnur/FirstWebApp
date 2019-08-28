package ru.spring.boot.springexample.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import ru.spring.boot.springexample.models.Message;
import ru.spring.boot.springexample.models.Role;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.MessageRepo;
import ru.spring.boot.springexample.repositories.UserRepo;
import ru.spring.boot.springexample.security.details.UserDetailsImpl;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class ProfileService {


    @Autowired
    UserRepo userRepo;
    @Autowired
    private MessageRepo messageRepo;

    public void addMessage(String string_message, Authentication authentication) {
        if (string_message.equals("")){
            return;
        }
        UserDetailsImpl details = (UserDetailsImpl)authentication.getPrincipal();
        Message message = new Message();
        message.setAuthor(details.getUser());
        message.setText(string_message);
        message.setCreationTime(LocalDateTime.now());
        messageRepo.save(message);

    }
    public void delete(Long id){
        messageRepo.deleteById(id);
    }
    public List<User> getUsers(){
        return  userRepo.findAll();
    }

    public boolean isAdmin(Authentication authentication){
        UserDetails details = (UserDetailsImpl) authentication.getPrincipal();
        Collection<? extends GrantedAuthority> roles = details.getAuthorities();
        return roles.contains(Role.ADMIN);
    }

    public List<Message> getMessages(User user){
        return messageRepo.findAllByAuthor(user);
    }

    public User getUser(Long id){
        User user = userRepo.findById(id).orElseThrow(IllegalArgumentException::new);
        return user;
    }
    public User getUser(Authentication authentication) {
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        return details.getUser();
    }

    public Set<User> getSubs(String type, User user) {
        Set<User> subs = new HashSet<>();
        switch (type) {
            case "subscribers": {
                subs = user.getSubscribers();
                break;
            }
            case "subscriptions": {
                subs =  user.getSubscriptions();
                break;
            }
        }
        return subs;
    }
}
