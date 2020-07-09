package Service;

import DTO.MediaDTO;
import DTO.PlansDTO;
import DTO.RecordsDTO;

import java.util.List;

public interface IExplorerService {
    /**
     * 입력받은 정렬유형을 저장 (날짜, 이름)
     */
    void setOrderType(String orderType);

    /**
     * 입력받은 정렬방식을 저장 (오름차순, 내림차순)
     */
    void setOrder(String order);

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
