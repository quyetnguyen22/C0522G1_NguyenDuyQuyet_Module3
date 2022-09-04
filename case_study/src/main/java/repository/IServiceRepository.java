package repository;

import model.Service;
import repository.impl.ServiceRepository;

import java.util.List;

public interface IServiceRepository {
    List<Service> showAllService();
    boolean addNewService(Service service);
    boolean editService(Service service);
    boolean deleteService(int id);
    Service searchById(int id);
    List<Service> searchService(Service service);
}
