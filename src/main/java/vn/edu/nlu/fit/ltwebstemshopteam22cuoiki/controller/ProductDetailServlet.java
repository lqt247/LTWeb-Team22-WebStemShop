package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.ProductDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Product;

import java.io.IOException;

@WebServlet("/product-detail")
public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.findByIdWithImage(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("/view/shop/product-detail.jsp")
                .forward(request, response);
    }
}
