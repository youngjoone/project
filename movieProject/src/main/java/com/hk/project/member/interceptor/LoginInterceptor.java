package com.hk.project.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hk.project.member.vo.MemberVO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);//없으면 null 출력
		if(session == null) {
			response.sendRedirect("/movie/login");
			return false; //정상이 아니니까 가던길 가지마세요
		}
		
		//세션에 login이라는 attribute를 vo에 넣고 있는지 확인
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		                               //login.post에서 setAttribute한 값
		
		if (memberVO == null) {
			response.sendRedirect("/movie/login");
			return false; //정상이 아니니까 가던길 가지마세요 
		}
		
		return true;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
