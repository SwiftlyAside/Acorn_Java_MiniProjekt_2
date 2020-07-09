package Service;

import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.util.List;

public interface IExplorerService {

    /**
     * 모든 미디어 데이터를 반환<br>
     * MediaDTO로 구성된 리스트를 반환한다.
     *
     * @param userId    유저의 ID
     * @param condition 조건
     */
    List<MediaDTO> getAllMedias(String userId, String condition);

    /**
     * 모든 다이어리 정보를 반환
     *
     * @param userId    유저의 ID
     * @param condition 조건
     * @return 다이어리 정보만 포함된 RecordsDTO로 구성된 리스트를 반환.
     */
    List<RecordsDTO> getAllDiaries(String userId, String condition);

    /**
     * 모든 메모 정보를 반환
     *
     * @param userId    유저의 ID
     * @param condition 조건
     * @return 메모 정보만 포함된 RecordsDTO로 구성된 리스트를 반환.
     */
    List<RecordsDTO> getAllRecords(String userId, String condition);

    /**
     * 모든 작업 정보를 반환
     *
     * @param userId    유저의 ID
     * @param condition 조건
     * @return PlansDTO로 구성된 리스트를 반환.
     */
    List<PlansDTO> getAllPlans(String userId, String condition);
}
