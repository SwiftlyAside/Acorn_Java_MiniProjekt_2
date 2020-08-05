package Service;

import java.sql.SQLException;

import DAO.UsersDAO;

public class LoginService implements ILoginService{
	@Override
	public boolean checkLogin(String userId, String userPass) {
		boolean b = false;
		UsersDAO dao = UsersDAO.getInstance();
		try {
			if(dao.getUserId(userId, userPass)) {
				b = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
}
