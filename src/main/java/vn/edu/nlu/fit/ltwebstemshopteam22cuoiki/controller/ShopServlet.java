package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

<<<<<<< HEAD
=======
import java.io.IOException;
import java.util.List;

>>>>>>> d0bbf84b4a2b803bbf35ce7663fabd426b7f4850
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.ProductDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Product;

<<<<<<< HEAD
import java.io.IOException;
import java.util.List;

=======
>>>>>>> d0bbf84b4a2b803bbf35ce7663fabd426b7f4850
@WebServlet("/shop")
public class ShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        // 1. Lấy danh sách sản phẩm từ DB
        List<Product> products = productDAO.getAll();

        System.out.println(">>> ShopServlet DOGET chạy <<<");
        System.out.println("Products size = " + products.size());

        // 2. Gửi sang JSP
        request.setAttribute("products", products);

        // 3. Forward sang shop.jsp
        request.getRequestDispatcher("/view/shop/shop.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}