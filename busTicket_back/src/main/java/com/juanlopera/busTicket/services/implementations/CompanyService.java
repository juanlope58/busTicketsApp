package com.juanlopera.busTicket.services.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juanlopera.busTicket.entities.Company;
import com.juanlopera.busTicket.repositories.contrats.ICompanyRepository;
import com.juanlopera.busTicket.services.contrats.ICompanyService;

import jakarta.persistence.EntityNotFoundException;

@Service
public class CompanyService implements ICompanyService {

    @Autowired
    private ICompanyRepository companyRepository;

    public List<Company> listAll() {
        return companyRepository.findAll();
    }

    public Company findById(Long id) {
        return companyRepository.findById(id).orElse(null);
    }

    public Company create(Company company) {
        return companyRepository.save(company);
    }

    public Company update(Long id, Company updatedCompany) {
        Company existingCompany = companyRepository.findById(id).orElse(null);
        if (existingCompany != null) {
            existingCompany.setCompany_name(updatedCompany.getCompany_name());

            return companyRepository.save(existingCompany);
        }
        return null; // O podrías lanzar una excepción indicando que la compañía no existe
    }

    public Boolean delete(Long id) {
        Company company = companyRepository.findById(id).orElse(null);
        if (company != null) {
            companyRepository.deleteById(id);
            return true;
        }
        throw new EntityNotFoundException("Company does not exist");
    }
}