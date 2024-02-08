package com.juanlopera.busTicket.services.contrats;

import java.util.List;

import com.juanlopera.busTicket.entities.Seat;

public interface ISeatService {
    public List<Seat> listAll();
    public List<Seat> findByTripId(Long tripId);
    public Seat findById(Long id);
    public Seat create(Seat seat);
    public Seat update(Long id, Seat seat);
    public Boolean delete(Long id);

}
