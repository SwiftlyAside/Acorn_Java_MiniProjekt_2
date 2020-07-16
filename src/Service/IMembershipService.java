package Service;

import DTO.UsersDTO;

public interface IMembershipService {
	public boolean isChkUserId(String userId);
	public void insertDAO(UsersDTO dto);
}
