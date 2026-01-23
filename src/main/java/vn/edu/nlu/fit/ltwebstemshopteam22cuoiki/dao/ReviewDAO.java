package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Reviews;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    //lấy danh sách đánh gía theo id sản phẩm
    public List<Reviews> findByProductId(int productId) {
        List<Reviews> list = new ArrayList<>();
        String sql = "SELECT * FROM reviews WHERE ProductID = ?";

        try (
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reviews r = new Reviews();
                r.setId(rs.getInt("ID"));
                r.setUserID(rs.getInt("UserID"));
                r.setProductID(rs.getInt("ProductID"));
                r.setRating(rs.getDouble("Rating"));
                r.setComment(rs.getString("Comment"));
                r.setCreateDate(rs.getTimestamp("CreateDate"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //tính điểm đánh giá trung bình
    public double getAverageRating(int productId) {
        String sql = "SELECT AVG(Rating) AS avgRating FROM reviews WHERE ProductID = ?";
        double avg = 0;

        try (
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                avg = rs.getDouble("avgRating");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return avg;
    }

    //insert review
    public void insert(Reviews r){
        String sql = "INSERT INTO reviews(UserID, ProductID, Rating, Comment) VALUE(?, ?, ?, ?)";

        try(
            Connection con = ConnectionDB.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
        ){
            ps.setInt(1, r.getUserID());
            ps.setInt(2, r.getProductID());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getComment());
            ps.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

}
