package controller;

import model.Service;
import service.IServiceRentingService;
import service.IServiceService;
import service.IServiceTypeService;
import service.impl.ServiceRentingService;
import service.impl.ServiceService;
import service.impl.ServiceTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServiceServlet", value = "/Service")
public class ServiceServlet extends HttpServlet {
    IServiceService services = new ServiceService();
    IServiceRentingService rentingService = new ServiceRentingService();
    IServiceTypeService typeService = new ServiceTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showAll":
                getShowAllService(request, response);
                break;
            case "add":
                getShowFormAdd(request, response);
                break;
            case "edit":
                getFormEdit(request, response);
                break;
            case "search":
                getSearchService(request, response);
                break;
            case "delete":
                getDeleteService(request, response);
                break;
            default:
                backHome(request, response);
        }
    }

    private void getDeleteService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        services.deleteService(id);
        getShowAllService(request, response);
    }

    private void getSearchService(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("service");
        String price = request.getParameter("price");
        String capacity = request.getParameter("capacity");
        if (name == null) {
            name = "";
        }
        if (price == null) {
            price = "";
        }
        if (capacity == null) {
            capacity = "";
        }
        Service service = new Service(name, price, capacity);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/serviceList.jsp");
        try {
            request.setAttribute("serviceList", services.searchService(service));
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getFormEdit(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/formEdit.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("service", services.searchById(id));
            request.setAttribute("rentingList", rentingService.showAllServiceRenting());
            request.setAttribute("serviceType", typeService.showAllServiceType());
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getShowAllService(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/serviceList.jsp");
        try {
            request.setAttribute("serviceList", services.showAllService());
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void getShowFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/formAdd.jsp");
        try {
            request.setAttribute("rentingList", rentingService.showAllServiceRenting());
            request.setAttribute("serviceType", typeService.showAllServiceType());
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
                addNewService(request, response);
                break;
            case "edit":
                editService(request, response);
                break;
            default:
                backHome(request, response);
        }
    }

    private void addNewService(HttpServletRequest request, HttpServletResponse response) {
        String serviceName = request.getParameter("serviceName");
        String area = request.getParameter("area");
        String price = request.getParameter("price");
        String capacity = request.getParameter("capacity");
        String standard = request.getParameter("standard");
        String utility = request.getParameter("utility");
        String poolArea = request.getParameter("poolArea");
        String floor = request.getParameter("floor");
        String freeService = request.getParameter("freeService");
        int serviceType = Integer.parseInt(request.getParameter("serviceType"));
        int renting = Integer.parseInt(request.getParameter("idRenting"));
        if (serviceType == 1) {
            freeService = null;
        } else if (serviceType == 2) {
            freeService = poolArea = null;
        } else {
            poolArea = floor = null;
        }
        Service service = new Service(serviceName, area, price, capacity, standard, utility, poolArea, floor, freeService, serviceType, renting);
        services.addNewService(service);
        getShowFormAdd(request, response);
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("serviceName");
        String area = request.getParameter("area");
        String price = request.getParameter("price");
        String capacity = request.getParameter("capacity");
        String standard = request.getParameter("standard");
        String utility = request.getParameter("utility");
        String poolArea = request.getParameter("poolArea");
        String floor = request.getParameter("floor");
        String freeService = request.getParameter("freeService");
        int renting = Integer.parseInt(request.getParameter("idRenting"));
        int serviceType = Integer.parseInt(request.getParameter("serviceType"));
        Service service = new Service(id, name, area, price, capacity, standard, utility, poolArea, floor, freeService, renting, serviceType);
        services.editService(service);
        getShowAllService(request, response);
    }
}
