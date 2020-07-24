package Service;

import DAO.PlansDAO;
import DTO.PlansDTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

public class PlanService implements IPlanService {
    private PlansDTO planDTO;
    private final PlansDAO planDAO = PlansDAO.getInstance();

    public PlanService () {
        this.planDTO = new PlansDTO();
    }

    @Override
    public String storePlan(Map<String, String> data) {
        planDTO.setPlanNo("P" + new Random().nextInt(1000)); // 임시 번호
        planDTO.setUserId(data.get("userId"));
        planDTO.setPlanTitle(data.get("title"));
        planDTO.setPlanContent(data.get("content"));

        long start = Long.parseLong(data.get("startDate"));
        long end = Long.parseLong(data.get("endDate"));

        Timestamp timestamp = new Timestamp(start);
        planDTO.setStartDate(new Date(timestamp.getTime()));

        timestamp = new Timestamp(end);
        planDTO.setEndDate(new Date(timestamp.getTime()));


        if (planDAO.insertPlan(planDTO))
            return "SUCCESS";
        return "May be Failed";
    }

    @Override
    public String getMonthlyPlans(String userId, String currentDate) {
        Date date = new Date(Long.parseLong(currentDate));
        String[] currentDateArr = date.toString().split("-");

        int [] dateArr = new int[currentDateArr.length];
        for (int i=0; i<currentDateArr.length; i++)
            dateArr[i] = Integer.parseInt(currentDateArr[i]);

        Date firstCondition = new Date(dateArr[0] - 1900, dateArr[1]-1, 1);
        Date secondCondition = new Date(dateArr[0] - 1900, dateArr[1], 0);

        String conditionStr ="AND STARTDATE >= DATE '" + firstCondition + "' " +
                "AND STARTDATE <= DATE '" + secondCondition + "'";

        List<PlansDTO> plansDTOList = planDAO.selectAllPlans(userId, conditionStr);
        StringBuilder sb = new StringBuilder("[");
        String pre = "";
        for (PlansDTO obj : plansDTOList) {
            sb.append(pre);
            sb.append(obj.toString());
            pre = ",";
        }
        sb.append("]");
        System.out.println(sb);
        return sb.toString();
    }

    @Override
    public String getWeeklyPlans(String userId, String currentWeek) { // 6/28
        Calendar calendar = Calendar.getInstance();
        Date date = new Date(calendar.getTime().getTime()); // for twice converting util -> sql
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/");
        StringBuilder sb = new StringBuilder();
        sb.append(sdf.format(date));
        sb.append(currentWeek); // first condition
        System.out.println("sb :" +sb); // yyyy/MM/dd
        String[] strArr = sb.toString().split("/");

        // 둘째 조건과 currentWeek의 마지막 날 구하기
        int [] intStrArr = Arrays.stream(strArr).mapToInt(Integer::parseInt).toArray();
        Date endWeek = new Date(intStrArr[0] - 1900, intStrArr[1], 0);
        int currentMonthLastDate = endWeek.getDate();
        System.out.println("currentMonthLastDate :"+ currentMonthLastDate);

        // last date
        int lastDate = Integer.parseInt(strArr[2]);
        System.out.println("lastDate :"+lastDate);
        int[] days = new int[7];
        for (int i = 0; i < days.length; i += 1) {
            days[i] = lastDate + i;
        }
        System.out.println("before days[6]: "+days[6]);
        if (days[6] > currentMonthLastDate)
            days[6] -= currentMonthLastDate;
        System.out.println("after days[6] :"+days[6]);

        // 둘째 조건
        endWeek = new Date(intStrArr[0] - 1900, intStrArr[1], days[6]);
        System.out.println(endWeek);

        String firstCondition = sb.toString().replace("/", "-");
        String secondCondition = endWeek.toString();

        return null;
    }

}
