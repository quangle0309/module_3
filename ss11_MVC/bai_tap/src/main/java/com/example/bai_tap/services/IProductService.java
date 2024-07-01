package com.example.bai_tap.services;

import com.example.bai_tap.models.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void add(Product product);

    boolean removeById(int id);

    List<Product> searchByName(String name);

    boolean updateProduct(int id, String name, String description, String manufacturer);

    Product findById(int id);
}