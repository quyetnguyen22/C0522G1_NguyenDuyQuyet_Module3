package repository.impl;

import model.CustomerRank;
import repository.ICustomerRankRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRankRepository implements ICustomerRankRepository {
    private static final String CUSTOMER_RANK = "call show_all_customer_rank();";
    @Override
    public List<CustomerRank> showAllCustomerRank() {
        List<CustomerRank> customerRankList = new ArrayList<>();
        Connection connection = ConnectDatabaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(CUSTOMER_RANK);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("rank_id");
                String rankName = resultSet.getString("rank_name");
                customerRankList.add(new CustomerRank(id, rankName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerRankList;
    }
}
