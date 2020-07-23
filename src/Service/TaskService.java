package Service;

import DAO.PlansDAO;
import DTO.PlansDTO;

//import java.util.Date;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;
import java.util.Random;
import java.util.logging.SimpleFormatter;

public class TaskService implements ITaskService {
    private PlansDTO planDTO;
    private final PlansDAO planDAO = PlansDAO.getInstance();

    public TaskService () {
        this.planDTO = new PlansDTO();
    }

    @Override
    public String storeTask(Map<String, String> data) {
        System.out.println("servicing Task...");
        planDTO.setPlanNo("T" + new Random().nextInt(1000)); // 임시 번호
        planDTO.setUserId(data.get("userId"));
        planDTO.setPlanTitle(data.get("title"));
        planDTO.setPlanContent("It's content");

        // 음수로 오는 record 처리
        data.put("recordTime", data.get("recordTime").replace("-", ""));

        long start = Long.parseLong(data.get("startTime"));
        float record = Float.parseFloat(data.get("recordTime"));
        long sum = start + (long)(record*1000) ;

        Timestamp timestamp = new Timestamp(start);
        planDTO.setStartDate(new Date(timestamp.getTime()));

        timestamp = new Timestamp(sum);
        planDTO.setEndDate(new Date(timestamp.getTime()));

        if (planDAO.insertPlan(planDTO))
            return "SUCCESS";

        return "May be Failed";
    }
}
