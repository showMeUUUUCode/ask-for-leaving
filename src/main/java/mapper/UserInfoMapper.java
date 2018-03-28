package mapper;

import java.util.List;

import pojo.UserInfo;

public interface UserInfoMapper {

	UserInfo findUserInfoByuserId(Integer userId);

	List<UserInfo> findAll();

}
