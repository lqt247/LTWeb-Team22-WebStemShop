package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.UUID;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.util.EmailUtil;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.util.PasswordUtil;

@WebServlet("/quen-mat-khau")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();
        User user = dao.findByUsernameAndEmail(username, email);

        if (user == null) {
            request.setAttribute("error", "Username hoặc email không đúng");
            request.getRequestDispatcher("view/user/forgot-password.jsp").forward(request, response);
            return;
        }

        // cung cấp mật khẩu mới
        String newPassword = UUID.randomUUID().toString().substring(0, 8);
        String hashedPassword = PasswordUtil.md5(newPassword);

        boolean updated = dao.updatePassword(user.getId(), hashedPassword);

        if (updated) {
            EmailUtil.sendResetPasswordEmail(email, newPassword);
            request.setAttribute("message", "Mật khẩu mới đã được gửi về email");
        } else {
            request.setAttribute("error", "Không thể đặt lại mật khẩu");
        }

        request.getRequestDispatcher("view/user/forgot-password.jsp").forward(request, response);
    }
}