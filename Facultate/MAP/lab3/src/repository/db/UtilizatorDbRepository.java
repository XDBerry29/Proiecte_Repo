package repository.db;

import domain.Utilizator;
import domain.validators.ValidationExceptions;
import domain.validators.Validator;

import repository.Repository;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Date;

public class UtilizatorDbRepository implements Repository<Long, Utilizator> {
    private String url;
    private String username;
    private String password;
    private Validator<Utilizator> validator;

    public UtilizatorDbRepository(String url, String username, String password, Validator<Utilizator> validator) {
        this.url = url;
        this.username = username;
        this.password = password;
        this.validator = validator;
    }
    @Override
    public Utilizator findOne(Long id) {
        if(id == null)
            throw new IllegalArgumentException("Id must not be null");

        String sql = "SELECT * FROM users where users.id = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, Math.toIntExact(id));
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                //Long id = resultSet.getLong("id");
                String nume = resultSet.getString("nume");
                String prenume = resultSet.getString("prenume");
                String email = resultSet.getString("email");
                String parola = resultSet.getString("parola");
                String dataNasterii = resultSet.getString("data_nasterii");

                Utilizator user = new Utilizator(id, nume, prenume, email, parola, dataNasterii);
                user.setID(id);
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Iterable<Utilizator> findAll() {
        Set<Utilizator> users = new HashSet<>();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement("SELECT * from users");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String nume = resultSet.getString("nume");
                String prenume = resultSet.getString("prenume");
                String email = resultSet.getString("email");
                String parola = resultSet.getString("parola");
                String dataNasterii = resultSet.getString("data_nasterii");

                Utilizator utilizator = new Utilizator(id, nume, prenume, email, parola, dataNasterii);
                utilizator.setID(id);
                users.add(utilizator);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public Utilizator save(Utilizator entity) throws ValidationExceptions {
        if (entity==null)
            throw new IllegalArgumentException("Entity must be not null");

        validator.validate(entity);

        String sql = "insert into users (nume, prenume, email, parola, data_nasterii ) values (?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, username, password)){
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, entity.getNume());
            ps.setString(2, entity.getPrenume());
            ps.setString(3, entity.getEmail());
            ps.setString(4, entity.getParola());
            ps.setString(5, entity.getDataNasterii());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Utilizator delete(Long id) {
        if(id == null)
            throw new IllegalArgumentException("ID is null! Cannot delete!");

        String sql = "delete from users where id = ?";
        Utilizator user = null;

        try (Connection connection = DriverManager.getConnection(url, username, password)){
            PreparedStatement ps = connection.prepareStatement(sql);
            user = this.findOne(id);
            if(user == null)
                return null;

            ps.setLong(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public Utilizator update(Utilizator entity) throws ValidationExceptions {
        if(entity == null)
            throw new IllegalArgumentException("Entity must not be null");

        validator.validate(entity);

        String sql = "update users set nume = ?, prenume = ?, email = ?, parola = ?, data_nasterii = ? where id = ?";
        int nrRowsAffected = 0;

        try (Connection connection = DriverManager.getConnection(url, username, password)){
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, entity.getNume());
            ps.setString(2, entity.getPrenume());
            ps.setString(3, entity.getEmail());
            ps.setString(4, entity.getParola());
            ps.setString(5, entity.getDataNasterii());
            ps.setLong(6, entity.getID());

            nrRowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(nrRowsAffected > 0)
            return null;
        return entity;
    }

    @Override
    public List<Utilizator> getAllAsList() {
        Iterable<Utilizator> iterable = findAll();
        List<Utilizator> list = new ArrayList<>();
        iterable.forEach(list::add);
        return list;
    }

    @Override
    public int getSize() {
        return getAllAsList().size();
    }
}