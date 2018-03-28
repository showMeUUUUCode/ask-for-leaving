package service;

import java.util.List;
import pojo.User;
import pojo.UserInfo;

public interface UserService {

	List<UserInfo> findAll();

	public void saveUserRole(String userId, String[] roleIds);

	public List<String> finduRoleList(String userId);

	List<String> findPrililegeInfoList(Integer userId);

	User findUserByUserName(String username);

	UserInfo findUserInfoByuserId(Integer userId);
}
