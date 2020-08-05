package Service;

import DAO.UsersDAO;
import DTO.UsersDTO;

public class MembershipService implements IMembershipService {
	@Override
	public boolean isChkUserId(String userId) {
		UsersDAO usersdao = UsersDAO.getInstance();
		if(usersdao.getUsers(userId) && userId != null)	return true;
		return false;
	}
	@Override
	public void insertDAO(UsersDTO dto) {
		UsersDAO dao = UsersDAO.getInstance();
		if(dao.insertUserInfo(dto));
	}
}
