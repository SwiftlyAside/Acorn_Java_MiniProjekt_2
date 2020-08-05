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
	private static final RecordsDAO instance = new RecordsDAO();

    private RecordsDAO() {
    }

    public static RecordsDAO getInstance() {
        return instance;
    }
    
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
				recordsdto.setGeoInfo(rs.getString("geoInfo"));
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
	public String getDiaryRecordNo(){
		String getDiaryListSQL = "select recordNo from RECORDS where recordNo like 'D%' order by recordDate desc";
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String recordNo = null;
		try {
			pstmt = conn.prepareStatement(getDiaryListSQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recordNo = rs.getString("recordNo");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return recordNo;
	}
	public String getMemoRecordNo(){
		String getDiaryListSQL = "select recordNo from RECORDS where recordNo like 'R%' order by recordDate desc";
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String recordNo = null;
		try {
			pstmt = conn.prepareStatement(getDiaryListSQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recordNo = rs.getString("recordNo");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return recordNo;
	}
	public List<RecordsDTO> getRecord(String userId, String condition){
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
				recordsdto.setGeoInfo(rs.getString("geoInfo"));
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
	public boolean setDiary(RecordsDTO recordsdto) {
		boolean b = false;
		String insertDiarySQL = "insert into Records values(?,?,sysdate,?,?,?,?,?) ";
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(insertDiarySQL);
			
			pstmt.setString(1, recordsdto.getRecordNo());
			pstmt.setString(2, recordsdto.getUserId());
			pstmt.setString(3, recordsdto.getTitle());
			pstmt.setString(4, recordsdto.getContent());
			pstmt.setString(5, recordsdto.getGeoInfo());
			pstmt.setString(6, recordsdto.getWeather());
			pstmt.setString(7, recordsdto.getCondition());
			pstmt.execute();
			
			b = true;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return b;
	}
	public boolean setRecord(RecordsDTO recordsdto) {
		boolean b = false;
		String insertRecordsSQL = "insert into Records(recordNo, userId, recordDate, title, content) values(?,?,sysdate,?,?) ";
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(insertRecordsSQL);
			
			pstmt.setString(1, recordsdto.getRecordNo());
			pstmt.setString(2, recordsdto.getUserId());
			pstmt.setString(3, recordsdto.getTitle());
			pstmt.setString(4, recordsdto.getContent());
			pstmt.execute();
			
			b = true;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return b;
	}
	public boolean delRecords(String recordNo, String userId) {
		boolean b = false;
		String deleteDiarySQL = "delete from Records where recordNo = ? and userId = ? ";
		
		Connection conn = DBManager.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(deleteDiarySQL);
			
			pstmt.setString(1, recordNo);
			pstmt.setString(2, userId);
			pstmt.execute();
			
			b = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return b;
	}
}