package DAO;

import DBCP.DBManager;
import DTO.PlansDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * plans 테이블에서
 * planNo의 앞 문자에 따라 어떤 종류의 데이터인지 구분한다.
 * ex) planNo가 P12 이면 일정(plan)에 대한 데이터이고, T304 이면 작업(task)에 대한 데이터이다.
 */
public class PlansDAO {
    private static final PlansDAO plansDAO = new PlansDAO();
    private final String insertPlanSQL = "INSERT INTO PLANS VALUES (?, ?, ?, ?, ?, ?)";
    private final String selectPlanSQL = "SELECT PLANNO, PLANTITLE, PLANCONTENT, STARTDATE, ENDDATE FROM PLANS WHERE userId = ? ";
    private final String updatePlanSQL =
            "UPDATE PLANS SET PLANTITLE = ?, PLANCONTENT = ?, STARTDATE = ?, ENDDATE =?" +
                    " WHERE USERID = ? AND PLANNO = ?";
    private final String deletePlanSQL = "DELETE FROM PLANS WHERE USERID = ? AND PLANNO = ?";

    private PlansDAO() {
    }

    public static PlansDAO getInstance() {
        return plansDAO;
    }
    /**
     * @param plan <para>planNo</para>
     *             type : String
     *             format
     *             case plan : P+num
     *             case task : T+num
     *             the data is have formatted by service.
     *
     *             <para>userId</para>
     *             type : String
     *             get from session
     *
     *             <para>planTitle</para>
     *             <para>planContent</para>
     *             type : String
     *             get from user
     *
     *             <para>startDate</para>
     *             type : java.sql.Date
     *             case plan : get from user
     *             case task : get from system (In this case, it means recorded time )
     *
     *             <para>endDate</para>
     *             type : java.sql.Date
     *             case plan : get from user
     *             case task : get from Timer
     */
    public boolean insertPlan(PlansDTO plan) {
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(insertPlanSQL)) {

            pstmt.setString(1, plan.getPlanNo());
            pstmt.setString(2, plan.getUserId());
            pstmt.setString(3, plan.getPlanTitle());
            pstmt.setString(4, plan.getPlanContent());
            pstmt.setDate(5, plan.getStartDate());
            pstmt.setDate(6, plan.getEndDate());

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * @param userId get from session
     * @param planNo get from clicked element
     * @return PlansDTO
     */
    public PlansDTO selectPlan(String userId, String planNo) {
        PlansDTO plan = new PlansDTO();
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(selectPlanSQL + "AND ?")) {

            pstmt.setString(1, userId);
            pstmt.setString(2, planNo);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                plan.setPlanNo(planNo);
                plan.setUserId(userId);
                plan.setPlanTitle(rs.getString("planTitle"));
                plan.setPlanContent(rs.getString("planContent"));
                plan.setStartDate(rs.getDate("StartDate"));
                plan.setEndDate(rs.getDate("EndDate"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return plan;

    }

    /**
     * @param userId    get from session
     * @param condition is String type like "order by ? ['asc' or 'desc']"
     * @return List<PlansDTO>
     */
    public List<PlansDTO> selectAllPlans(String userId, String condition) {
        List<PlansDTO> plansList = new ArrayList<>();
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(selectPlanSQL + condition)) {

            pstmt.setString(1, userId);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                PlansDTO plan = new PlansDTO();
                plan.setPlanNo(rs.getString("planNo"));
                plan.setUserId(userId);
                plan.setPlanTitle(rs.getString("planTitle"));
                plan.setPlanContent(rs.getString("planContent"));
                plan.setStartDate(rs.getDate("StartDate"));
                plan.setEndDate(rs.getDate("EndDate"));

                plansList.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return plansList;
    }

    /**
     * planNo가 P로 시작할 경우, 수정 요청을 처리하는 쿼리
     *
     * @param plan It is new data that user wants to change
     *             in plan 'userId' get from session
     *             in plan 'planNo' get from clicked element
     * @return boolean
     */
    public boolean updatePlan(PlansDTO plan) {
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(updatePlanSQL)) {

            pstmt.setString(1, plan.getPlanTitle());
            pstmt.setString(2, plan.getPlanContent());
            pstmt.setDate(3, plan.getStartDate());
            pstmt.setDate(4, plan.getEndDate());
            pstmt.setString(5, plan.getUserId());
            pstmt.setString(6, plan.getPlanNo());

            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deletePlan(String userId, String planNo) {
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(deletePlanSQL)) {

            pstmt.setString(1, userId);
            pstmt.setString(2, planNo);

            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
