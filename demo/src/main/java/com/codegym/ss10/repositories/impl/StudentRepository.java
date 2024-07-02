package com.codegym.ss10.repositories.impl;

import com.codegym.ss10.models.Student;
import com.codegym.ss10.repositories.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {

    @Override
    public List<Student> findAll() {
        List<Student> students = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select * from student");
            ResultSet resultSet = preparedStatement.executeQuery();
            long id;
            String name;
            String address;
            float point;
            while (resultSet.next()) {
                 id = resultSet.getLong("id");
                 name = resultSet.getString("name");
                 address = resultSet.getString("address");
                 point = resultSet.getFloat("point");
                students.add(new Student(id, name, address, point));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return students;
    }

    @Override
    public void save(Student student) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("insert into student(name, address, point) value (?, ?, ?)");
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getAddress());
            preparedStatement.setFloat(3, student.getPoint());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean deleteById(Long id) {
        boolean isDelete;
        try {
            PreparedStatement statement = BaseRepository.getConnection().prepareStatement("delete from student where id=?;");
            statement.setLong(1, id);
            isDelete = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isDelete;
    }
}
