package ru.spring.boot.springexample.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;

@Service
public class UsersService {

    @Autowired
    private UserRepo userRepo;

    public User findByUsername(String login){
        User user = userRepo.findByLogin(login);
        return user;
    }

    public boolean checkByLogin(String login){
        User user = findByUsername(login);
        if (user == null){
            return true;
        }else{
            return false;
        }
    }

    public void save(User user){
        userRepo.save(user);
    }
}
