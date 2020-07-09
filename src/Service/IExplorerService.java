package Service;

import java.util.List;
import java.util.Map;

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
     * 모든 미디어 데이터를 반환
     * ID, [Stringify 처리된 이미지, 날짜] 순서의 맵을 반환한다.
     */
    Map<String, List<String>> getAllMedias();

    /**
     * 모든 다이어리 정보를 반환
     *
     * @return ID와 [제목, 날짜, 내용] 순서의 맵을 반환.
     */
    Map<String, List<String>> getAllDiaries();

    /**
     * 모든 메모 정보를 반환
     *
     * @return ID와 [제목, 날짜] 순서의 맵을 반환.
     */
    Map<String, List<String>> getAllNotes();

    /**
     * 모든 작업 정보를 반환
     *
     * @return ID와 [제목, 날짜] 순서의 맵을 반환.
     */
    Map<String, List<String>> getAllTasks();
}
