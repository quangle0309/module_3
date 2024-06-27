package com.example.bai_tap_1.services.impl;

import com.example.bai_tap_1.services.IService;

public class DiscountService implements IService {

    @Override
    public double discountAmount(double listPrice, double discountPercent) {
        return listPrice * (discountPercent/100);
    }

    @Override
    public double discountPrice(double listPrice, double discountAmount) {
        return listPrice - discountAmount;
    }
}
