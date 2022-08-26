package repository;
import model.Product;

import java.util.List;

//Hiển thị danh sách sản phẩm
//Tạo sản phẩm mới
//Cập nhật thông tin sản phẩm
//Xoá một sản phẩm
//Xem chi tiết một sản phẩm
//Tìm kiếm sản phẩm theo tên
public interface IProductRepository {
    List<Product> showAll();
    void add(Product product);
    void update(int id);
    void delete(int id);
    Product showById(int id);
    List<Product> showByName(String name);
}
