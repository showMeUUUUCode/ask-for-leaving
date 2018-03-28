package mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import pojo.User;
import pojo.UserInfo;

public interface UserMapper extends SysMapper<UserInfo>{
	//用户和角色的新增  建议使用映射文件的方式 进行插入
		@Insert("insert into role_user_p(role_id,user_id) values(#{roleId},#{userId})")
		public void saveUserRole(@Param("userId")String userId, @Param("roleId")String roleId);
		
		//根据userId删除中间表数据
		public void deleteRoleUsers(String userId);
		
		//根据userId查询用户已经拥有的角色信息
		public List<String> finduRoleList(String userId);

		public User findUserByUserName(String username);

		public List<String> findPrililegeInfoList(Integer userId);
}
