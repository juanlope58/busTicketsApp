package com.juanlopera.busTicket.services.contrats;

import java.util.List;

import com.juanlopera.busTicket.entities.Company;

public interface ICompanyService {
    public List<Company> listAll();
    public Company findById(Long id);
    public Company create(Company company);
    public Company update(Long id, Company company);
    public Boolean delete(Long id);

}
