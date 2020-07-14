package Service;

import DAO.MediaDAO;
import DAO.PlansDAO;
import DAO.RecordsDAO;
import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjuster;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ExplorerService implements IExplorerService {
    private static final ExplorerService instance = new ExplorerService();
    public static final String ORDER_RECORD_DATE = "ORDER BY RECORDDATE ";
    public static final String ORDER_RECORD_TITLE = "ORDER BY TITLE ";
    public static final String ORDER_PLAN_DATE = "ORDER BY STARTDATE ";
    public static final String ORDER_PLAN_TITLE = "ORDER BY PLANTITLE ";

    static final Map<String, TemporalAdjuster> adjusterMap = new HashMap<>();

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
    public Map<LocalDate, List<MediaDTO>> getGroupedMedias(List<MediaDTO> mediaDTOList, String group) {
//        Map<Date, List<MediaDTO>> listMap = new LinkedHashMap<>();
        return mediaDTOList.stream().collect(Collectors.groupingBy(mediaDTO -> mediaDTO.getDate().toLocalDate().withMonth(1).withDayOfMonth(1)));
    }
}
