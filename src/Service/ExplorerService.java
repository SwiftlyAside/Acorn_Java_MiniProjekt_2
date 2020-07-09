package Service;

import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.util.List;

public class ExplorerService implements IExplorerService {
    private String orderType = "date";
    private String order = "asc";

    @Override
    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    @Override
    public void setOrder(String order) {
        this.order = order;
    }

    @Override
    public List<MediaDTO> getAllMedias(String userId, String condition) {
        return null;
    }

    @Override
    public List<RecordsDTO> getAllDiaries(String userId, String condition) {
        return null;
    }

    @Override
    public List<RecordsDTO> getAllRecords(String userId, String condition) {
        return null;
    }

    @Override
    public List<PlansDTO> getAllPlans(String userId, String condition) {
        return null;
    }
}
