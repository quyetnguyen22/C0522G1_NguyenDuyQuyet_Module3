package repository.impl;

import model.User;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private final String INSERT_USERS_SQL = "insert into users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =? and is_deleted = 0;";
    private static final String SELECT_USER_BY_ELEMENT = "select name,email,country from users where name =? or country =? or id =? and is_deleted = 0;";
    private static final String SELECT_ALL_USERS = "call show_all_user();";
    private static final String DELETE_USERS_SQL = "call delete_user(?);";
    private static final String UPDATE_USERS_SQL = "call update_user(?, ?, ?, ?)";
    private static final String ORDER_BY_NAME = "select * from users where is_deleted = 0 order by users.name;";

    @Override
    public void insertUser(User user) {
        System.out.print(INSERT_USERS_SQL);
        Connection connection = ConnectDataRepository.getConnectDB();
        PreparedStatement preparedStatement;
        try {
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int execute = preparedStatement.executeUpdate();
            if (execute <= 0) {
                connection.rollback();
            }
            connection.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = ConnectDataRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> showByElement(String lookUp) {
        List<User> users = new ArrayList<>();
        Connection connection = ConnectDataRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ELEMENT);
            preparedStatement.setString(1,lookUp);
            preparedStatement.setString(2,lookUp);
            preparedStatement.setInt(3, Integer.parseInt(lookUp));
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
//               int id = resultSet.getInt("id");
               String name = resultSet.getString("name");
               String email = resultSet.getString("email");
               String country = resultSet.getString("country");
               users.add(new User(name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = ConnectDataRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS);
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean rowDelete = false;
        Connection connection = ConnectDataRepository.getConnectDB();
        try {
            connection.setAutoCommit(false);
            CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SQL);
            callableStatement.setInt(1,id);
            rowDelete = callableStatement.executeUpdate()>0;
            if (!rowDelete) {
                connection.rollback();
            }
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) {
        Connection connection = ConnectDataRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_SQL);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());

            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> orderByName() {
        List<User> users = new ArrayList<>();
        Connection connection = ConnectDataRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_BY_NAME);
            ResultSet resultSet =preparedStatement.executeQuery();
            while(resultSet.next()){
//                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
