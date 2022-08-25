package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
   List<Customer> findAll();
    void save();
    Customer findById(int id);
    void update();
    void remove();
}
