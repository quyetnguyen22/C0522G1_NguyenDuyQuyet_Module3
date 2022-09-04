package repository.impl;

import model.Service;
import repository.IServiceRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceRepository implements IServiceRepository {

    private static final String SHOW_ALL_SERVICE = "select * from service where is_deleted = 0;";
    private static final String ADD_NEW_SERVICE = "call add_new_service(?,?,?,?,?,?,?,?,?,?,?);";
    private static final String EDIT_SERVICE = "call edit_service(?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_SERVICE = "call delete_service(?);";
    private static final String SEARCH_BY_ID = "call search_by_id(?);";
    private static final String SEARCH_SERVICE = "select * from service where service_name like ? and price like ? and capacity like ? and is_deleted = 0;";

    @Override
    public List<Service> showAllService() {
        Map<Integer,Service> serviceHashMap = new HashMap<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                 int id = resultSet.getInt("id");
                 String serviceName = resultSet.getString("service_name");
                 String area = resultSet.getString("area");
                 String price = resultSet.getString("price");
                 String capacity = resultSet.getString("capacity");
                 String standard = resultSet.getString("standard");
                 String util = resultSet.getString("util");
                 String poolArea = resultSet.getString("pool_area");
                 String floor = resultSet.getString("floor");
                 String freeService = resultSet.getString("free_service");
                 serviceHashMap.put(id, new Service(id, serviceName,area,price,capacity,standard,util,
                         poolArea,floor,freeService));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>(serviceHashMap.values());
    }

    @Override
    public boolean addNewService(Service service) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_SERVICE);
            callableStatement.setString(1,service.getServiceName());
            callableStatement.setString(2,service.getArea());
            callableStatement.setString(3,service.getPrice());
            callableStatement.setString(4,service.getCapacity());
            callableStatement.setString(5,service.getStandard());
            callableStatement.setString(6,service.getUtil());
            callableStatement.setString(7,service.getPoolArea());
            callableStatement.setString(8,service.getFloor());
            callableStatement.setString(9,service.getFreeService());
            callableStatement.setInt(10,service.getIdRenting());
            callableStatement.setInt(11,service.getIdServiceCode());
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean editService(Service service) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_SERVICE);
            callableStatement.setString(1, service.getServiceName());
            callableStatement.setString(2, service.getArea());
            callableStatement.setString(3, service.getPrice());
            callableStatement.setString(4, service.getCapacity());
            callableStatement.setString(5, service.getStandard());
            callableStatement.setString(6, service.getUtil());
            callableStatement.setString(7, service.getPoolArea());
            callableStatement.setString(8, service.getFloor());
            callableStatement.setString(9, service.getFreeService());
            callableStatement.setInt(10, service.getIdRenting());
            callableStatement.setInt(11, service.getIdServiceCode());
            callableStatement.setInt(12, service.getId());
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteService(int id) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_SERVICE);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Service searchById(int id) {
        Service service = null;
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_BY_ID);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                resultSet.getInt("id");
                String serviceName = resultSet.getString("service_name");
                String area = resultSet.getString("area");
                String price = resultSet.getString("price");
                String capacity = resultSet.getString("capacity");
                String standard = resultSet.getString("standard");
                String util = resultSet.getString("util");
                String poolArea = resultSet.getString("pool_area");
                String floor = resultSet.getString("floor");
                String freeService = resultSet.getString("free_service");
                service = new Service(id, serviceName,area,price,capacity,standard,util,
                        poolArea,floor,freeService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return service;
    }

    @Override
    public List<Service> searchService(Service service) {
        Map<Integer,Service> serviceMap = new HashMap<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_SERVICE);
            preparedStatement.setString(1,"%" + service.getServiceName() + "%");
            preparedStatement.setString(2,"%" + service.getPrice() + "%");
            preparedStatement.setString(3,"%" + service.getCapacity() + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String serviceName = resultSet.getString("service_name");
                String area = resultSet.getString("area");
                String price = resultSet.getString("price");
                String capacity = resultSet.getString("capacity");
                String standard = resultSet.getString("standard");
                String util = resultSet.getString("util");
                String poolArea = resultSet.getString("pool_area");
                String floor = resultSet.getString("floor");
                String freeService = resultSet.getString("free_service");
                serviceMap.put(id, new Service(id, serviceName,area,price,capacity,standard,util,
                        poolArea,floor,freeService));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>(serviceMap.values());
    }
}
