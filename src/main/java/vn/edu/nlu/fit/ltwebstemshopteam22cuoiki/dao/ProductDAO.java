package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        //String sql = "SELECT * FROM products";
        String sql = "SELECT p.*, b.BrandName," +
                "(SELECT ImageURL FROM product_image WHERE ProductID = p.ID LIMIT 1) AS image_url " +
                "FROM products p JOIN brands b ON p.BrandID = b.ID";
        try (
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
        ) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setCategoriesID(rs.getInt("CategoryID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setBrandName(rs.getString("BrandName"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setImageUrl(rs.getString("image_url"));

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public Product findByIdWithImage(int id) {
        String sql = "SELECT p.*, b.BrandName, " +
                "(SELECT ImageURL FROM product_image WHERE ProductID = p.ID LIMIT 1) AS image_url " +
                "FROM products p  JOIN brands b ON p.BrandID = b.ID " +
                "WHERE p.ID = ?";
        try (
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setCategoriesID(rs.getInt("CategoryID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setBrandName(rs.getString("BrandName"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setImageUrl(rs.getString("image_url"));
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // hàm lấy thông tin của một sản phẩm theo id
    public Product findById(int id) {
        String sql = "SELECT * FROM products WHERE ID = ?";
        try (
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setCategoriesID(rs.getInt("CategoryID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // Xóa sản phẩm
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE ID=?";
        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật sản phẩm
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET ProductName=?, Description=?, Price=?, Quantity=?, CategoryID=?, BrandID=? WHERE ID=?";
        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setInt(5, product.getCategoriesID());
            ps.setInt(6, product.getBrandID());
            ps.setInt(7, product.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Đếm tổng số sản phẩm
    public int countProducts() {
        String sql = "SELECT COUNT(*) FROM products";
        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy sản phẩm theo trang
    public List<Product> getProductsByPage(int offset, int limit) {
        List<Product> list = new ArrayList<>();

        String sql ="SELECT p.ID, p.ProductName, p.Price, p.CategoryID, p.BrandID, "+
                            "(SELECT ImageURL FROM product_image WHERE ProductID = p.ID LIMIT 1) AS image_url "+
                    "FROM products p "+
                    "ORDER BY p.ID "+
                    "LIMIT ? OFFSET ?";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, limit);
            ps.setInt(2, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setProductName(rs.getString("ProductName"));
                p.setPrice(rs.getDouble("Price"));
                p.setCategoriesID(rs.getInt("CategoryID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setImageUrl(rs.getString("image_url"));

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy toàn bộ sản phẩm và thương hiệu
    public List<Product> getAllWithBrand() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, b.BrandName, "+
        "(SELECT ImageURL FROM product_image WHERE ProductID = p.ID LIMIT 1) AS imageUrl "+
        "FROM products p "+
        "JOIN brands b ON p.BrandID = b.ID "+
        "WHERE p.status=1 "+
        "ORDER BY p.ID DESC";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setProductName(rs.getString("ProductName"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setBrandName(rs.getString("BrandName"));
                p.setImageUrl(rs.getString("imageUrl"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Tìm sản phẩm theo tên
    public List<Product> searchByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, b.BrandName, "+
        "(SELECT ImageURL FROM product_image WHERE ProductID = p.ID LIMIT 1) AS imageUrl "+
        "FROM products p "+
        "JOIN brands b ON p.BrandID = b.ID "+
        "WHERE p.ProductName LIKE ?";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setProductName(rs.getString("ProductName"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setBrandName(rs.getString("BrandName"));
                p.setImageUrl(rs.getString("imageUrl"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Xóa sản phẩm (chỉ ẩn nó đi, default là 1 nghĩa là sp vẫn còn đang đươcj bán, set lại 0 nghĩa là sp ko còn bán nữa)
    public void deleteById(int id) {
        String sql = "UPDATE products SET status = 0 WHERE ID = ?";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // thêm mới 1 sp
    // Thêm sản phẩm mới và trả về ID vừa insert
    public int insertProduct(Product product) {
        String sql = "INSERT INTO products " +
                "(ProductName, Description, Price, Quantity, CategoryID, BrandID, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, 1)";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setInt(5, product.getCategoriesID());
            ps.setInt(6, product.getBrandID());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // productId vừa tạo
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

}
