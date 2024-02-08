package com.juanlopera.busTicket.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juanlopera.busTicket.dto.TripRequest;
import com.juanlopera.busTicket.entities.City;
import com.juanlopera.busTicket.entities.Company;
import com.juanlopera.busTicket.entities.Seat;
import com.juanlopera.busTicket.entities.Trip;
import com.juanlopera.busTicket.repositories.contrats.ITripRepository;
import com.juanlopera.busTicket.services.contrats.ICityService;
import com.juanlopera.busTicket.services.contrats.ICompanyService;
import com.juanlopera.busTicket.services.contrats.ITripService;

import jakarta.persistence.EntityNotFoundException;

import java.util.ArrayList;
import java.util.List;

@Service
public class TripService implements ITripService{

    @Autowired
    private ICompanyService companyService;

    @Autowired
    private ICityService cityService;

    @Autowired
    private ITripRepository tripRepository;

    public List<Trip> listAll() {
        try {
            return tripRepository.findAll();
            
        } catch (Exception e) {
            throw new EntityNotFoundException("Qué desespero");
        }
    }

    public Trip findById(Long id) {
        return tripRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Trip not found"));
    }

    
    public Trip create(TripRequest tripRequest) {
        City originCity = cityService.findById(tripRequest.getOriginCityId());
        City destinationCity = cityService.findById(tripRequest.getDestinationCityId());
        Company company = companyService.findById(tripRequest.getCompanyId());

        Trip newTrip = new Trip();
        newTrip.setOriginCity(originCity);
        newTrip.setDestinationCity(destinationCity);
        newTrip.setDate(tripRequest.getDate());
        newTrip.setHour(tripRequest.getHour());
        newTrip.setCompany(company);

        List<Seat> seats = new ArrayList<>();

        for (int i = 0; i < tripRequest.getNumberOfSeats(); i++) {
            Seat seat = new Seat();
            seat.setAvailable(true);
            seat.setIdentifier("P"+(i+1));
            seat.setTrip(newTrip);
            newTrip.addSeat(seat);
            seats.add(seat);
        }

        newTrip.setSeats(seats);

        return tripRepository.save(newTrip);
    }

    public Trip update(Long id, Trip trip) {
        if (tripRepository.existsById(id)) {
            trip.setId(id);
            return tripRepository.save(trip);
        } else {
            throw new EntityNotFoundException("Trip not found");
        }
    }

    public Boolean delete(Long id) {
        if (tripRepository.existsById(id)) {
            tripRepository.deleteById(id);
            return true;
        } else {
            throw new EntityNotFoundException("Trip not found");
        }
    }
}