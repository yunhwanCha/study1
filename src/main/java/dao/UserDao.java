package dao;

import model.User;

public interface UserDao {
	public String getPassword(String id);//계정으로 암호를 찾는 메서드(로그인 용)
	public String getId(String id);//계정으로 계정을 찾는 메서드(계정 중복 검사용)
	public void create(User user);//사용자 정보 삽입 메서드(가입자 등록용)
}
