package com.example.bai_tap.repositories.impl;

import com.example.bai_tap.models.Product;
import com.example.bai_tap.repositories.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnection();
            String sql = "select * from products";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String name;
            String description;
            String manufacturer;
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                name = resultSet.getString("name");
                description = resultSet.getString("description");
                manufacturer = resultSet.getString("manufacturer");
                products.add(new Product(id, name, description, manufacturer));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    @Override
    public void save(Product product) {
        try {
            Connection connection = BaseRepository.getConnection();
            String sql = "insert into products (name, description, manufacturer) values(?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setString(3, product.getManufacturer());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteById(int id) {
        boolean isDeleted;
        try {
            Connection connection = BaseRepository.getConnection();
            String sql = "delete from products where id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            isDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isDeleted;
    }

    @Override
    public List<Product> searchByName(String keyword) {
        List<Product> result = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnection();
            String sql = "select * from products where name like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String manufacturer = resultSet.getString("manufacturer");
                result.add(new Product(id, name, description, manufacturer));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public boolean updateProduct(Product product) {
        boolean isUpdated;
        try {
            Connection connection = BaseRepository.getConnection();
            String sql = "update products set name = ?, description = ?, manufacturer = ? where id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setString(3, product.getManufacturer());
            statement.setInt(4, product.getId());
            isUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isUpdated;
    }

    public Product findById(int id) {
        try {
            Connection connection = BaseRepository.getConnection();
            String sql = "select * from products where id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            return new Product(id, resultSet.getString("name"), resultSet.getString("description"), resultSet.getString("manufacturer"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
