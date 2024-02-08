package com.juanlopera.busTicket.services.contrats;

import java.util.List;

import com.juanlopera.busTicket.entities.User;

public interface IUserService {
    public List<User> listAll();
    public User findById(Long id);
    public User create(User user);
    public User update(Long id, User user);
    public Boolean delete(Long id);
}