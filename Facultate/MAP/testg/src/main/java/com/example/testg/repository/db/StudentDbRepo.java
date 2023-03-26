package com.example.testg.repository.db;


import com.example.testg.domain.Student;
import com.example.testg.domain.validators.ValidationException;
import com.example.testg.domain.validators.Validator;
import com.example.testg.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class StudentDbRepo implements Repository<String, Student> {
    private String url;
    private String username;
    private String password;
    private Validator<Student> validator;

    public StudentDbRepo(String url, String username, String password, Validator<Student> validator) {
        this.url = url;
        this.username = username;
        this.password = password;
        this.validator = validator;
    }
    @Override
    public Student findOne(String id) {
        if(id == null)
            throw new IllegalArgumentException("Id must not be null");

        String sql = "SELECT * FROM studenti where studenti.id = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                String nume = resultSet.getString("nume");

                Student student = new Student(nume);
                student.setID(id);
                return student;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Iterable<Student> findAll() {
        Set<Student> students = new HashSet<>();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement("SELECT * from studenti");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String nume = resultSet.getString("nume");

                Student student = new Student(nume);
                student.setID(id);
                students.add(student);
            }
            return students;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public Student save(Student entity) throws ValidationException {
        /*if (entity==null)
            throw new IllegalArgumentException("Entity must be not null");

        validator.validate(entity);

        String sql = "insert into hotels(name, noRooms, pricePerNight, type, locationID) values (?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, username, password)){
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setDouble(1, entity.getLocationID());
            ps.setString(2, entity.getHotelName());
            ps.setInt(3, entity.getNoRooms());
            ps.setDouble(4, entity.getPricePerNight());
            ps.setString(5, String.valueOf(entity.getType()));

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }*/
        return null;
    }

    @Override
    public Student delete(String id) {
        return null;
    }

    @Override
    public Student update(Student entity) {

        return entity;
    }

    @Override
    public List<Student> getAllAsList() {
        Iterable<Student> iterable = findAll();
        List<Student> list = new ArrayList<>();
        iterable.forEach(list::add);
        return list;
    }
}