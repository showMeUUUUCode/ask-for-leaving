package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import pojo.Module;
import pojo.Role;
import service.ModuleService;
import service.RoleService;

@Controller
@RequestMapping("/aboutUser/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private ModuleService moduleService;
	
	@RequestMapping("/list")
	public String findRole(Model model){
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		
		//跳转到角色列表页面
		return "/aboutUser/role/jRoleList";
	}
	
	
	
	
	//角色保存
	@RequestMapping("/save")
	public String saveRole(Role role){
		
		roleService.saveRole(role);
		
		//跳转到列表页面
		return "redirect:/aboutUser/role/list";
	}
	
	
	//分配模块信息
	@RequestMapping("/toModule")
	public String toModule(String roleId,Model model) throws JsonProcessingException{

		
		//1.准备全部的模块列表信息
		List<Module> moduleList = moduleService.findAll();
		
		//角色已准备经拥有的模块信息
		List<String> rModuleList = roleService.findRoleModuleList(roleId);
		
		//实现zTree数据回显
		for (Module module : moduleList) {
			if(rModuleList.contains(module.getModuleId())){
				module.setChecked(true);
			}
		}
		
		//2.将对象转化为JSON串
		ObjectMapper objectMapper = new ObjectMapper();
		String zTreeJSON = objectMapper.writeValueAsString(moduleList);
		
		//3.将数据封装到request域中 进行页面展现
		model.addAttribute("zTreeJSON", zTreeJSON);
		
		//4.将roleId进行转向处理
		model.addAttribute("roleId", roleId);
		//跳转角色和模块的分配页面
		return "/aboutUser/role/jRoleModule";
		
	}
	@RequestMapping("/saveRoleModule")
	public String saveRoleModule(String roleId,String[] moduleIds){
		
		roleService.saveRoleModule(roleId,moduleIds);
		
		//页面跳转到角色列表页面
		return "redirect:/aboutUser/role/list";
	}
}
