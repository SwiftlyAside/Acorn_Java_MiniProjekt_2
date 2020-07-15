package Service;

import DAO.PlansDAO;
import DTO.PlansDTO;
import org.json.JSONObject;

public class PlanService implements IPlanService {
    private PlansDTO plansDTO;
    private final PlansDAO plansDAO = PlansDAO.getInstance();

    public PlanService () {
        this.plansDTO = new PlansDTO();
    }

    @Override
    public String storePlan(String jsonData) {
        JSONObject receivedJson = null;
//        receivedJson.
//        try {
//            receivedJson = jsonData.to
//        }
        System.out.println(jsonData);
        return null;
    }
}
