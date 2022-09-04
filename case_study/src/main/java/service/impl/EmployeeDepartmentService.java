package service.impl;

import model.EmployeeDepartment;
import repository.IEmployeeDepartmentRepository;
import repository.impl.EmployeeDepartmentRepository;
import service.IEmployeeDepartmentService;

import java.util.List;

public class EmployeeDepartmentService implements IEmployeeDepartmentService {
    IEmployeeDepartmentRepository departmentRepository = new EmployeeDepartmentRepository();
    @Override
    public List<EmployeeDepartment> EmployeeDepartment() {
        return departmentRepository.EmployeeDepartment();
    }
}
