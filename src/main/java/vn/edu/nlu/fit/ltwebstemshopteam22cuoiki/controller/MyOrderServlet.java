package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.OrderDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.OrderItemView;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

@WebServlet("/my-orders")
public class MyOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/view/user/sign-in.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        List<OrderItemView> orders =
                orderDAO.getOrderHistoryByUser(user.getId());

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("/view/shop/my-orders.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}