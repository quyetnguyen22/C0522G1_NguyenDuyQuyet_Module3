package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {

    private IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                formAdd(request, response);
                break;
            case "showAll":
                showAllProduct(request, response);
                break;
            case "showByID":
                showByID(request,response);
                break;
            case "showByName":
                showByName(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
            default:
                homeProduct(request,response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showByName(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showByID(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showAllProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/productList.jsp");
        request.setAttribute("showAll", iProductService.showAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void homeProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/display.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void formAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/addNew.jsp");
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                formSave(request, response);
                break;
            case "update":
                update(request,response);
                break;
            default:
                homeProduct(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {

    }

    private void formSave(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("desc");
        String producer = request.getParameter("producer");
        iProductService.add(new Product(id, name, price, description, producer));
        request.setAttribute("mess", "Add successfully!");
        formAdd(request,response);
    }
}
