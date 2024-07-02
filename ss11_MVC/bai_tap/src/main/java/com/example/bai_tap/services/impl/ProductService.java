package com.example.bai_tap.services.impl;

import com.example.bai_tap.models.Product;
import com.example.bai_tap.repositories.IProductRepository;
import com.example.bai_tap.repositories.impl.ProductRepository;
import com.example.bai_tap.services.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository= new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.save(product);
    }

    @Override
    public boolean removeById(int id) {
        return productRepository.deleteById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }

    @Override
    public boolean updateProduct(Product product) {
        return productRepository.updateProduct(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}
