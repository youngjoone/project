package com.hk.project.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.project.member.service.MemberService;
import com.hk.project.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/movie/login", method=RequestMethod.GET)
	public String login() {
		//login form 
		return "login";
	}
	
	@RequestMapping(value="/movie/login", method=RequestMethod.POST)
	public String loginDone(Model model, @ModelAttribute MemberVO memberVO, HttpSession session) {

		System.out.println(memberVO.toString());
		
		// DB결과가 들어있는 null 혹은 사용자 정보 memberVO
		memberVO = memberService.checkUser(memberVO); // select한 VO값
		
		if (memberVO == null) {
			return "loginFail";
		} else {
			model.addAttribute("name", memberVO.getName());
			return "loginDone";
		}
	}
	
	@RequestMapping(value="/movie/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		//기존에 세션이 있으면 로그아웃
				//세션
		String name="";
		MemberVO memberVO = null;
		if(session.getAttribute("login") != null && session != null) {
			memberVO = (MemberVO) session.getAttribute("login");
			name = memberVO.getName();
		}
		model.addAttribute("name", name); 
		session.invalidate(); //세션 없애기
		return "logout";
	}
	
	@RequestMapping(value = "/movie/dupId", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> dupId(@RequestParam("id") String id) {
		System.out.println("id = " + id);
		Map<String, Object> map = new HashMap<String, Object>();
		String dupId = memberService.duplicateCheck(id);
		if (dupId == null) { // 중복X
			map.put("id", "false");
		} else { // 중복O
			map.put("id", "true");
		}
		return map; 
	}
	
	@RequestMapping(value="/movie/join", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value="/movie/join", method=RequestMethod.POST)
	public String joinDone(Model model, @ModelAttribute MemberVO memberVO) {
		
		
		System.out.println("join="+memberVO.toString());
		
		int ret = memberService.joinUser(memberVO); 
		model.addAttribute("ret", ret);
		model.addAttribute("name", memberVO.getName());
		return "joinDone";
	}
}
