package repository.impl;

import model.EmployeeEduLevel;
import model.EmployeePosition;
import repository.IEmployeeEduLevelRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeEduLevelRepository implements IEmployeeEduLevelRepository {
    private static final String EMPLOYEE_EDU_LEVEL = "call employee_edu_level();";
    public List<EmployeeEduLevel> EmployeeEduLevel() {
        List<EmployeeEduLevel> employeeEduLevelList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        CallableStatement callableStatement;

        {
            try {
                callableStatement = connection.prepareCall(EMPLOYEE_EDU_LEVEL);
                ResultSet resultSet = callableStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("e_edu_level_code");
                    String name = resultSet.getString("e_edu_level_name");
                    employeeEduLevelList.add(new EmployeeEduLevel(id, name));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeEduLevelList;
    }
}
