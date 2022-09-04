package repository.impl;

import model.EmployeeDepartment;
import model.EmployeeEduLevel;
import repository.IEmployeeDepartmentRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDepartmentRepository implements IEmployeeDepartmentRepository {
    private static final String EMPLOYEE_DEPARTMENT = "call employee_department();";

    public List<EmployeeDepartment> EmployeeDepartment() {
        List<EmployeeDepartment> employeeDepartmentList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        CallableStatement callableStatement;

        {
            try {
                callableStatement = connection.prepareCall(EMPLOYEE_DEPARTMENT);
                ResultSet resultSet = callableStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("e_department_code");
                    String name = resultSet.getString("e_department_name");
                    employeeDepartmentList.add(new EmployeeDepartment(id, name));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeDepartmentList;
    }
}
