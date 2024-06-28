package com.example.bai_tap_1.controllers;

import com.example.bai_tap_1.services.impl.DiscountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "DiscountServlet", urlPatterns = "/display-discount")
public class DiscountServlet extends HttpServlet {
    private DiscountService discountService = new DiscountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            double listPrice = Double.parseDouble(req.getParameter("listPrice"));
            double discountPercent = Double.parseDouble(req.getParameter("discountPercent"));

            double discountAmount = discountService.discountAmount(listPrice, discountPercent);
            double discountPrice = discountService.discountPrice(listPrice, discountAmount);

            req.setAttribute("listPrice", listPrice);
            req.setAttribute("discountPercent", discountPercent);
            req.setAttribute("discountAmount", discountAmount);
            req.setAttribute("discountPrice", discountPrice);
            RequestDispatcher dispatcher = req.getRequestDispatcher("display-discount.jsp");
            dispatcher.forward(req, resp);

    }
}
