package controller;

import model.Employee;
import model.EmployeePosition;
import service.IEmployeeDepartmentService;
import service.IEmployeeEduLevelService;
import service.IEmployeePositionService;
import service.IEmployeeService;
import service.impl.EmployeeDepartmentService;
import service.impl.EmployeeEduLevelService;
import service.impl.EmployeePositionService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/Employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    IEmployeePositionService positionService = new EmployeePositionService();
    IEmployeeEduLevelService eduLevelService = new EmployeeEduLevelService();
    IEmployeeDepartmentService departmentService = new EmployeeDepartmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showAll":
                getShowAllEmployee(request, response);
                break;
            case "edit":
                getFormEdit(request, response);
                break;
            case "add":
                getFormAddEmployee(request, response);
                break;
            case "delete":
                getDeleteEmployee(request, response);
                break;
            case "search":
                getSearchEmployee(request, response);
                break;
            case "showById":
                getShowInfo(request, response);
                break;
            default:
                backHome(request, response);
        }
    }

    private void getShowInfo(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/employeeInfo.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("employee", employeeService.searchById(id));
            request.setAttribute("positionName", positionService.EmployeePosition());
            request.setAttribute("eduLevelName", eduLevelService.EmployeeEduLevel());
            request.setAttribute("departmentName", departmentService.EmployeeDepartment());
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getSearchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String phoneNum = request.getParameter("phoneNum");
        String address = request.getParameter("address");
        if (name == null) {
            name = "";
        }
        if (phoneNum == null) {
            phoneNum = "";
        }
        if (address == null) {
            address = "";
        }
        Employee employee = new Employee(name, phoneNum, address);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/employeeList.jsp");
        try {
            request.setAttribute("employeeList", employeeService.searchEmployee(employee));
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getFormEdit(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/formEdit.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("employee", employeeService.searchById(id));
        request.setAttribute("positionName", positionService.EmployeePosition());
        request.setAttribute("eduLevelName", eduLevelService.EmployeeEduLevel());
        request.setAttribute("departmentName", departmentService.EmployeeDepartment());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getDeleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean success = employeeService.deleteEmployee(id);
        String mess;
        if (success) {
            mess = "Deleted successfully";
        }
        mess = "Deleted unsuccessfully";

        request.setAttribute("employeeDel", employeeService.searchById(id));
        request.setAttribute("mess", mess);

//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/employeeList.jsp");
//        try {
//
//            requestDispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            response.sendRedirect("/Employee");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        getShowAllEmployee(request, response);

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

    private void getFormAddEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/formAdd.jsp");
        request.setAttribute("positionName", positionService.EmployeePosition());
        request.setAttribute("eduLevelName", eduLevelService.EmployeeEduLevel());
        request.setAttribute("departmentName", departmentService.EmployeeDepartment());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getShowAllEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/employeeList.jsp");
        request.setAttribute("employeeList", employeeService.showAllEmployee());
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
                addEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            default:
                backHome(request, response);

        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("employeeName");
        String birthday = request.getParameter("employeeBirthday");
        String idNum = request.getParameter("employeeIdNum");
        String phone = request.getParameter("employeePhone");
        String email = request.getParameter("employeeEmail");
        String salary = request.getParameter("employeeSalary");
        String address = request.getParameter("employeeAddress");
        int positionCode = Integer.parseInt(request.getParameter("employeePosition"));
        int eduLevelCode = Integer.parseInt(request.getParameter("employeeEduLevel"));
        int departmentCode = Integer.parseInt(request.getParameter("employeeDepartment"));
        Employee employee = new Employee(id, name, birthday, idNum, phone, email, salary, address,
                positionCode, eduLevelCode, departmentCode);
        employeeService.editEmployee(employee);
        getFormEdit(request, response);
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("employeeName");
        String birthday = request.getParameter("employeeBirthday");
        String idNum = request.getParameter("employeeIdNum");
        String phone = request.getParameter("employeePhone");
        String email = request.getParameter("employeeEmail");
        String salary = request.getParameter("employeeSalary");
        String address = request.getParameter("employeeAddress");
        int positionCode = Integer.parseInt(request.getParameter("employeePosition"));
        int eduLevelCode = Integer.parseInt(request.getParameter("employeeEduLevel"));
        int departmentCode = Integer.parseInt(request.getParameter("employeeDepartment"));
        Employee employee = new Employee(name, birthday, idNum, phone, email, salary, address,
                positionCode, eduLevelCode, departmentCode);
        boolean success = employeeService.addNewEmployee(employee);
        String mess;
        if (success) {
            mess = "Added successfully";
        }
        mess = "Added unsuccessfully";
        request.setAttribute("mess", mess);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/formAdd.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
