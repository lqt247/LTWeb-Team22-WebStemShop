package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.ProductDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Product;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/admin-products")
public class ProductManagementServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
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
            // Lấy danh sách sản phẩm
            List<Product> products = productDAO.getAll();
            request.setAttribute("products", products);

            request.getRequestDispatcher("/view/admin/admin-products.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            if ("delete".equals(action)) {
                // Xóa sản phẩm - chức năng sẽ implement sau
                int id = Integer.parseInt(request.getParameter("id"));
                // productDAO.deleteProduct(id);
            }

            response.sendRedirect(request.getContextPath() + "/admin/admin-products");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi xảy ra");
        }
    }
}