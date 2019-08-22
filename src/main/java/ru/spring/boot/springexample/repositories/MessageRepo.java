package ru.spring.boot.springexample.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.spring.boot.springexample.models.Message;
import ru.spring.boot.springexample.models.User;

import java.util.List;

public interface MessageRepo extends JpaRepository<Message, Long>{
    void deleteById(Long id);
    List<Message> findAllByAuthor(User user);
}
