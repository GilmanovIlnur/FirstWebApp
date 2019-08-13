package ru.spring.boot.springexample.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.spring.boot.springexample.models.Message;

import java.util.List;

public interface MessageRepo extends JpaRepository<Message, Long> {
    List<Message> findByAuthor_Id(Long id);
}
