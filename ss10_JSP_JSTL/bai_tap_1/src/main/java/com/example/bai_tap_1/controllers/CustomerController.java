package com.example.bai_tap_1.controllers;

import com.example.bai_tap_1.models.Customer;
import com.example.bai_tap_1.services.ICustomerService;
import com.example.bai_tap_1.services.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "CustomerController", urlPatterns = "/customer")
public class CustomerController extends HttpServlet {
    private static ICustomerService customerService = new CustomerService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers =customerService.findAll();
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("/customer/list.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
