package com.juanlopera.busTicket.services.implementations;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juanlopera.busTicket.entities.Seat;
import com.juanlopera.busTicket.repositories.contrats.ISeatRepository;
import com.juanlopera.busTicket.services.contrats.ISeatService;

import jakarta.persistence.EntityNotFoundException;

@Service
public class SeatService implements ISeatService{

    @Autowired
    private ISeatRepository seatRepository;

    public List<Seat> listAll() {
        return seatRepository.findAll();
    }
    public List<Seat> findByTripId(Long tripId) {
        List<Seat> seats = seatRepository.findByTripId(tripId);
        seats.sort(Comparator.comparing(Seat::getId));
        return seats;
    }


    public Seat create(Seat seat) {
        return seatRepository.save(seat);
    }

    public Seat update(Long id, Seat seat) {
        if (id != null && seatRepository.existsById(id)) {
            return seatRepository.save(seat);
        } else {
            throw new EntityNotFoundException("Seat not found for id: " + id);
        }
    }

    public Boolean delete(Long id) {
        try {
            seatRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Seat findById(Long id) {
        Optional<Seat> optionalSeat = seatRepository.findById(id);
        return optionalSeat.orElse(null);
    }
}