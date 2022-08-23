import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "discountServlet", value = "/discount")
public class discountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//String description = request.getParameter("description");
double price = Double.parseDouble(request.getParameter("price"));
double discount = Double.parseDouble(request.getParameter("discount"));
double discountAmount = price * discount * 0.01;
double discountPrice = price - discountAmount;

RequestDispatcher requests = request.getRequestDispatcher("result.jsp");
request.setAttribute("discountAmount", discountAmount);
request.setAttribute("discountPrice", discountPrice);
requests.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
