package com.juanlopera.busTicket.services.contrats;

import java.time.LocalDate;
import java.util.List;

import com.juanlopera.busTicket.dto.TripRequest;
import com.juanlopera.busTicket.entities.Trip;

public interface ITripService {
    public List<Trip> listAll();
    public Trip findById(Long id);
    public Trip create(TripRequest tripRequest);
    public Trip update(Long id, Trip trip);
    public Boolean delete(Long id);
    public List<Trip> getFilteredTrips(Long originCityId, Long destinationCityId, LocalDate date);
}