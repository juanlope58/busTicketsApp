package com.juanlopera.busTicket.services.contrats;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.juanlopera.busTicket.entities.City;

public interface ICityService {
    public ResponseEntity<List<City>> listAll();
    public ResponseEntity<City> create(City city);
    public ResponseEntity<City> update(City city);
    public ResponseEntity<Boolean> delete(Long id);

}
