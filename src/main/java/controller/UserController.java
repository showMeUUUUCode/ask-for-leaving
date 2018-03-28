package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import service.RoleService;
import pojo.Role;
import pojo.UserInfo;
import service.UserService;

@Controller
@RequestMapping("/aboutUser")
public class UserController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/list")
	public String findAllUser(Model model){
		List<UserInfo> userList=userService.findAll();
		model.addAttribute("userList", userList);
		return "/aboutUser/jUserList";	
	}
	@RequestMapping("/toRole")
	public String toRole(String userId,Model model) throws JsonProcessingException{
		//1.准备全部角色信息
		List<Role> roleList = roleService.findAll();
		//2.根据userId查询用户已经拥有的角色信息
		List<String> uRoleList = userService.finduRoleList(userId);
		
		for (Role role : roleList) {
			if(uRoleList.contains(role.getRoleId())){
				//证明用户已经拥有该角色信息  需要将checked属性设置为true
				role.setChecked(true);
			}
		}
		
		//由于页面中的zTree需要JSON串数据  所以需要将roleList 转化为JSON
		ObjectMapper objectMapper = new ObjectMapper();
		//通过objectMapper获取数据时，必须添加getXX（）否则不能获取数据
		String zTreeJSON = objectMapper.writeValueAsString(roleList);
		
		//为了实现新增操作 需要传递userId
		model.addAttribute("userId", userId);
		model.addAttribute("zTreeJSON", zTreeJSON);
		return "/aboutUser/jUserRole";
	}
	
	
	@RequestMapping("/saveUserRole")
	public String saveUserRole(String userId,String[] roleIds){
		
		//新增用户和角色信息
		userService.saveUserRole(userId,roleIds);
		
		return "redirect:/aboutUser/list";
	}
	
}
