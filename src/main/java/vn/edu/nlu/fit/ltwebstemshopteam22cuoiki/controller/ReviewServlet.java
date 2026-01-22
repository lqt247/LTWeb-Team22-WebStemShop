package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.ReviewDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Reviews;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =  request.getSession();
        User user = (User)session.getAttribute("user");

        // Check nếu chưa login thì senRedirect về trsng đăng nhâjp
        if(user ==  null){
            response.sendRedirect(request.getContextPath()+"/dang-nhap");
        }
        //Lấy dl từ form
        int productId = Integer.parseInt(request.getParameter("productId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        //Tạo đói tương Reviews
        Reviews r = new Reviews();
        r.setUserID(user.getId());
        r.setProductID(productId);
        r.setRating(rating);
        r.setComment(comment);

        //lưu vào db
        new ReviewDAO().insert(r);

        //quay lại trang chi tiết sp
        response.sendRedirect(request.getContextPath()+"/product-detail?id="+productId);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}