package com.juanlopera.busTicket.services.contrats;

import java.util.List;

import com.juanlopera.busTicket.dto.BookingRequest;
import com.juanlopera.busTicket.entities.Booking;

public interface IBookingService {
    public List<Booking> listAll();
    public Booking findById(Long id);
    public Booking create(BookingRequest bookingRequest);
    public Booking update(Long id, Booking booking);
    public Boolean delete(Long id);

}