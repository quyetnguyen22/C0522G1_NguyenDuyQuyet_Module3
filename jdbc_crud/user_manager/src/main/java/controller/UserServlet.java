package controller;

import service.IUserService;
import service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/UserList")
public class UserServlet extends HttpServlet {

    private IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                formCreate(request, request);
                break;
            case "edit":
                formEdit(request, response);
                break;
            case "delete":
                formDelete(request, response);
                break;
            default:
                listUser(request, response);
        }
    }

    private void formCreate(HttpServletRequest request, HttpServletRequest request1) {


    }

    private void formEdit(HttpServletRequest request, HttpServletResponse response) {


    }

    private void formDelete(HttpServletRequest request, HttpServletResponse response) {

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/user/listUser.jsp");
        try {
            request.setAttribute("user", iUserService.selectAllUsers());
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
            case "create":
                createNewUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;

        }
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) {


    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {


    }
}
