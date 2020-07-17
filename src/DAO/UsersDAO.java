package DAO;

import DBCP.DBManager;
import DTO.UsersDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDAO {
    private static final UsersDAO usersDAO = new UsersDAO();
    private final String getUsersSQL = "select userId from users where userId = ? ";
    private final String getUserIdSQL = "SELECT count(*) from USERS where userId = ? and userPass = ?";
    private final String insertUserInfoSQL = "INSERT INTO USERS VALUES (?, ?, ?, ?)";

    private UsersDAO() {}

    public static UsersDAO getInstance() {
        return usersDAO;
    }


    // 1. id check
    public boolean getUsers(String userId) {
    	Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean b = false;
        try {
            pstmt = conn.prepareStatement(getUsersSQL);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	b = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
    	return b;
    }
    
    // 2. login
    public boolean getUserId(String userId, String userPass) throws SQLException {
        Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean b = false;
        try {
            pstmt = conn.prepareStatement(getUserIdSQL);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPass);
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	if(rs.getInt("count(*)") != 0)
            		b = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return b;
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