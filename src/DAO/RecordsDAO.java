package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBCP.DBManager;
import DTO.RecordsDTO;

public class RecordsDAO {
	public List<RecordsDTO> getDiary(String userId, String condition){
		List<RecordsDTO> list = new ArrayList<RecordsDTO>();
		
		String getDiaryListSQL = "select * from RECORDS where userId = ? and recordNo like 'D%' " + condition;
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(getDiaryListSQL);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecordsDTO recordsdto = new RecordsDTO();
				
				recordsdto.setRecordNo(rs.getString("recordNo"));
				recordsdto.setRecordDate(rs.getDate("recordDate"));
				recordsdto.setTitle(rs.getString("title"));
				recordsdto.setContent(rs.getString("content"));
				recordsdto.setGeoInfo(rs.getInt("geoInfo"));
				recordsdto.setWeather(rs.getString("weather"));
				recordsdto.setCondition(rs.getString("condition"));
				
				list.add(recordsdto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
	public List<RecordsDTO> getRecords(String userId, String condition){
		List<RecordsDTO> list = new ArrayList<RecordsDTO>();
		
		String getRecordsListSQL = "select * from records where userId = ? and recordNo like 'R%' " + condition;
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(getRecordsListSQL);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecordsDTO recordsdto = new RecordsDTO();
				recordsdto.setRecordNo(rs.getString("recordNo"));
				recordsdto.setRecordDate(rs.getDate("recordDate"));
				recordsdto.setTitle(rs.getString("title"));
				recordsdto.setContent(rs.getString("content"));
				recordsdto.setGeoInfo(rs.getInt("geoInfo"));
				recordsdto.setWeather(rs.getString("weather"));
				recordsdto.setCondition(rs.getString("condition"));
				
				list.add(recordsdto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
