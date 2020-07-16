package Service;

import DAO.MediaDAO;
import DAO.RecordsDAO;
import DTO.RecordsDTO;

public class RecordsService implements IRecordsService {
	@Override
	public void setDiaryDAO(RecordsDTO dto) {
		RecordsDAO dao = RecordsDAO.getInstance();
		String RecordNo = settingRecordNo(dao);
		dto.setRecordNo(RecordNo);
		//setMediaDAO(RecordNo, dto.getContent());
		if(!dao.setDiary(dto))	System.out.println("실패");;
	}
	private String settingRecordNo(RecordsDAO dao) {
		String preRecordNo = dao.getDiaryRecordNo();
		int no = 0;
		if(preRecordNo == null) {
			preRecordNo = "D0000";
		}
		
		no = Integer.parseInt(preRecordNo.substring(1, preRecordNo.length()))+1;
		
		String recordNo = preRecordNo.substring(0, 1);
		recordNo += String.format("%04d", no);
		return	recordNo;
	}
	private void setMediaDAO(String recordNo, String content) {
		MediaDAO dao = MediaDAO.getInstance();
		String preContent = content;

		int pos = preContent.indexOf("<img");
		String temp = preContent.substring(pos, preContent.length());
		
		int pos2 = preContent.indexOf(">")+1;
		String temp2 = preContent.substring(0, pos2);
		//if(!dao.insertMedia(recordNo, mediaList))
	}
	@Override
	public void delDiaryDAO(String recordNo, String userId) {
		RecordsDAO dao = RecordsDAO.getInstance();
		if(dao.delRecords(recordNo, userId));
	}
}
