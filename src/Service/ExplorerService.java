package Service;

import DAO.MediaDAO;
import DAO.PlansDAO;
import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.util.List;

public class ExplorerService implements IExplorerService {
    private final MediaDAO mediaDAO;
    private final PlansDAO plansDAO;

    public ExplorerService() {
        this.mediaDAO = MediaDAO.getInstance();
        this.plansDAO = PlansDAO.getInstance();
    }

    @Override
    public List<MediaDTO> getAllMedias(String userId, String condition) {
        return mediaDAO.getMedia(userId, condition);
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
        return plansDAO.selectAllPlans(userId, condition);
    }
}
