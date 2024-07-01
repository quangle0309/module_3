package com.example.bai_tap.repositories;

import com.example.bai_tap.models.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
}
