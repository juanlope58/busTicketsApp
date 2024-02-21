package com.juanlopera.busTicket.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.juanlopera.busTicket.entities.Seat;
import com.juanlopera.busTicket.services.contrats.ISeatService;

@RestController
@RequestMapping("/api/seats")
public class SeatController {

    @Autowired
    private ISeatService seatService;

    @GetMapping
    public ResponseEntity<List<Seat>> getAllSeats() {
        try {
            List<Seat> seats = seatService.listAll();
            return new ResponseEntity<>(seats, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/byTrip/{tripId}")
    public ResponseEntity<List<Seat>> getSeatsByTrip(@PathVariable Long tripId) {
        try {
            
            return new ResponseEntity<>(seatService.findByTripId(tripId), HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Seat> getSeat(@PathVariable Long id) {
        try {
            Seat seat = seatService.findById(id);
            return new ResponseEntity<>(seat, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @PostMapping
    public ResponseEntity<Seat> registerSeat(@RequestBody Seat seat) {
        try {
            Seat newSeat = seatService.create(seat);
            return new ResponseEntity<>(newSeat, HttpStatus.CREATED);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Seat> updateSeat(@PathVariable Long id, @RequestBody Seat seat) {
        try {
            return new ResponseEntity<Seat>(seatService.update(id, seat), HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> deleteSeat(@PathVariable Long id) {
        try {
            return new ResponseEntity<>(seatService.delete(id), HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}