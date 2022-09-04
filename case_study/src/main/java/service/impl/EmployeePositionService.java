package service.impl;

import model.EmployeePosition;
import repository.IEmployeePositionRepository;
import repository.impl.EmployeePositionRepository;
import service.IEmployeePositionService;

import java.util.List;

public class EmployeePositionService implements IEmployeePositionService {
    IEmployeePositionRepository positionRepository = new EmployeePositionRepository();
    @Override
    public List<EmployeePosition> EmployeePosition() {
        return positionRepository.EmployeePosition();
    }
}
