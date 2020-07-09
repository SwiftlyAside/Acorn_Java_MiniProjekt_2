package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DBCP.DBManager;

public class RecordsDAO {
	private final String getDiaryListSQL = "select * from RECORDS, MEDIA where userId = ? order by recordDate desc";
	
	public List<Map<String, String>> getDiaryList(String userId){
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(getDiaryListSQL);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("recordNo", rs.getString("recordNo"));
				map.put("recordDate", rs.getString("recordDate"));
				map.put("title", rs.getString("title"));
				map.put("content", rs.getString("content"));
				map.put("isDiary", rs.getString("isDiary"));
				map.put("geoInfo", rs.getString("geoInfo"));
				map.put("weather", rs.getString("weather"));
				map.put("condition", rs.getString("condition"));
				map.put("media", rs.getString("media"));
				
				list.add(map);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
