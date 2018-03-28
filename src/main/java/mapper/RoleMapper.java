package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Role;

public interface RoleMapper {
	@Select(value="select * from role_p")
	public List<Role> findAll();
	
	public void saveRole(Role role);
	
	public void saveRoleModule(@Param("moduleId")String moduleId,@Param("roleId")String roleId);
	
	//根据roleId 删除中间表数据
	public void deleteRoleModule(String roleId);
	
	@Select("select module_id from role_module_p where role_id = #{roleId}")
	public List<String> findRoleModuleList(String roleId);
}
