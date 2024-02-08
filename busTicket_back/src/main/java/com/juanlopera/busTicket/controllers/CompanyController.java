package com.juanlopera.busTicket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.juanlopera.busTicket.entities.Company;
import com.juanlopera.busTicket.services.contrats.ICompanyService;

import java.util.List;

@RestController
@RequestMapping("/api/companies")
public class CompanyController {

    @Autowired
    private ICompanyService companyService;

    @GetMapping
    public ResponseEntity<List<Company>> getAllCompanies() {
        try {
            List<Company> companies = companyService.listAll();
            return ResponseEntity.ok(companies);
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Internal Server Error
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Company> getCompanyById(@PathVariable Long id) {
        try {
            Company company = companyService.findById(id);
            return company != null ? ResponseEntity.ok(company) : ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Internal Server Error
        }
    }

    @PostMapping
    public ResponseEntity<Company> createCompany(@RequestBody Company company) {
        try {
            Company newCompany = companyService.create(company);
            return ResponseEntity.ok(newCompany);
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Internal Server Error
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Company> updateCompany(@PathVariable Long id, @RequestBody Company updatedCompany) {
        try {
            Company company = companyService.update(id, updatedCompany);
            return company != null ? ResponseEntity.ok(company) : ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Internal Server Error
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCompany(@PathVariable Long id) {
        try {
            return companyService.delete(id)
                    ? ResponseEntity.noContent().build()
                    : ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Internal Server Error
        }
    }
}
