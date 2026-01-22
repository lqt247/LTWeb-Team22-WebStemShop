package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.test;

import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.config.ConnectionDB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestConnection {

    public static void main(String[] args) {
        System.out.println("=== Test Database Connection ===");

        // Test lần 1 nó sẽ: kết nối database
        testConnection();

        // Test lần 2 nó sẽ: hiển thị tất cả bảng
        testShowTables();
    }


    public static void testConnection() {
        try (Connection conn = ConnectionDB.getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối DB thành công!");
            }
        } catch (Exception e) {
            System.out.println("Không kết nối được");
            e.printStackTrace();
        }
    }

   // này là hiển thị bảng
    public static void testShowTables() {
        String sql = "SHOW TABLES";
        int tong_so_bang = 0 ;
        try (Connection conn = ConnectionDB.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            System.out.println("Danh sách bảng ");


            while (rs.next()) {
                tong_so_bang++ ;
                System.out.println(" " + rs.getString(1));

            }
            // In ra số bảng ( cho dễ biết)
            System.out.println("Tổng số bảng: " + tong_so_bang);
        } catch (Exception e) {
            System.out.println("Lỗi");
            e.printStackTrace();
        }
    }
}
