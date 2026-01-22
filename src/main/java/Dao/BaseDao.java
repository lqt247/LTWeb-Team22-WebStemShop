package Dao;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public abstract class BaseDao {
    private Jdbi jdbi;

    protected Jdbi get(){
        if(jdbi == null){
            makeConnect();
        }
        return jdbi;
    }
    private void makeConnect(){
        MysqlDataSource src = new MysqlDataSource();
        String url = "jdbc:mysql://" + DBProperties.HOST + ":" + DBProperties.PORT + "/" + DBProperties.DBNAME + "?" +DBProperties.OPTION;
        src.setUrl(url);
        src.setUser(DBProperties.USERNAME);
        src.setPassword(DBProperties.PASSWORD);

        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(src);
    }


}
