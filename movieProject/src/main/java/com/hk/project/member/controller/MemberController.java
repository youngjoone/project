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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.project.join.vo.BookingVO;
import com.hk.project.member.service.MemberService;
import com.hk.project.member.vo.MemberVO;
import com.hk.project.movie.service.MovieService;
import com.hk.project.movie.vo.MovieVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	MovieService movieService;
	
	@RequestMapping(value="/movie/login", method=RequestMethod.GET)
	public String login() {
		//login form 
		return "login";
	}
	
	@RequestMapping(value="/movie/login", method=RequestMethod.POST)
	public String loginDone(Model model, @ModelAttribute MemberVO memberVO, HttpSession session,RedirectAttributes redirectAttributes) {

		// DB결과가 들어있는 null 혹은 사용자 정보 memberVO
		memberVO = memberService.checkUser(memberVO); // select한 VO값
		
		if (memberVO == null) { //로그인 정보 없음
			return "loginFail";
		} else { //로그인 정보 있음
			session.setAttribute("login", memberVO);
			//원래가려던 페이지 정보
			if(memberVO.getVerify()==99) { //관리자일때
				return "redirect:/admin/main"; // /admin/main으로 가도록
			} else { //일반유저일때
				return "loginDone";
			}
		}
	}
	
	@RequestMapping(value="/movie/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		//기존에 세션이 있으면 로그아웃
				//세션
		String name="";
		if(session.getAttribute("login") != null && session != null) {
			MemberVO memberVO = (MemberVO) session.getAttribute("login");
			name = memberVO.getName();
		} else {
			System.out.println("세션 없음");
		}
		System.out.println("name="+name);
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
	
	@RequestMapping(value="/service/mypage", method=RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		
		// 회원정보
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); // memberVO
		String id = memberVO.getId();
		
//		memberVO = memberService.viewMyPage(id);
//		model.addAttribute("memberVO", memberVO);
//		
//		//예매정보
//		//id값을 movie테이블로
//		MovieVO movieVO = memberService.viewMyPage(id);
//		model.addAttribute("movieVO", movieVO);
		
		Map<String, Object> map = memberService.viewMyPage(id);
		System.out.println("map="+map);
		model.addAttribute("memberVO", map.get("memberVO"));
		model.addAttribute("ticketList", map.get("ticketList"));
		model.addAttribute("bookingVO", map.get("bookingVO"));
		
		return "mypage";
	}
	
//	@RequestMapping(value = "/service/mypage/sendTno", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json; charset=utf8")
//	@ResponseBody
//	public Map<String, Object> sendTno(@RequestParam("ticketNo") String ticketNo) {
//		System.out.println("ticketNo = " + ticketNo);
//	    
//		//json에서 K-V 형태로 데이터를 처리하기 때문에 Map 형식으로 리턴
//		Map<String, Object> map = new HashMap<String, Object>();
//		// service에서 아이디가 중복인지 체크하는 모듈 ( service, dao, member.xml...)
//		String sendTno = bookingDAO.
//		// dupId : 'lee'(중복O) or 'null'(중복X)
//		// 중복이면 true, 아니면 false라는 String반환
//		if (dupId == null) { // 중복X
//			map.put("id", "false");
//		} else { // 중복O
//			map.put("id", "true");
//		}
//		return map; // jsp를 찾는게 아니라 그냥 데이터만 client(ajax)로 리턴
//	}
	
	@RequestMapping(value="/service/mypage/review", method=RequestMethod.POST)
	public String mypageReview(Model model, HttpSession session) {
		//
		
		
		return "redirect:../mypage";
	}
	
	@RequestMapping(value="/service/mypage/update", method=RequestMethod.GET)
	public String infoView(Model model, HttpSession session) {
	
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String id = memberVO.getId();
		memberVO = memberService.infoView(id);
		model.addAttribute("memberVO", memberVO);
		
		return "infoView";
	}
	
	@RequestMapping(value="/service/mypage/update", method=RequestMethod.POST)
	public String infoUpdate(Model model, @ModelAttribute MemberVO memberVO) {
	
		memberService.infoUpdate(memberVO);
		return "redirect:../mypage";
	}	
	
	/////////////
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String movieInfo(Model model, @RequestParam("mid") String mid, HttpSession session) {
		
		session.setAttribute("mid", mid);
		
		return "mypage";
	}
	
	
}
