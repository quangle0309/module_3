package com.example.bai_tap.repositories;

import com.example.bai_tap.models.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    boolean deleteById(int id);

    List<Product> searchByName(String name);

    boolean updateProduct(Product product);

    Product findById(int id);
}
