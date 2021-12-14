package com.hk.project.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.join.dao.BookingDAO;
import com.hk.project.join.vo.BookingVO;
import com.hk.project.member.dao.MemberDAO;
import com.hk.project.member.vo.MemberVO;
import com.hk.project.movie.dao.MovieDAO;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.review.dao.ReviewDAO;
import com.hk.project.review.vo.ReviewVO;
import com.hk.project.ticket.dao.TicketDAO;
import com.hk.project.ticket.vo.TicketVO;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO;
	MovieDAO movieDAO;
	TicketDAO ticketDAO;
	ReviewDAO reviewDAO;
	BookingDAO bookingDAO ;

	public MemberVO checkUser(MemberVO memberVO) {
		return memberDAO.isExisted(memberVO);
	}
	
	public String duplicateCheck(String id) {
		return memberDAO.duplicateCheckID(id);
	}

	public int joinUser(MemberVO memberVO) {
		return memberDAO.insertUser(memberVO);
	}

	public Map<String, Object> viewMyPage(String id) {
		//회원정보랑 영화정보 같이 리턴
		//key : memberVO / movieVO
		//value : vo값
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO memberVO = memberDAO.viewMyPage(id);
		map.put("memberVO", memberVO);
		
		//id를 파라메터로 티켓정보 가져오는 메소드
		//list형식
		List<TicketVO> ticketList = ticketDAO.viewTicket(id); 
		map.put("ticketList", ticketList);
		
		//ticketNo를 파라메터로 리뷰정보 가져오는 메소드
//		ReviewVO review = reviewDAO.selectReview(id); 
//		map.put("review", review);
		
		//ticketNo를 파라메터로 예매정보 가져오는 메소드
		//1개
		BookingVO bookingVO = bookingDAO.bookingInfo(id);
		map.put("bookingVO", bookingVO);
		
		return map;
	}

	public MemberVO infoView(String id) {
		return memberDAO.infoView(id);
	}
	
	public int infoUpdate(MemberVO memberVO) {
		return memberDAO.infoUpdate(memberVO);
	}

	
	
}
