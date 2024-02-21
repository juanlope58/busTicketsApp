package com.juanlopera.busTicket.repositories.contrats;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.juanlopera.busTicket.entities.Role;

@Repository
public interface IRoleRepository extends JpaRepository<Role, Long> {
    
}
