package Service;

import DTO.PlansDTO;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface IPlanService {
    // test code
    String storePlan(Map<String, String> jsonData);

    // 현재 달력이 그려지는 날짜를 인자로 받아서
    // 해당 '월 달력'에 관련된 내용을 돌려준다
    // 1. plan
    String getMonthlyPlans(String userId, String currentDate);

    String getWeeklyPlans(String userId, String currentWeek);
}
