package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;

@Repository
public class UserDaoImpl implements UserDao {
	private static final String MAPPER = "mapper.myMapper";
	@Autowired
	private SqlSession session;
	
	public void create(User user) {
		this.session.insert(this.MAPPER+".register",user);
	}
	public String getId(String id) {
		return this.session.selectOne(this.MAPPER+".getId", id);
	}
	public String getPassword(String id) {
		String pwd = session.selectOne(this.MAPPER+".getPwd",id);
		return pwd;
	}

}




