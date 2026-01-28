package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PromotionDAO {

    public Promotion findByCode(String code) {
        String sql = "SELECT * FROM promotions WHERE Code = ? AND Status = 'ACTIVE' AND CURRENT_DATE BETWEEN StartDate AND EndDate";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, code.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Promotion(
                        rs.getInt("ID"),
                        rs.getString("Code"),
                        rs.getString("Description"),
                        rs.getDate("StartDate"),
                        rs.getDate("EndDate"),
                        rs.getString("Status")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    }