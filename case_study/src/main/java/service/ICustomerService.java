package service;

import model.Customer;
import model.Employee;

import java.util.List;

public interface ICustomerService {
    List<Customer> showAllCustomer();

    Customer searchById(int id);

    boolean editCustomer(Customer customer);

    boolean deleteCustomer(int id);

    boolean addNewCustomer(Customer customer);
}
