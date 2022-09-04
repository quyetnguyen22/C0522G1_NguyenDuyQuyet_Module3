package service.impl;

import model.Service;
import repository.IServiceRepository;
import repository.impl.ServiceRepository;
import service.IServiceService;

import java.util.List;

public class ServiceService implements IServiceService {
     IServiceRepository serviceRepository = new ServiceRepository();
    @Override
    public List<Service> showAllService() {
        return serviceRepository.showAllService();
    }

    @Override
    public boolean addNewService(Service service) {
        return serviceRepository.addNewService(service);
    }

    @Override
    public boolean editService(Service service) {
        return serviceRepository.editService(service);
    }

    @Override
    public boolean deleteService(int id) {
        return serviceRepository.deleteService(id);
    }

    @Override
    public Service searchById(int id) {
        return serviceRepository.searchById(id);
    }

    @Override
    public List<Service> searchService(Service service) {
        return serviceRepository.searchService(service);
    }
}
