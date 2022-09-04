package repository.impl;

import model.Employee;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SHOW_ALL_EMPLOYEE = "select * from employee where is_deleted = 0;";
    private static final String ADD_NEW_EMPLOYEE = "call add_new_employee(?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_EMPLOYEE = "call delete_employee(?);";
    private static final String EDIT_EMPLOYEE = "call edit_employee(?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SEARCH_BY_ID = "call search_employee_by_id(?);";
    private static final String SEARCH_EMPLOYEE = "select * from employee where e_name like ? and e_phone like ? and e_address like ? and is_deleted = 0;";

    @Override
    public List<Employee> showAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("e_name");
                String birthday = resultSet.getString("e_birthday");
                String phone = resultSet.getString("e_phone");
                String email = resultSet.getString("e_email");
                String address = resultSet.getString("e_address");
                employeeList.add(new Employee(id, name, birthday, phone, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public Employee searchById(int id) {
        Employee employee = null;
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(SEARCH_BY_ID);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                resultSet.getInt("id");
                String name = resultSet.getString("e_name");
                String birthday = resultSet.getString("e_birthday");
                String phone = resultSet.getString("e_phone");
                String email = resultSet.getString("e_email");
                String salary = resultSet.getString("e_salary");
                String address = resultSet.getString("e_address");
                String idNum = resultSet.getString("e_id_number");
                int positionCode = resultSet.getInt("e_position_code");
                int eduLevelCode = resultSet.getInt("e_edu_level_code");
                int departmentCode = resultSet.getInt("e_department_code");
                employee = new Employee(id, name, birthday, idNum, phone,
                        email, salary, address, positionCode, eduLevelCode, departmentCode);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> searchEmployee(Employee employee) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1, "%" + employee.getEmployeeName() + "%");
            preparedStatement.setString(2, "%" + employee.getEmployeePhone() + "%");
            preparedStatement.setString(3, "%" + employee.getEmployeeAddress() + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("e_name");
                String birthday = resultSet.getString("e_birthday");
                String phone = resultSet.getString("e_phone");
                String email = resultSet.getString("e_email");
                String address = resultSet.getString("e_address");
                employeeList.add(new Employee(id, name, birthday, phone, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean editEmployee(Employee employee) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_EMPLOYEE);
            callableStatement.setInt(1, employee.getId());
            callableStatement.setString(2, employee.getEmployeeName());
            callableStatement.setString(3, employee.getEmployeeBirthday());
            callableStatement.setString(4, employee.getEmployeeIdNumber());
            callableStatement.setString(5, employee.getEmployeePhone());
            callableStatement.setString(6, employee.getEmployeeEmail());
            callableStatement.setString(7, employee.getEmployeeSalary());
            callableStatement.setString(8, employee.getEmployeeAddress());
            callableStatement.setInt(9, employee.getEmployeePositionCode());
            callableStatement.setInt(10, employee.getEmployeeEduLevelCode());
            callableStatement.setInt(11, employee.getEmployeeDepartmentCode());
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_EMPLOYEE);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean addNewEmployee(Employee employee) {
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_EMPLOYEE);
//            e_name,e_birthday,e_id_number,e_salary,e_phone,e_email,e_address,e_position_code,e_edu_level_code,e_department_code
            callableStatement.setString(1, employee.getEmployeeName());
            callableStatement.setString(2, employee.getEmployeeBirthday());
            callableStatement.setString(3, employee.getEmployeeIdNumber());
            callableStatement.setString(4, employee.getEmployeeSalary());
            callableStatement.setString(5, employee.getEmployeePhone());
            callableStatement.setString(6, employee.getEmployeeEmail());
            callableStatement.setString(7, employee.getEmployeeAddress());
            callableStatement.setInt(8, employee.getEmployeePositionCode());
            callableStatement.setInt(9, employee.getEmployeeEduLevelCode());
            callableStatement.setInt(10, employee.getEmployeeDepartmentCode());
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
