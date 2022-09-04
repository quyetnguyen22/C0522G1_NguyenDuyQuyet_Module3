package repository;

import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeRepository {
    List<Employee> showAllEmployee();

    Employee searchById(int id);

    List<Employee> searchEmployee(Employee employee);

    boolean editEmployee(Employee employee);

    boolean deleteEmployee(int id);

    boolean addNewEmployee(Employee employee);
}
