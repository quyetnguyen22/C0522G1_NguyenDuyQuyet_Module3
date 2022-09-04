package service.impl;

import model.ServiceRenting;
import repository.IServiceRentingRepository;
import repository.impl.ServiceRentingRepository;
import service.IServiceRentingService;

import java.util.List;

public class ServiceRentingService implements IServiceRentingService {
    IServiceRentingRepository rentingRepository = new ServiceRentingRepository();
    @Override
    public List<ServiceRenting> showAllServiceRenting() {
        return rentingRepository.showAllServiceRenting();
    }
}
