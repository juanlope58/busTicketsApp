package com.juanlopera.busTicket.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import com.juanlopera.busTicket.entities.City;
import com.juanlopera.busTicket.repositories.contrats.ICityRepository;
import com.juanlopera.busTicket.services.contrats.ICityService;

@Service
public class CityService implements ICityService{

    @Autowired    
    private ICityRepository cityRepository;

    public ResponseEntity<List<City>> listAll(){
        try {
            List<City> cities = cityRepository.findAll();
            return ResponseEntity.ok(cities);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @Override
    public ResponseEntity<City> create(City city) {
        try {
            City newCity = cityRepository.save(city);
            return ResponseEntity.ok(newCity);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @Override
    public ResponseEntity<City> update(City city) {
        try {
            return new ResponseEntity<City>(cityRepository.save(city), HttpStatus.CREATED); 
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @Override
    public ResponseEntity<Boolean> delete(Long id) {
        try {
            cityRepository.deleteById(id);
            return new ResponseEntity<Boolean>(true, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
