package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.BrandDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.CategoryDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.ProductDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.ProductImageDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Brand;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Category;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Product;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet("/admin/admin-product-add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class AdminProductAddServlet extends HttpServlet {

    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private BrandDAO brandDAO;
    private ProductImageDAO productImageDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
        brandDAO = new BrandDAO();
        productImageDAO = new ProductImageDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("user");

        if (admin == null || !"admin".equals(admin.getRole())) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        try {
            // Lấy danh sách danh mục, brand
            List<Category> categories = categoryDAO.getAllCategories();
            List<Brand> brands = brandDAO.getAllBrands();

            request.setAttribute("categories", categories);
            request.setAttribute("brands", brands);
            request.getRequestDispatcher("/view/admin/admin-product-add.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/admin-products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            // Tạo sản phẩm mới
            Product product = new Product();
            product.setProductName(request.getParameter("productName"));
            product.setDescription(request.getParameter("description"));
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            product.setCategoriesID(Integer.parseInt(request.getParameter("categoryID")));
            product.setBrandID(Integer.parseInt(request.getParameter("brandID")));

            // Thêm sản phẩm vào db và lấy id
            int productId = productDAO.addProduct(product);

            if (productId > 0) {
                // Xử lý upload ảnh
                Part filePart = request.getPart("productImage");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                    String timestamp = String.valueOf(System.currentTimeMillis());
                    String extension = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = "product_" + productId + "_" + timestamp + extension;

                    String uploadPath = getServletContext().getRealPath("") + "assets/images/products";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    String filePath = uploadPath + File.separator + newFileName;
                    filePart.write(filePath);

                    String imageUrl = "/assets/images/products/" + newFileName;
                    productImageDAO.updateOrAddProductImage(productId, imageUrl);
                }

                response.sendRedirect(request.getContextPath() + "/admin/admin-products");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể thêm sản phẩm");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi : " + e.getMessage());
        }
    }
}
