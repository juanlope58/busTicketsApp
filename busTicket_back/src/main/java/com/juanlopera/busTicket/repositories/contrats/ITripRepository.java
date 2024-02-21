package com.juanlopera.busTicket.repositories.contrats;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.Trip;

public interface ITripRepository extends JpaRepository<Trip, Long >{
    List<Trip> findByOriginCityIdAndDestinationCityIdAndDate(Long originCityId, Long destinationCityId, LocalDate date);
}
