package com.juanlopera.busTicket.services.contrats;

import java.util.List;

import com.juanlopera.busTicket.entities.City;

public interface ICityService {
    public List<City> listAll();
    public City findById(Long id);
    public City create(City city);
    public City update(Long id, City city);
    public Boolean delete(Long id);

}
