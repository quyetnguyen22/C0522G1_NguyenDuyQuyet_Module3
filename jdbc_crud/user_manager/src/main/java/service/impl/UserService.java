package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {

    IUserRepository iUserRepository = new UserRepository();

    @Override
    public void insertUser(User user) {
iUserRepository.insertUser(user);
    }

    @Override
    public List<User> showByElement(String country) {
        return iUserRepository.showByElement(country);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return iUserRepository.updateUser(user);
    }

    @Override
    public List<User> orderByName() {
        return iUserRepository.orderByName();
    }
}
