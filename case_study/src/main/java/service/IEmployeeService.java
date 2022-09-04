package service;

import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> showAllEmployee();

    Employee searchById(int id);

    List<Employee> searchEmployee(Employee employee);

    boolean editEmployee(Employee employee);

    boolean deleteEmployee(int id);

    boolean addNewEmployee(Employee employee);
}
