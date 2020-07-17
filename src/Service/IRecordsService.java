package Service;

import DTO.RecordsDTO;

public interface IRecordsService {
	public void setDiaryDAO(RecordsDTO dto);
	public void setMemeDAO(RecordsDTO dto);
	public void delDiaryDAO(String recordNo, String userId);
	
}
