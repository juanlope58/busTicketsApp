package com.juanlopera.busTicket.services.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juanlopera.busTicket.entities.User;
import com.juanlopera.busTicket.repositories.contrats.IUserRepository;
import com.juanlopera.busTicket.services.contrats.IUserService;

import jakarta.persistence.EntityNotFoundException;

@Service
public class UserService implements IUserService{

    @Autowired    
    private IUserRepository userRepository;

    public List<User> listAll(){
        return userRepository.findAll();
    }

    public User create(User user) {
        return userRepository.save(user);
    }

    public User update(Long id, User user) {
        if (userRepository.existsById(id)) {
            user.setId(id);
            return userRepository.save(user);
        } else {
            throw new EntityNotFoundException("User not found for id: " + id);
        }
    }

    public Boolean delete(Long id) {
        if(findById(id) != null){
            userRepository.deleteById(id);
            return true;
        } else {
            throw new EntityNotFoundException("User not found for id: " + id);
        }
    }

    public User findById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("User not found"));
    }
}