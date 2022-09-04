package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String ALL_CUSTOMER = "select * from customer where is_deleted = 0;";
    private static final String DELETE_CUSTOMER = "call delete_customer(?);";
    private static final String ADD_NEW_CUSTOMER = "call add_new_customer(?,?,?,?,?,?,?,?);";
    private static final String EDIT_CUSTOMER = "call edit_customer(?,?,?,?,?,?,?,?,?);";
    private static final String SEARCH_CUSTOMER = "call search_customer(?);";

    @Override
    public List<Customer> showAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("c_name");
                String birthday = resultSet.getString("c_birthday");
                String gender = resultSet.getString("c_gender");
                String idNum = resultSet.getString("c_id_num");
                String phone = resultSet.getString("c_phone");
                String email = resultSet.getString("c_email");
                String address = resultSet.getString("c_address");
                int rankId = resultSet.getInt("rank_id");
                customerList.add(new Customer(id, name, birthday, gender, idNum, phone, email, address, rankId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer searchById(int id) {
        Customer customer = null;
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_CUSTOMER);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                resultSet.getInt("id");
                String name = resultSet.getString("c_name");
                String birthday = resultSet.getString("c_birthday");
                String gender = resultSet.getString("c_gender");
                String idNum = resultSet.getString("c_id_num");
                String phone = resultSet.getString("c_phone");
                String email = resultSet.getString("c_email");
                String address = resultSet.getString("c_address");
                int rankId = resultSet.getInt("rank_id");
                customer = new Customer(id, name, birthday, gender, idNum, phone, email, address, rankId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean editCustomer(Customer customer) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_CUSTOMER);
            callableStatement.setInt(1,customer.getId());
            callableStatement.setString(2, customer.getCustomerName());
            callableStatement.setString(3, customer.getCustomerBirthday());
            callableStatement.setString(4, customer.getCustomerGender());
            callableStatement.setString(5, customer.getCustomerIdNum());
            callableStatement.setString(6, customer.getCustomerPhone());
            callableStatement.setString(7, customer.getCustomerEmail());
            callableStatement.setString(8, customer.getCustomerAddress());
            callableStatement.setInt(9, customer.getCustomerRankId());
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addNewCustomer(Customer customer) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
//          id,name,birthday,gender,idNum,phone,email,address,rankId
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER);
            callableStatement.setString(1, customer.getCustomerName());
            callableStatement.setString(2, customer.getCustomerBirthday());
            callableStatement.setString(3, customer.getCustomerGender());
            callableStatement.setString(4, customer.getCustomerIdNum());
            callableStatement.setString(5, customer.getCustomerPhone());
            callableStatement.setString(6, customer.getCustomerEmail());
            callableStatement.setString(7, customer.getCustomerAddress());
            callableStatement.setInt(8, customer.getCustomerRankId());
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
