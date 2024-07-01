package com.example.bai_tap.repositories.impl;

import com.example.bai_tap.models.Product;
import com.example.bai_tap.repositories.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    private static List<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1, "Iphone XR", "Điện thoại", "Apple"));
        products.add(new Product(2, "Samsung S23 Ultra", "Điện thoại", "Samsung"));
        products.add(new Product(3, "ROG Phone 8", "Điện thoại", "Asus"));
        products.add(new Product(4, "ROG Zephyrus G16 Duo", "Laptop", "Asus"));
        products.add(new Product(5, "Xiaomi mi 10pro", "Điện thoại", "Xiaomi"));
        products.add(new Product(6, "Redmi k50 gaming", "Điện thoại", "Redmi"));
        products.add(new Product(7, "Asus Vivobook 16'", "Laptop", "Asus"));
        products.add(new Product(8, "Xe đạp Thống Nhất", "Xe độp", "Thống nhất"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products);
    }

    @Override
    public void save(Product product) {
        product.setId(products.get(products.size() - 1).getId() + 1);
        products.add(product);
    }

    @Override
    public boolean deleteById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                products.remove(product);
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Product> searchByName(String keyword) {
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getName().toLowerCase().contains(keyword.toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }

    @Override
    public boolean updateProduct(int id, String name, String description, String manufacturer) {
        for (Product product : products) {
            if (product.getId() == id) {
                product.setName(name);
                product.setDescription(description);
                product.setManufacturer(manufacturer);
                return true;
            }
        }
        return false;
    }

    public Product findById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

}
