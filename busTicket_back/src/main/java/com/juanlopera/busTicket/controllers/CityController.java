package com.juanlopera.busTicket.controllers;

import com.juanlopera.busTicket.entities.City;
import com.juanlopera.busTicket.services.contrats.ICityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@RestController
@RequestMapping("/api/cities")
public class CityController {
    
    @Autowired
    private ICityService cityService;

    @GetMapping
    public ResponseEntity<List<City>> getAllCities() {

        try {
            List<City> cities = cityService.listAll();
            return new ResponseEntity<List<City>>(cities, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<City> getCity(@PathVariable Long id) {

        try {
            City city = cityService.findById(id);
            return new ResponseEntity<City>(city, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @PostMapping
    public ResponseEntity<City> registerCity(@RequestBody City city) {
        try {
            City newCity = cityService.create(city);
            return new ResponseEntity<City>(newCity, HttpStatus.CREATED);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<City> updateCity(@PathVariable Long id, @RequestBody City city) {
        
        try {
            return new ResponseEntity<City>(cityService.update(id, city),HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> deleteCity(@PathVariable Long id){

        try {
            return new ResponseEntity<>(cityService.delete(id), HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
