package ru.spring.boot.springexample.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;

@Service
public class SubscribeService {
    @Autowired
    private UserRepo userRepo;

    public void subscribe(User presentUser, User subsUser){
        presentUser.getSubscriptions().add(subsUser);
        userRepo.save(presentUser);


    }

    public void unSubscribe(User presentUser, User unSubsUser){
        System.out.println(presentUser.getSubscriptions().size());
        presentUser.getSubscriptions().remove(unSubsUser);
        userRepo.save(presentUser);
        System.out.println(presentUser.getSubscriptions().size());
        System.out.println(presentUser.getSubscribers().size());

    }
}
