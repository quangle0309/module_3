package com.example.bai_tap_1.services;

public interface IService {
    public double discountAmount (double listPrice, double discountPercent);
    public double discountPrice(double listPrice, double discountAmount);
}
