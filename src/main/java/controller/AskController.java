package controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.LeaveBill;
import pojo.UserInfo;
import service.AskService;

@Controller
@RequestMapping("/ask")
public class AskController extends BaseController {
	@Autowired
	private AskService askService;

	@RequestMapping("/want")
	public String want() {
		return "/ask-leave/jWant";
	}

	@RequestMapping("/submit")
	public String submit(LeaveBill leavebill) {
		int level = -1;
		leavebill.setLeavebillId(UUID.randomUUID().toString());
		if (leavebill.getDays() < 1) {
			level = 1;
		} else if (leavebill.getDays() < 3) {
			level = 2;
		} else if (leavebill.getDays() < 5){
			level = 3;
		} else {
			level = 4;
		}
		leavebill.setLevel(level);
		leavebill.setState(2);
		leavebill.setUserinfo(new UserInfo());
		leavebill.getUserInfo().setUserInfoId(2014082205);
		askService.submitAsk(leavebill);

		return "redirect:/ask/now";
	}

	@RequestMapping("/now")
	public String now(HttpSession session, Model model) {
		UserInfo user=(UserInfo) session.getAttribute("userInfoSession");
		int userId = user.getUserInfoId();
		LeaveBill[] lbs = askService.findNow(userId);
		model.addAttribute("lbs", lbs);
		return "/ask-leave/jNow";
	}

	@RequestMapping("/upload")
	public String upload(String leavebillId) {
		return "/ask-leave/jUpload";
	}

	//toview
	@RequestMapping("/toview")
	public String toview(String leavebillId,Model model) {
		
		LeaveBill lb=askService.findByLeaveBillId(leavebillId);
		model.addAttribute("lb", lb);
		return "/ask-leave/jView";
	}
	@RequestMapping("/history")
	public String history(HttpSession session, Model model) {
		UserInfo user=(UserInfo) session.getAttribute("userInfoSession");
		int userId = user.getUserInfoId();
		LeaveBill[] lbs = askService.findList(userId);
		model.addAttribute("lbs", lbs);
		return "/ask-leave/jList";
	}
	
	@RequestMapping("/delete")
	public String delete(String leavebillId){
		askService.deleteByLeaveBillId(leavebillId);
		return "redirect:/ask/now";
	}
}
