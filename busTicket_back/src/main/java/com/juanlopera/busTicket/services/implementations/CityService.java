package com.juanlopera.busTicket.services.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.juanlopera.busTicket.entities.City;
import com.juanlopera.busTicket.repositories.contrats.ICityRepository;
import com.juanlopera.busTicket.services.contrats.ICityService;

import jakarta.persistence.EntityNotFoundException;

@Service
public class CityService implements ICityService{

    @Autowired    
    private ICityRepository cityRepository;

    public List<City> listAll(){
            List<City> cities = cityRepository.findAll();
            return cities;
    }

    @Override
    public City create(City city) {
            City newCity = cityRepository.save(city);
            return newCity;

    }

    @Override
    public City update(Long id, City city) {
        if(cityRepository.existsById(id)){
            city.setId(id);
            return cityRepository.save(city); 
        }
        return null;

    }

    @Override
    public Boolean delete(Long id) {

        if(findById(id) != null){

            cityRepository.deleteById(id);
            return true;
        }else{
            throw new EntityNotFoundException("City does not exist");
        }
        
    }

    @Override
    public City findById(Long id) {
        return cityRepository.findById(id).orElseThrow(()-> new EntityNotFoundException("city not founded"));
    }


}
