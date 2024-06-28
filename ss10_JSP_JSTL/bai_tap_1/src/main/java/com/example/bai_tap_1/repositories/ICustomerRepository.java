package com.example.bai_tap_1.repositories;

import com.example.bai_tap_1.models.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll ();
}
