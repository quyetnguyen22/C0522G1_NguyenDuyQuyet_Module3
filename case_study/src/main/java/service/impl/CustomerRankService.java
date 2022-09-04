package service.impl;

import model.CustomerRank;
import repository.ICustomerRankRepository;
import repository.impl.CustomerRankRepository;
import service.ICustomerRankService;

import java.util.List;

public class CustomerRankService implements ICustomerRankService {
    ICustomerRankRepository customerRankRepository = new CustomerRankRepository();

    @Override
    public List<CustomerRank> showAllCustomerRank() {
        return customerRankRepository.showAllCustomerRank();
    }
}
