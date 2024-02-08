package com.juanlopera.busTicket.services.implementations;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juanlopera.busTicket.dto.BookingRequest;
import com.juanlopera.busTicket.entities.Booking;
import com.juanlopera.busTicket.entities.Seat;
import com.juanlopera.busTicket.repositories.contrats.IBookingRepository;
import com.juanlopera.busTicket.services.contrats.IBookingService;
import com.juanlopera.busTicket.services.contrats.ISeatService;
import com.juanlopera.busTicket.services.contrats.ITripService;
import com.juanlopera.busTicket.services.contrats.IUserService;

import jakarta.persistence.EntityNotFoundException;

@Service
public class BookingService implements IBookingService{

    @Autowired    
    private IBookingRepository bookingRepository;

    @Autowired
    private ITripService tripService;

    @Autowired
    private IUserService userService;

    @Autowired
    private ISeatService seatService;

    public List<Booking> listAll(){
        return bookingRepository.findAll();
    }

    public Booking create(BookingRequest bookingRequest) {
        Seat newSeat = seatService.findById(bookingRequest.getSeatId());
        Booking newBooking = new Booking();
        newBooking.setTrip(tripService.findById(bookingRequest.getTripId()));
        newBooking.setSeat(seatService.findById(bookingRequest.getSeatId()));
        newBooking.setUser(userService.findById(bookingRequest.getUserId()));
        newSeat.setAvailable(false);
        
        return bookingRepository.save(newBooking);
    }

    public Booking update(Long id, Booking booking) {
        
        if (bookingRepository.existsById(id)) {
            booking.setId(id);
            return bookingRepository.save(booking);
        } else {
            throw new EntityNotFoundException("Booking not found for id: " + id);
        }
    }

    public Boolean delete(Long id) {
        if(findById(id) != null){
            bookingRepository.deleteById(id);
            return true;
        } else {
            throw new EntityNotFoundException("Booking not found for id: " + id);
        }
    }

    public Booking findById(Long id) {
        return bookingRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Booking not found"));
    }
}