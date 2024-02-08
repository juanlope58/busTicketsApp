package com.juanlopera.busTicket.repositories.contrats;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.User;

public interface IUserRepository extends JpaRepository<User, Long >{
    
}
