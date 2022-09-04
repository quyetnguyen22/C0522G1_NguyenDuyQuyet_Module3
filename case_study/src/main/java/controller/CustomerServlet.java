package controller;

import model.Customer;
import model.EmployeePosition;
import service.ICustomerRankService;
import service.ICustomerService;
import service.impl.CustomerRankService;
import service.impl.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/Customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    ICustomerRankService customerRankService = new CustomerRankService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showAll":
                getAllCustomer(request, response);
                break;
            case "add":
                getFormAddNewCustomer(request, response);
                break;
            case "edit":
                getFormEditCustomer(request, response);
                break;
            case "delete":
                getDeleteCustomer(request, response);
                break;
            case "showById":
                getShowInfo(request, response);
                break;
            default:
                backHome(request, response);
        }
    }

    private void getFormEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/formEdit.jsp");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("customer", customerService.searchById(id));
            request.setAttribute("rankName", customerRankService.showAllCustomerRank());
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getFormAddNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/formAdd.jsp");
        try {
            request.setAttribute("rankName", customerRankService.showAllCustomerRank());
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getDeleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        getAllCustomer(request, response);
    }

    private void getShowInfo(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/customerInfo.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("customer", customerService.searchById(id));
            request.setAttribute("customerRank", customerRankService.showAllCustomerRank());
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/customerList.jsp");
        request.setAttribute("customerList", customerService.showAllCustomer());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void backHome(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            default:
                backHome(request, response);
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("customerName");
        String birthday = request.getParameter("customerBirthday");
        String gender = request.getParameter("gender");
        String idNum = request.getParameter("customerIdNum");
        String phone = request.getParameter("customerPhone");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");
        int rank = Integer.parseInt(request.getParameter("customerRank"));
        Customer customer = new Customer(id,name,birthday,gender,idNum,phone,email,address,rank);
        customerService.editCustomer(customer);
        getFormEditCustomer(request, response);
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("customerName");
        String birthday = request.getParameter("customerBirthday");
        String gender = request.getParameter("gender");
        String idNum = request.getParameter("customerIdNum");
        String phone = request.getParameter("customerPhone");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");
        int rank = Integer.parseInt(request.getParameter("customerRank"));
        Customer customer = new Customer(name, birthday, gender, idNum, phone, email, address, rank);
        customerService.addNewCustomer(customer);
        getFormAddNewCustomer(request, response);
    }
}
