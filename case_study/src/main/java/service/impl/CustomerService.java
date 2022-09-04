package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> showAllCustomer() {
        return customerRepository.showAllCustomer();
    }

    @Override
    public Customer searchById(int id) {
        return customerRepository.searchById(id);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return customerRepository.editCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public boolean addNewCustomer(Customer customer) {
        return customerRepository.addNewCustomer(customer);
    }
}
