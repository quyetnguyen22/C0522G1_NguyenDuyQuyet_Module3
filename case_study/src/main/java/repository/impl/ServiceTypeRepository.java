package repository.impl;

import model.ServiceType;
import repository.IServiceTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceTypeRepository implements IServiceTypeRepository {

    private static final String SHOW_ALL_SERVICE_TYPE = "select * from service_type;";
    @Override
    public List<ServiceType> showAllServiceType() {
        Map<Integer,ServiceType> serviceTypeMap = new HashMap<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_SERVICE_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_service_type");
                String typeName = resultSet.getString("service_type_name");
                serviceTypeMap.put(id, new ServiceType(id, typeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>(serviceTypeMap.values());
    }
}
