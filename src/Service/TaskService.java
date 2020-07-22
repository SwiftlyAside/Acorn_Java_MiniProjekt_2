package Service;

import DAO.PlansDAO;
import DTO.PlansDTO;

import java.sql.Date;
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

        // 음수로 오는 record 처리
        data.put("recordTime", data.get("recordTime").replace("-", ""));
        System.out.println(data.get("recordTime"));
        System.out.println(new Date(Long.parseLong(data.get("startTime"))) + data.get("recordTime"));
//        SimpleFormatter formatter =
//        planDTO.setStartDate(new Date(Long.parseLong(data.get("startTime"))));
//        planDTO.setEndDate(new Date(Long.parseLong(data.get("recordTime")) + Long.parseLong(data.get("startTime"))));


//        if (planDAO.insertPlan(planDTO))
//            return "SUCCESS";
//        return "May be Failed";
        return "Work In Progress";
    }
}
