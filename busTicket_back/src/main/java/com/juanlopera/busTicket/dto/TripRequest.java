package com.juanlopera.busTicket.dto;

import java.time.LocalDate;

public class TripRequest {
    private Long originCityId;
    private Long destinationCityId;
    private LocalDate date;
    private String hour;
    private Long companyId;
    private int numberOfSeats;


    public TripRequest() {
    }

    public Long getOriginCityId() {
        return originCityId;
    }

    public void setOriginCityId(Long originCityId) {
        this.originCityId = originCityId;
    }

    public Long getDestinationCityId() {
        return destinationCityId;
    }

    public void setDestinationCityId(Long destinationCityId) {
        this.destinationCityId = destinationCityId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    
}

    