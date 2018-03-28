package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.UserInfoMapper;
import mapper.UserMapper;
import pojo.User;
import pojo.UserInfo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public List<UserInfo> findAll() {
		return userInfoMapper.findAll();
	}
	@Override
	public void saveUserRole(String userId, String[] roleIds) {
		
		//为了防止重复提交先删除
		userMapper.deleteRoleUsers(userId);
		
		//用户和角色的新增 
		for (String roleId : roleIds) {
			userMapper.saveUserRole(userId,roleId);
		}
		
	}

	@Override
	public List<String> finduRoleList(String userId) {
		
		return userMapper.finduRoleList(userId);
	}
	@Override
	public User findUserByUserName(String username) {
		return userMapper.findUserByUserName(username);
	}

	@Override
	public List<String> findPrililegeInfoList(Integer userId) {
		
		return userMapper.findPrililegeInfoList(userId);
	}
	@Override
	public UserInfo findUserInfoByuserId(Integer userId) {
		return userInfoMapper.findUserInfoByuserId(userId);
	}
}
