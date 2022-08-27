package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
            case "showById":
                showById(request, response);
                break;
            case "search":
                showByName(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "update":
                formUpdate(request, response);
                break;
            default:
                homeProduct(request, response);
        }
    }

    private void formUpdate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/update.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.showById(id);
        request.setAttribute("product", product);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
//        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = iProductService.showById(id);
//        if (product == null) {
//            requestDispatcher = request.getRequestDispatcher("view/product/error.jsp");
//        } else {
//            request.setAttribute("productId", product);
//
//        }
//        requestDispatcher.forward(request,response);
        iProductService.delete(id);
        try {
            response.sendRedirect("/product?action=showAll");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showByName(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/productList.jsp");
        String name = request.getParameter("productName");
        request.setAttribute("showAll", iProductService.showByName(name));
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showById(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/productList.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("productList", iProductService.showById(id));
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
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
                add(request, response);
                break;
            case "update":
                update(request, response);
                break;
            default:
                homeProduct(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("desc");
        String producer = request.getParameter("producer");
        iProductService.save(new Product(id, name, price, description, producer));
        request.setAttribute("mess", "Update successfully!");
        showAllProduct(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("desc");
        String producer = request.getParameter("producer");
        iProductService.save(new Product(id, name, price, description, producer));
        request.setAttribute("mess", "Add successfully!");
        formUpdate(request, response);
    }
}
