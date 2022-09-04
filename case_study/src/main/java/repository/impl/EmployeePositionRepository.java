package repository.impl;

import model.EmployeePosition;
import repository.IEmployeePositionRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeePositionRepository implements IEmployeePositionRepository {
    private static final String EMPLOYEE_POSITION = "call employee_position();";
    public List<EmployeePosition> EmployeePosition() {
        List<EmployeePosition> employeePositionList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        CallableStatement callableStatement;

        {
            try {
                callableStatement = connection.prepareCall(EMPLOYEE_POSITION);
                ResultSet resultSet = callableStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("e_position_code");
                    String name = resultSet.getString("e_position_name");
                    employeePositionList.add(new EmployeePosition(id, name));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeePositionList;
    }

}
