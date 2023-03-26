package repository.db;

import domain.Prietenie;
import domain.Utilizator;
import domain.validators.ValidationExceptions;
import domain.validators.Validator;
import repository.Repository;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PrietenieDbRepository implements Repository<String, Prietenie> {
    private final String url;
    private final String username;
    private final String password;
    private final Validator<Prietenie> validator;

    public PrietenieDbRepository(String url, String username, String password, Validator<Prietenie> validator) {
        this.url = url;
        this.username = username;
        this.password = password;
        this.validator = validator;
    }

    private Prietenie extractFriendship(ResultSet resultSet) throws SQLException {
        Prietenie friendship;
        if(resultSet.next()){
            Long id1 = resultSet.getLong("id1");
            Long id2 = resultSet.getLong("id2");
            LocalDateTime date = resultSet.getTimestamp("date").toLocalDateTime();

            friendship = new Prietenie(id1, id2, date);

            return friendship;
        }
        return null;
    }

    @Override
    public Prietenie findOne(String id) {
        if(id == null)
            throw new IllegalArgumentException("ID must not be null");

        Prietenie friendship;
        String sql = "SELECT * FROM friendships WHERE id = ?";
        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement statement = connection.prepareStatement(sql)){

            statement.setString(1, id);
            ResultSet resultSet = statement.executeQuery();
            friendship = this.extractFriendship(resultSet);
            if(friendship != null)
                return friendship;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Iterable<Prietenie> findAll() {
        Set<Prietenie> friendships = new HashSet<>();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement("SELECT * from friendships");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                Long id1 = resultSet.getLong("id1");
                Long id2 = resultSet.getLong("id2");
                LocalDateTime date = resultSet.getTimestamp("date").toLocalDateTime();

                Prietenie friendship = new Prietenie(id1, id2, date);
                friendships.add(friendship);
            }
            return friendships;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return friendships;
    }

    private void executeStatement(Prietenie friendship, String sql){
        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setLong(1, friendship.getID1());
            statement.setLong(2, friendship.getID2());
            statement.executeUpdate();
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Prietenie save(Prietenie friendship) throws ValidationExceptions {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        if(friendship == null) {
            throw new IllegalArgumentException("Entity must not be null");
        }

        if(findOne(friendship.getID()) != null) { //daca mai avem inca o prietenie la fel
            //return entity;
            throw new ValidationExceptions("ID duplicat!!!");
        }

        validator.validate(friendship);

        String sql = "INSERT INTO friendships(id,id1,id2,date) VALUES ('" + friendship.getID()+ "',?,?,'"+friendship.getFriendsFrom().format(formatter)+"')";
        this.executeStatement(friendship,sql);
        return null;
    }

    @Override
    public Prietenie delete(String id) {
        if(id == null)
            throw new IllegalArgumentException("ID must not be null");

        Prietenie friendship = this.findOne(id);
        if(friendship != null){
            String sql = "DELETE FROM friendships WHERE id1 = ? AND id2 = ?";
            this.executeStatement(friendship,sql);
        }
        return friendship;
    }

    @Override
    public Prietenie update(Prietenie friendship) {
        return null;
    }

    @Override
    public List<Prietenie> getAllAsList() {
        Iterable<Prietenie> iterable = findAll();
        List<Prietenie> list = new ArrayList<>();
        iterable.forEach(list::add);
        return list;
    }

    @Override
    public int getSize() {
        return getAllAsList().size();
    }
}