package service;

import model.Product;

import java.util.List;

public interface IProductService {

    List<Product> showAll();
    void add(Product product);
    void update(int id);
    void delete(int id);
    Product showById(int id);
    List<Product> showByName(String name);
}
