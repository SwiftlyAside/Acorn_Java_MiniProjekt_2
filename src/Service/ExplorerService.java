package Service;

import DAO.MediaDAO;
import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.util.List;

public class ExplorerService implements IExplorerService {
    private final MediaDAO mediaDAO;

    public ExplorerService() {
        this.mediaDAO = MediaDAO.getInstance();
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
        return null;
    }
}
