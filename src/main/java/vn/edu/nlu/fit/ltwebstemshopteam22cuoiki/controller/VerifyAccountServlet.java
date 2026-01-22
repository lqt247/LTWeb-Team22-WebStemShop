package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;

import java.io.IOException;

@WebServlet("/xac-thuc")
public class VerifyAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        UserDAO dao = new UserDAO();

        if (dao.verifyAccount(token)) {
            request.setAttribute("success", "Xác thực thành công! Bạn có thể đăng nhập.");
        } else {
            request.setAttribute("error", "Link xác thực không hợp lệ hoặc đã hết hạn.");
        }

        request.getRequestDispatcher("/view/user/sign-in.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}