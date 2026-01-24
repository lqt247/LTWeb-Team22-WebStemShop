package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.CartItem;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.Order;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.OrderItemView;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDAO {

    public int insert(Order order) throws Exception {

        String sql = "INSERT INTO orders (UserID, PromotionID, OrderDate, OrderStatus, ShippingFee, TotalAmount, Note, ShippingAddress, ReceiverName, ReceiverPhone) VALUES (?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());

            if (order.getPromotionId() != null)
                ps.setInt(2, order.getPromotionId());
            else
                ps.setNull(2, Types.INTEGER);

            ps.setString(3, order.getOrderStatus());
            ps.setDouble(4, order.getShippingFee());
            ps.setDouble(5, order.getTotalAmount());
            ps.setString(6, order.getNote());
            ps.setString(7, order.getShippingAddress());
            ps.setString(8, order.getReceiverName());
            ps.setString(9, order.getReceiverPhone());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        }

        return -1;
    }

    // hàm láy toàn bộ lịch sử mua hàng của user
    public List<OrderItemView> getOrderHistoryByUser(int userId) {
        List<OrderItemView> list = new ArrayList<>();

        String sql =
                "SELECT o.ID AS orderId, o.OrderStatus, " +
                        "p.ProductName, pi.ImageURL, od.Quantity, od.Price " +
                        "FROM orders o " +
                        "JOIN order_detail od ON o.ID = od.OrderID " +
                        "JOIN products p ON od.ProductID = p.ID " +
                        "LEFT JOIN product_image pi ON p.ID = pi.ProductID " +
                        "WHERE o.UserID = ? " +
                        "GROUP BY o.ID, p.ID " +
                        "ORDER BY o.OrderDate DESC, o.ID DESC";

        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new OrderItemView(
                        rs.getInt("orderId"),
                        rs.getString("ProductName"),
                        rs.getString("ImageURL"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getString("OrderStatus")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}