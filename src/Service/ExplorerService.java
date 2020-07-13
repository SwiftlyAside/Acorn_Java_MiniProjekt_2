package Service;

import DAO.MediaDAO;
import DAO.PlansDAO;
import DAO.RecordsDAO;
import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.util.List;

public class ExplorerService implements IExplorerService {
    private final MediaDAO mediaDAO;
    private final PlansDAO plansDAO;
    private final RecordsDAO recordsDAO;

    private static final ExplorerService instance = new ExplorerService();

    public static ExplorerService getInstance() {
        return instance;
    }

    private ExplorerService() {
        this.mediaDAO = MediaDAO.getInstance();
        this.plansDAO = PlansDAO.getInstance();
        this.recordsDAO = new RecordsDAO();
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
}
