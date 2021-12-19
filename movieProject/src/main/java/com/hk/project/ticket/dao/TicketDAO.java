package com.hk.project.ticket.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.ticket.vo.TicketVO;

@Repository
public class TicketDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<TicketVO> viewTicket(String id) {
		List<TicketVO> ticketList = sqlSession.selectList("mapper.ticket.myBooking",id);
		return ticketList;
	}

	public int cancleTicket(String ticketNo) {
		int ret = sqlSession.delete("mapper.ticket.cancleTicket", ticketNo);
		return 0;
	}

	
	public List<TicketVO> selectAllTickets() { // TODO Auto-generated method stub
	 
	List<TicketVO> ticketsList = sqlSession.selectList("mapper.ticket.selectAllTickets");
	 
	return ticketsList; 
	
	}
	 
/*
	public List<TicketVO> calenList() {
		
		List<TicketVO> ticketsList = sqlSession.selectList("mapper.ticket.calenList");
		
		return ticketsList;
	}
*/
}
