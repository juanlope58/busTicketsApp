package com.juanlopera.busTicket.repositories.contrats;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.Booking;

public interface IBookingRepository extends JpaRepository<Booking, Long >{
    
}
