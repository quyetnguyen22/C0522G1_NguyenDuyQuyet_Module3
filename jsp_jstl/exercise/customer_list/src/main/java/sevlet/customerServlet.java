package sevlet;

import model.customer;
import org.w3c.dom.stylesheets.LinkStyle;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = {"","/customerServlet"})
public class customerServlet extends HttpServlet {
    private static List<customer> customerList = new ArrayList<>();

    static {
        customerList.add(new customer("Bảo Bảo", "22/02/2001", "Đồng Môn,Tp.Hà Tĩnh", "https://scontent.fsgn2-5.fna.fbcdn.net/v/t1.18169-9/12715493_1743694992583623_5101980368952793342_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_ohc=_hFaT4uQsPYAX99ThEy&tn=LflnYNMR3NXrTbru&_nc_ht=scontent.fsgn2-5.fna&oh=00_AT9UGYvHwQlbEdPTd9LHWxxJgRQi6qL1tvtX9cR4aHDaTw&oe=6329E6FF"));
        customerList.add(new customer("Nam Huyn", "19/11/1993", "Tp.Tam Kỳ", "https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/300712245_1780076252339760_2012766475062153516_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=ZiVg0ms736wAX9J49i7&_nc_ht=scontent.fsgn2-6.fna&oh=00_AT9JbjvmSj6CuNB9a1Wh4_OFyM7zlB5587h8XD4lKZV-nw&oe=630B2D2B"));
        customerList.add(new customer("Duy Quyết", "11/11/1996", "Tp.Hà Tĩnh", ""));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
