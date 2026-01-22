package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Cart;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;


@WebServlet("/dang-nhap")
public class LoginServlet  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);
        String url ="";
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("cart", new Cart());
            url="index.jsp";
            response.sendRedirect(url);
        } else {
            request.setAttribute("error", "Username hoặc password không đúng, vui lòng nhập lại");
            request.setAttribute("username",  username);
            url = "view/user/sign-in.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
}