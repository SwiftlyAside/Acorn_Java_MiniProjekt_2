package DAO;

import DBCP.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class MediaDAO {

    /**
     * 입력받은 미디어를 Media 테이블에 추가.
     *
     * @param recordNo  미디어가 포함된 글의 번호
     * @param mediaList 입력받은 미디어의 리스트
     * @return 성공 여부
     */
    public boolean insertMedia(String recordNo, List<String> mediaList) {
        // recordNo에 해당하는 Media를 모두 제거한다.
        deleteMedia(recordNo);

        Connection connection = DBManager.getConnection();
        String sql = "insert into MEDIA values (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            for (String media : mediaList) {
                statement.clearParameters();
                statement.setString(1, recordNo);
                statement.setString(2, media);
                statement.executeQuery();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    /**
     * 글번호에 해당하는 모든 미디어를 제거.
     *
     * @param recordNo 글의 번호
     * @return 성공 여부
     */
    public boolean deleteMedia(String recordNo) {
        Connection connection = DBManager.getConnection();
        String sql = "delete from MEDIA where RECORDNO = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, recordNo);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 조건을 만족하는 모든 미디어 반환.
     *
     * @return [글번호, 미디어] 형태의 맵
     */
    public Map<String, String> getMedia(String condition) {
        return null;
    }
}
