package Dao;



import java.sql.Connection;
import java.sql.DriverManager;

public class DBTest {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    DBProperties.JDBC_URL,
                    DBProperties.USERNAME,
                    DBProperties.PASSWORD
            );
            System.out.println("KẾT NỐI DATABASE THÀNH CÔNG");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
