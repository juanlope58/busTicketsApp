package com.juanlopera.busTicket.repositories.contrats;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.City;

public interface ICityRepository extends JpaRepository<City, Long > {
    
}
