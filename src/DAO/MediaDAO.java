package DAO;

import DBCP.DBManager;
import DTO.MediaDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MediaDAO {
    private static final MediaDAO instance = new MediaDAO();

    private MediaDAO() {
    }

    public static MediaDAO getInstance() {
        return instance;
    }

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
        String sql = "insert into MEDIA values (?, ?)";
        try (Connection connection = DBManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
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
        String sql = "delete from MEDIA where RECORDNO = ?";
        try (Connection connection = DBManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
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
     * @param userId    유저의 ID
     * @param condition 조건
     * @return 미디어 DTO로 구성된 리스트
     */
    public List<MediaDTO> getMedia(String userId, String condition) {
        List<MediaDTO> mediaDTOList = new ArrayList<>();

        String sql = "select R.RECORDNO, MEDIA, R.RECORDDATE from RECORDS R, MEDIA M " +
                "where R.USERID = ? and R.RECORDNO = M.RECORDNO " + condition;
        try (Connection connection = DBManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    mediaDTOList.add(new MediaDTO(
                            rs.getString("RECORDNO"),
                            rs.getString("MEDIA"),
                            rs.getDate("RECORDDATE")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mediaDTOList;
    }
}
