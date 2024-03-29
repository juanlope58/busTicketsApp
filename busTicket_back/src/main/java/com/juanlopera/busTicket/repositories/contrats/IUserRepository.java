package com.juanlopera.busTicket.repositories.contrats;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.User;

public interface IUserRepository extends JpaRepository<User, Long >{
    Optional<User> findByUsername(String username);
}
