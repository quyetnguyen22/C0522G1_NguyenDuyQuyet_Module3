package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> showAllEmployee() {
        return employeeRepository.showAllEmployee();
    }

    @Override
    public Employee searchById(int id) {
        return employeeRepository.searchById(id);
    }

    @Override
    public List<Employee> searchEmployee(Employee employee) {
        return employeeRepository.searchEmployee(employee);
    }

    @Override
    public boolean editEmployee(Employee employee) {
        return employeeRepository.editEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public boolean addNewEmployee(Employee employee) {
       return employeeRepository.addNewEmployee(employee);
    }
}
