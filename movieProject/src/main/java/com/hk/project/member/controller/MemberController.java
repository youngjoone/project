package com.hk.project.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		// DB결과가 들어있는 null 혹은 사용자 정보 memberVO
		memberVO = memberService.checkUser(memberVO); // select한 VO값
		// VO에 담을꺼니까 타입도 MemberVO

		if (memberVO == null) { // 로그인 정보 틀림
			return "loginFail";
		} else { // 로그인 성공
			// 세션
			session.setAttribute("login", memberVO); // 인터셉터에서 login으로 설정
			return "loginDone";
		}
	}
}
