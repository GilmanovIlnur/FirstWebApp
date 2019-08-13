package ru.spring.boot.springexample.repositories;



import org.springframework.data.jpa.repository.JpaRepository;

import ru.spring.boot.springexample.models.User;

import java.util.List;
import java.util.Optional;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByLogin(String login);
    Optional<User> findOneByLogin(String login);
}
