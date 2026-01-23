package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.OrderDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Order;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;


import java.io.IOException;
import java.util.List;

@WebServlet("/admin/admin-user-detail")
public class UserDetailServlet extends HttpServlet {

    private UserDAO userDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra admin
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("user");

        if (admin == null || !"admin".equals(admin.getRole())) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        try {
            int userId = Integer.parseInt(request.getParameter("id"));

            // Thông tin user
            User user = userDAO.getUserById(userId);

            // Danh sách đơn hàng
            List<Order> orders = orderDAO.getOrdersByUserId(userId);

            request.setAttribute("user", user);
            request.setAttribute("orders", orders);

            request.getRequestDispatcher("/view/admin/admin-user-detail.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Có lỗi xảy ra");
        }
    }
}