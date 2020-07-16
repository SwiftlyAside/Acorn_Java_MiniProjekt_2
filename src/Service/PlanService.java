package Service;

import DAO.PlansDAO;
import DTO.PlansDTO;

import java.sql.Date;
import java.util.Map;
import java.util.Random;

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
        planDTO.setStartDate(new Date(Long.parseLong(data.get("startDate"))));
        planDTO.setEndDate(new Date(Long.parseLong(data.get("endDate"))));

        if (planDAO.insertPlan(planDTO))
            return "SUCCESS";
        return "May be Failed";
    }
}
