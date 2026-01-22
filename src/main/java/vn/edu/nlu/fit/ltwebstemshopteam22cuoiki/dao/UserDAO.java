package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao;


import Dao.BaseDao;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends BaseDao {
    //Lấy danh sác user
    public List<User> getAllUsers() {
        List<User> Users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = ConnectionDB.getConnection();
            ps = con.prepareStatement(sql);
            rs =  ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("ID"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setUserName(rs.getString("UserName"));
                u.setRole(rs.getString("Role"));
                u.setStatus(rs.getString("Status"));

                Users.add(u);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return Users;
    }

    // lấy ra 1 user
    public User login(String username, String password) {
        String sql = "SELECT * FROM users WHERE UserName=? AND Password=?";
        try (Connection conn = ConnectionDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("ID"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //  Đăng ký
    public boolean register(User user) {
        String sql = "INSERT INTO users " +
                "(FullName, Email, UserName, Password, Role, Status, CreateAt) " +
                "VALUES (?, ?, ?, ?, ?, ?, CURRENT_DATE)";

        try (Connection conn = ConnectionDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUserName());
            ps.setString(4, user.getPassword());
            ps.setString(5, "USER");     // role mặc định
            ps.setString(6, "ACTIVE");   // status mặc định

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    // check trùng username
    public boolean isUsernameExists(String username) {
        String sql = "SELECT ID FROM users WHERE UserName = ?";
        try (Connection conn = ConnectionDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
