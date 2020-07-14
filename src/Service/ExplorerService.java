package Service;

import DAO.MediaDAO;
import DAO.PlansDAO;
import DAO.RecordsDAO;
import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.sql.Date;
import java.time.temporal.TemporalAdjuster;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ExplorerService implements IExplorerService {
    private static final ExplorerService instance = new ExplorerService();
    public final String ORDER_RECORD_DATE = "ORDER BY RECORDDATE ";
    public final String ORDER_RECORD_TITLE = "ORDER BY TITLE ";
    public final String ORDER_PLAN_DATE = "ORDER BY STARTDATE ";
    public final String ORDER_PLAN_TITLE = "ORDER BY PLANTITLE ";
    public final String DESC = "DESC ";

    Map<String, TemporalAdjuster> adjusterMap = new HashMap<>();

    private final MediaDAO mediaDAO;
    private final PlansDAO plansDAO;
    private final RecordsDAO recordsDAO;

    private ExplorerService() {
        this.mediaDAO = MediaDAO.getInstance();
        this.plansDAO = PlansDAO.getInstance();
        this.recordsDAO = new RecordsDAO();
    }

    public static ExplorerService getInstance() {
        return instance;
    }

    @Override
    public List<MediaDTO> getAllMedias(String userId, String condition) {
        return mediaDAO.getMedia(userId, condition);
    }

    @Override
    public List<RecordsDTO> getAllDiaries(String userId, String condition) {
        return recordsDAO.getDiary(userId, condition);
    }

    @Override
    public List<RecordsDTO> getAllRecords(String userId, String condition) {
        return recordsDAO.getRecords(userId, condition);
    }

    @Override
    public List<PlansDTO> getAllPlans(String userId, String condition) {
        return plansDAO.selectAllPlans(userId, condition);
    }

    @Override
    public Map<Date, List<MediaDTO>> getGroupedMedias(List<MediaDTO> mediaDTOList) {
        Map<Date, List<MediaDTO>> listMap = new LinkedHashMap<>();

        return null;
    }
}
