package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Cart;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/dang-nhap")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("cart", new Cart());

            // Phân biệt admin và user -> nếu admin thì cho qua dashboard, user thì mình cho về trang chủ
            if ("admin".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                response.sendRedirect("index");
            }
        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("/view/user/signIn.jsp").forward(request, response);
        }
    }
    }
