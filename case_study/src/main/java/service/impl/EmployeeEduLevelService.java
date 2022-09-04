package service.impl;

import model.EmployeeEduLevel;
import repository.IEmployeeEduLevelRepository;
import repository.impl.EmployeeEduLevelRepository;
import service.IEmployeeEduLevelService;

import java.util.List;

public class EmployeeEduLevelService implements IEmployeeEduLevelService {
    IEmployeeEduLevelRepository eduLevelRepository = new EmployeeEduLevelRepository();
    @Override
    public List<EmployeeEduLevel> EmployeeEduLevel() {
        return eduLevelRepository.EmployeeEduLevel();
    }
}
