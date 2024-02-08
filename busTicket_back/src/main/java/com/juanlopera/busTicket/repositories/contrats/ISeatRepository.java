package com.juanlopera.busTicket.repositories.contrats;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.Seat;

public interface ISeatRepository extends JpaRepository<Seat, Long >{
    List<Seat> findByTripId(Long tripId);
}
