package com.juanlopera.busTicket.repositories.contrats;

import org.springframework.data.jpa.repository.JpaRepository;

import com.juanlopera.busTicket.entities.Company;

public interface ICompanyRepository extends JpaRepository<Company,Long> {
    
}
