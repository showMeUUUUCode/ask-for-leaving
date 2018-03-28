package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.LeaveBill;
import pojo.UserInfo;
import service.ApproveService;

@Controller
@RequestMapping("/approve")
public class ApproveController extends BaseController{
	@Autowired
	private ApproveService approveService;
	@RequestMapping("/approveList")
	public String approveList(HttpSession session,Model model){
		UserInfo user=(UserInfo) session.getAttribute("userInfoSession");
		int userLevel = user.getUserLevel();
		List<LeaveBill> list=approveService.findapproveListByeLevel(userLevel);
		model.addAttribute("list", list);
		return "/approve/jList";
	}
	
	///reloadList
	@RequestMapping("/reloadList")
	public String reloadList(HttpSession session,Model model){
		UserInfo user=(UserInfo) session.getAttribute("userInfoSession");
		int userLevel = user.getUserLevel();
		List<LeaveBill> list=approveService.findreloadListByeLevel(userLevel);
		model.addAttribute("list", list);
		return "/approve/jList";
	}
	
	@RequestMapping("/historyList")
	public String historyList(HttpSession session,Model model){
		UserInfo user=(UserInfo) session.getAttribute("userInfoSession");
		int userLevel = user.getUserLevel();
		List<LeaveBill> list=approveService.findhistoryListByeLevel(userLevel);
		model.addAttribute("list", list);
		return "/approve/jList";
	}
	
	@RequestMapping("/agree")
	public String agree(@RequestParam("leavebillId")String[] leavebillIds){
		int temp=1;
		approveService.changeState(leavebillIds,temp);
		return "redirect:/approve/approveList";
	}
	
	@RequestMapping("/disagree")
	public String disagree(@RequestParam("leavebillId")String[] leavebillIds){
		int temp=-1;
		approveService.changeState(leavebillIds,temp);
		return "redirect:/approve/approveList";
	}
	///view
	@RequestMapping("/view")
	public String view(String leavebillId,Model model){
		LeaveBill lb=approveService.viewByLeaveBillId(leavebillId);
		model.addAttribute("lb",lb);
		return "/approve/jView";
	}
}
