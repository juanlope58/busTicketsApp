package com.juanlopera.busTicket.controllers;

import com.juanlopera.busTicket.entities.City;
import com.juanlopera.busTicket.services.CityService;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/api/city")
public class CityController {
    
    @Autowired
    private CityService cityService;

    @GetMapping("/cities")
    public ResponseEntity<List<City>> getAllCities() {
        return this.cityService.listAll();
    }

    @PostMapping("/register")
    public ResponseEntity<City> registerCity(@RequestBody City city) {
        return cityService.create(city);

    }

    @PutMapping("/update")
    public ResponseEntity<City> updateCity(@RequestBody City city) {
        return cityService.update(city);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Boolean> deleteCity(@PathVariable Long id){
        return cityService.delete(id);
    }



    
    
}
