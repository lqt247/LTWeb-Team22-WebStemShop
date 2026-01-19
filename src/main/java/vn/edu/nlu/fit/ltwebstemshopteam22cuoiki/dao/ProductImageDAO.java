package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.ProductImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductImageDAO {
    // Lấy danh sách các ảnh của 1 sp theo id
    public List<ProductImage> findByProductId (int productId){
        List<ProductImage> list = new ArrayList<ProductImage>();
        String sql = "SELECT * FROM product_image  WHERE ProductID = ? ORDER BY ID ASC";
        try (
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
            ){
            ps.setInt(1,productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                ProductImage img = new ProductImage(
                    rs.getInt("ID"),
                    rs.getInt("ProductID"),
                    rs.getString("ImageURL")
                );
                list.add(img);
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

}
