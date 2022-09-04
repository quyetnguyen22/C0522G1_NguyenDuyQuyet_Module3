package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> showAllCustomer();

    Customer searchById(int id);

    boolean editCustomer(Customer customer);

    boolean deleteCustomer(int id);

    boolean addNewCustomer(Customer customer);
}
