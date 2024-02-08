package com.juanlopera.busTicket.repositories.contrats;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.Trip;

public interface ITripRepository extends JpaRepository<Trip, Long >{
    
}
