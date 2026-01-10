package Dao;

import java.io.InputStream;
import java.util.Properties;

public class DBProperties {

    private static final Properties prop = new Properties();

    static {
        try (InputStream is = DBProperties.class
                .getClassLoader()
                .getResourceAsStream("db.properties")) {

            if (is == null) {
                throw new RuntimeException("Không tìm thấy db.properties");
            }
            prop.load(is);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static final String HOST = prop.getProperty("db.host");
    public static final String PORT = prop.getProperty("db.port");
    public static final String USERNAME = prop.getProperty("db.username");
    public static final String PASSWORD = prop.getProperty("db.pass");
    public static final String DBNAME = prop.getProperty("db.name");

    public static final String JDBC_URL =
            "jdbc:mysql://" + HOST + ":" + PORT + "/" + DBNAME
                    + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
}
