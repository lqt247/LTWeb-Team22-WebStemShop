package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

import java.io.IOException;
import java.util.Map;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private DashboardDAO dashboardDAO;

    @Override
    public void init() throws ServletException {
        dashboardDAO = new DashboardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra quyền admin
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        try {
            // Lấy thống kê
         Map<String, Integer> stats = dashboardDAO.getDashboardStats();
         double revenue = dashboardDAO.getTotalRevenue();

         // set atribu
            request.setAttribute("totalUsers", stats.get("totalUsers"));
            request.setAttribute("totalProducts", stats.get("totalProducts"));
            request.setAttribute("totalOrders", stats.get("totalOrders"));
            // bài viet sẽ là cứng thôi
            request.setAttribute("totalBlogs", 20);
             request.setAttribute("totalRevenue", revenue);

            // tải JSP
            request.getRequestDispatcher("/view/admin/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("---LỖI DASHBOARD---");
            e.printStackTrace();
            System.out.println("-------------");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Có lỗi xảy ra khi tải dashboard");
        }
    }
}

