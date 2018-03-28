package controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.User;
import pojo.UserInfo;
import service.UserService;
import tools.ThreadLocalTools;

@Controller
public class LoginController {
	@Autowired
	private UserService us;
	@RequestMapping("/toLogin")
	public String toLogin(){
		
		//应该跳转到用户的登陆页面
		return "/login";
	}
	
	
	@RequestMapping("/login")
	public String Login(String username,String password,Model model,HttpSession session){
		
		//判断用户名和密码是否为空
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
			//表示用户名和密码为空
			model.addAttribute("errorInfo", "用户名或密码不能为空");
			
			//跳转到用户登陆页面
			return "/login";
		}
		
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		
		//如果用户登陆不正确  则shiro会报错，如果用户名和密码正确 则执行下一行代码，如果登陆正确，
		//shiro则会放行当前subject的全部请求
		try {
			subject.login(token);   
			
			//获取用户真实信息
			User user = (User) subject.getPrincipal();
			UserInfo ui=us.findUserInfoByuserId(user.getUserId());
			//将用户信息存入session域
			session.setAttribute("userSession", user);
			session.setAttribute("userInfoSession", ui);
			ThreadLocalTools.set(ui);
			//subject.getSession().setAttribute("userSession", user);   subject获取session
			return "redirect:/home.action";	
		} catch (AuthenticationException e) {
			//表示用户名和密码不正确
			model.addAttribute("errorInfo", "用户名或密码不正确");
			return "/login";
		}
		
	}

	
	@RequestMapping("/logout")
	public String loginOut(HttpSession httpSession){
		
		//将user对象从session域中删除
		httpSession.removeAttribute("userSession");
		httpSession.removeAttribute("userInfoSession");
		ThreadLocalTools.remove();;
		//页面应该跳转到登陆页面
		return "/login";
	}
	
	
	
	
}
