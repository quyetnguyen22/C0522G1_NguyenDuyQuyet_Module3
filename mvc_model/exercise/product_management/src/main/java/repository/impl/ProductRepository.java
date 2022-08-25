package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1,"Son Hce",20.,"son dưỡng","chanel"));
        productList.add(new Product(2,"Maybach S650",200000.,"Full nội thất","Mec"));
        productList.add(new Product(3,"Đồng Hồ Rolex",2000.,"cơ","rolex"));
    }

    @Override
    public List<Product> showAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update() {

    }

    @Override
    public void delete() {

    }

    @Override
    public List<Product> showById(int id) {
        return null;
    }

    @Override
    public List<Product> showByName(String name) {
        return null;
    }
}
