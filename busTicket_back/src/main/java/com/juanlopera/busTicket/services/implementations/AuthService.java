// package com.juanlopera.busTicket.services.implementations;

// import java.util.Optional;

// import org.springframework.stereotype.Service;

// import com.juanlopera.busTicket.entities.User;
// import com.juanlopera.busTicket.repositories.contrats.IUserRepository;

// @Service
// public class AuthService {

//     private final IUserRepository userRepository;

//     public AuthService(IUserRepository userRepository) {
//         this.userRepository = userRepository;
//     }

//     public User login(String username, String password) {
//         Optional<User> userOptional = userRepository.findByUsernameAndPassword(username, password);

//         return userOptional.orElse(null);
//     }
// }