package com.example.testg.repository.db;

import com.example.testg.domain.Intrebare;
import com.example.testg.domain.validators.ValidationException;
import com.example.testg.domain.validators.Validator;
import com.example.testg.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class IntrebareDbRepo implements Repository<Integer, Intrebare> {
    private String url;
    private String username;
    private String password;
    private Validator<Intrebare> validator;

    public IntrebareDbRepo(String url, String username, String password, Validator<Intrebare> validator) {
        this.url = url;
        this.username = username;
        this.password = password;
        this.validator = validator;
    }
    @Override
    public Intrebare findOne(Integer id) {
        if(id == null)
            throw new IllegalArgumentException("Id must not be null");

        String sql = "SELECT * FROM intrebari where intrebari.nrintrebare = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                String descriere = resultSet.getString("descriere");
                String v1 = resultSet.getString("v1");
                String v2 = resultSet.getString("v2");
                String v3 = resultSet.getString("v3");
                Integer punctaj = resultSet.getInt("punctaj");

                return new Intrebare(descriere, v1, v2, v3, punctaj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Iterable<Intrebare> findAll() {
        Set<Intrebare> questions = new HashSet<>();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement("SELECT * from intrebari");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Integer id = resultSet.getInt("nrIntrebare");
                String descriere = resultSet.getString("descriere");
                String v1 = resultSet.getString("v1");
                String v2 = resultSet.getString("v2");
                String v3 = resultSet.getString("v3");
                Integer punctaj = resultSet.getInt("punctaj");

                Intrebare intrebare = new Intrebare(descriere, v1, v2, v3, punctaj);
                intrebare.setNrIntrebare(id);
                questions.add(intrebare);
            }
            return questions;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    @Override
    public Intrebare save(Intrebare entity) throws ValidationException {
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
    public Intrebare delete(Integer id) {
        return null;
    }

    @Override
    public Intrebare update(Intrebare entity) {

        return entity;
    }

    @Override
    public List<Intrebare> getAllAsList() {
        Iterable<Intrebare> iterable = findAll();
        List<Intrebare> list = new ArrayList<>();
        iterable.forEach(list::add);
        return list;
    }
}
