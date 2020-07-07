package DAO;

import java.util.Map;

public class UsersDAO {
    private final String getUserIdSQL = "SELECT userId, userPass from USERS where userId = ?";
    private final String insertUserInfoSQL = "INSERT INTO USERS VALUES (?, ?, ?, ?)";

    // 1. login
    // 2. id check
    public Map<String, String> getUserId(String userId) {
        // Map<String, String> map = new HashMap<>();
        // Connection conn = XXX.getConnection ***add later***
        // PreparedStatement pstmt = conn.prepareStatement(getUserIdSQL);
        // pstmt.setString(1, userId);
        // ResultSet rs = pstmt.executeQuery();
        // if (rs.next) { map.put("id", rs.getString(1)); map.put("pass", rs.getString(2)); }
        // finally { connection close }
        // return map;
        return null;
    }

    // 1. join member
    public boolean insertUserInfo(UsersDTO userInfo) {
        // Connection conn = XXX.getConnection ***add later***
        // PreparedStatement pstmt = conn.prepareStatement(insertUserInfoSQL);
        // pstmt.setString(1, userInfo.userId);
        // pstmt.setString(2, userInfo.userPass);
        // pstmt.setString(3, userInfo.userName);
        // pstmt.setString(4, userInfo.userEmail);
        // pstmt.execute();

        return true;
    }

}
