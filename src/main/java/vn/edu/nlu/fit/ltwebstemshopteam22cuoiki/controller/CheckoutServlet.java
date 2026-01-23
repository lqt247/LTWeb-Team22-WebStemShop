package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.OrderDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.OrderDetailDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null || cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // 1. Tạo order
        Order order = new Order();
        order.setUserId(user.getId());
        order.setOrderStatus("CONFIRMED");
        order.setShippingFee(30000);
        order.setTotalAmount(cart.getTotal() + 30000);
        order.setShippingAddress(request.getParameter("address"));
        order.setReceiverName(request.getParameter("name"));
        order.setReceiverPhone(request.getParameter("phone"));

        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(order);

        // 2. Insert order_detail
        OrderDetailDAO detailDAO = new OrderDetailDAO();

        for (CartItem item : cart.getItems()) {
            OrderDetail od = new OrderDetail();
            od.setOrderId(orderId);
            od.setProductId(item.getProduct().getId());
            od.setQuantity(item.getQuantity());
            od.setPrice(item.getProduct().getPrice());

            detailDAO.insert(od);
        }

        // 3. Clear cart
        session.removeAttribute("cart");

        response.sendRedirect("order-success.jsp");
    }
}