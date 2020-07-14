package Service;

import DAO.UsersDAO;

public class MembershipService implements IMembershipService {
	@Override
	public boolean isChkUserId(String userId) {
		UsersDAO usersdao = UsersDAO.getInstance();
		if(usersdao.getUsers(userId) && userId != null)	return true;
		return false;
	}
}
