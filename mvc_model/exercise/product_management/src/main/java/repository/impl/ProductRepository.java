package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Son Hce", 20., "son dưỡng", "chanel"));
        productList.add(new Product(2, "Maybach S650", 200000., "Full nội thất", "Mec"));
        productList.add(new Product(3, "Đồng Hồ Rolex", 2000., "cơ", "rolex"));
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
    public void update(int id) {

    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public Product showById(int id) {
        return productList.get(id - 1);
    }

    @Override
    public List<Product> showByName(String name) {
        List<Product> findList = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().contains(name))
                findList.add(product);
//            else {
//                findList = productList;
//            }
        }
        return findList;
    }
}
