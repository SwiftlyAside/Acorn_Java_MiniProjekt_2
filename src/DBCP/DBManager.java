package DBCP;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBManager {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Context initCtx = new InitialContext();
            Context encCtx = (Context) initCtx.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) encCtx.lookup("oracleConnInfo");
            conn = dataSource.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, Statement stmt) {
        try {
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
