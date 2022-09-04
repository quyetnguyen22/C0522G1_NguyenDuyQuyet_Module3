package service.impl;

import model.ServiceType;
import repository.IServiceTypeRepository;
import repository.impl.ServiceTypeRepository;
import service.IServiceTypeService;

import java.util.List;

public class ServiceTypeService implements IServiceTypeService {

     IServiceTypeRepository typeRepository = new ServiceTypeRepository();
    @Override
    public List<ServiceType> showAllServiceType() {
        return typeRepository.showAllServiceType();
    }
}
