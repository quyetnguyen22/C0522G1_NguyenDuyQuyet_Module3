package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    void save();
    Customer findById(int id);
    void update();
    void remove();
}
