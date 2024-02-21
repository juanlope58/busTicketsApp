// package com.juanlopera.busTicket.controllers;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;

// import com.juanlopera.busTicket.dto.LoginRequest;
// import com.juanlopera.busTicket.entities.User;
// import com.juanlopera.busTicket.services.implementations.AuthService;


// @RestController
// @RequestMapping("/api/auth")
// public class AuthController {

//     @Autowired
//     private AuthService authService;

//     @PostMapping
//     public ResponseEntity<User> login(@RequestBody LoginRequest loginRequest) {
//         String username = loginRequest.getUsername();
//         String password = loginRequest.getPassword();

//         User user = authService.login(username, password);

//         if (user != null) {

//             return ResponseEntity.ok(user);
//         } else {
//             System.out.println(user);
//             return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
//         }
//     }

// }