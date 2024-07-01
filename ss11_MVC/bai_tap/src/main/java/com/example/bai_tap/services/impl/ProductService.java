package com.example.bai_tap.services.impl;

import com.example.bai_tap.models.Product;
import com.example.bai_tap.repositories.IProductRepository;
import com.example.bai_tap.repositories.impl.ProductRepository;
import com.example.bai_tap.services.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productService = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productService.findAll();
    }
}
