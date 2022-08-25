package service;

import model.Product;

import java.util.List;

public interface IProductService {

    List<Product> showAll();
    void add(Product product);
    void update();
    void delete();
    List<Product> showById(int id);
    List<Product> showByName(String name);
}
