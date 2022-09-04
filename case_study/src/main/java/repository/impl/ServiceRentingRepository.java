package repository.impl;

import model.ServiceRenting;
import model.ServiceType;
import repository.IServiceRentingRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceRentingRepository implements IServiceRentingRepository {

    private static final String SHOW_ALL_RENTING_TYPE = "select * from renting_type;";
    @Override
    public List<ServiceRenting> showAllServiceRenting() {
        Map<Integer, ServiceRenting> serviceRentingMap = new HashMap<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_RENTING_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_renting");
                String typeName = resultSet.getString("renting_name");
                serviceRentingMap.put(id, new ServiceRenting(id, typeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>(serviceRentingMap.values());
    }

}
