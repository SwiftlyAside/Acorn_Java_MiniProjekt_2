package DAO;

import DBCP.DBManager;
import DTO.UsersDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class UsersDAO {
    private static final UsersDAO usersDAO = new UsersDAO();
    private final String getUserIdSQL = "SELECT userId, userPass from USERS where userId = ?";
    private final String insertUserInfoSQL = "INSERT INTO USERS VALUES (?, ?, ?, ?)";

    private UsersDAO() {}

    public static UsersDAO getInstance() {
        return usersDAO;
    }


    // 1. login
    // 2. id check
    public Map<String, String> getUserId(String userId) throws SQLException {
        Map<String, String> map = new HashMap<>();
        Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(getUserIdSQL);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                map.put("id", rs.getString(1));
                map.put("pass", rs.getString(2));
                return map;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }


        return null;
    }

    // 1. join member
    public boolean insertUserInfo(UsersDTO userInfo) {
        Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(insertUserInfoSQL);

            pstmt.setString(1, userInfo.getUserId());
            pstmt.setString(2, userInfo.getUserPass());
            pstmt.setString(3, userInfo.getUserName());
            pstmt.setString(4, userInfo.getUserEmail());
            pstmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
        return true;
    }

}
