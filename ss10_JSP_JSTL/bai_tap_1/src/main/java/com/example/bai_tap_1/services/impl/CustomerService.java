package com.example.bai_tap_1.services.impl;

import com.example.bai_tap_1.models.Customer;
import com.example.bai_tap_1.repositories.ICustomerRepository;
import com.example.bai_tap_1.repositories.impl.CustomerRepository;
import com.example.bai_tap_1.services.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private static ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
