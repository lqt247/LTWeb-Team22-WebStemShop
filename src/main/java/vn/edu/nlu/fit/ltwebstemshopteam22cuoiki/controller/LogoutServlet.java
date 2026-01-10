package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

<<<<<<< HEAD
=======
import java.io.IOException;
import java.io.PrintWriter;

>>>>>>> d0bbf84b4a2b803bbf35ce7663fabd426b7f4850
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

<<<<<<< HEAD
import java.io.IOException;

=======
>>>>>>> d0bbf84b4a2b803bbf35ce7663fabd426b7f4850
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lấy session hiện tại (nếu có)
        HttpSession session =  request.getSession(false);
        //check và hủy session
        if(session != null){
            session.invalidate();
        }
        //quay về trang chủ
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}