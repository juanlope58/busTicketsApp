package com.juanlopera.busTicket.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.juanlopera.busTicket.dto.TripRequest;
import com.juanlopera.busTicket.entities.Trip;
import com.juanlopera.busTicket.services.contrats.ITripService;

import jakarta.persistence.EntityNotFoundException;

@RestController
@RequestMapping("/api/trips")
public class TripController {

    @Autowired
    private ITripService tripService;

    private static final Logger logger = LoggerFactory.getLogger(TripController.class);

    @GetMapping
    public ResponseEntity<List<Trip>> getAllTrips() {
        try {
            List<Trip> trips = tripService.listAll();
            logger.info("Returned {} trips", trips.size());
            return ResponseEntity.ok(trips);
        } catch (EntityNotFoundException e) {
            logger.error("Entity not found exception: {}", e.getMessage());
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            logger.error("Unexpected exception: {}", e.getMessage());
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Trip> getTrip(@PathVariable Long id) {
        try {
            Trip trip = tripService.findById(id);
            return new ResponseEntity<Trip>(trip, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @PostMapping
    public ResponseEntity<Trip> registerTrip(@RequestBody TripRequest tripRequest) {
        try {
            Trip newTrip = tripService.create(tripRequest);

            return new ResponseEntity<>(newTrip, HttpStatus.CREATED);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Trip> updateTrip(@PathVariable Long id, @RequestBody Trip trip) {
        try {
            Trip updatedTrip = tripService.update(id, trip);
            return new ResponseEntity<>(updatedTrip, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> deleteTrip(@PathVariable Long id) {
        try {
            boolean isDeleted = tripService.delete(id);
            return new ResponseEntity<>(isDeleted, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}