package service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.RoleMapper;
import pojo.Role;
@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> findAll() {
		
		return roleMapper.findAll();
	}

	@Override
	public void saveRole(Role role) {
		
		role.setRoleId(UUID.randomUUID().toString());
		
		roleMapper.saveRole(role);
	}

	@Override
	public void saveRoleModule(String roleId, String[] moduleIds) {
		
		//为了防止数据重复提交先删除 后提交
		roleMapper.deleteRoleModule(roleId);
		//实现关联表数据入库
		for (String moduleId : moduleIds) {
			roleMapper.saveRoleModule(moduleId,roleId);
		}
		
	}

	@Override
	public List<String> findRoleModuleList(String roleId) {
		
		return roleMapper.findRoleModuleList(roleId);
	}

}
