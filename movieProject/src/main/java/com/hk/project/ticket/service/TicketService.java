package com.hk.project.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.join.vo.ListTicketVO;
import com.hk.project.notice.vo.NoticeVO;
import com.hk.project.ticket.dao.TicketDAO;
import com.hk.project.ticket.vo.TicketVO;

@Service
public class TicketService {

	@Autowired(required = false)
	TicketDAO ticketDAO;

	public int cancleTicket(String ticketNo) {
		return ticketDAO.cancleTicket(ticketNo);
	}
	
	public List<ListTicketVO> calenList() { // TODO Auto-generated method stub return
		return ticketDAO.calenList(); 
	}
	 
/*	
	public List<TicketVO> listTickets() { 
		 // TODO Auto-generated method stub
		 return ticketDAO.selectAllTickets(); 
	 }
*/
/*
	public List<HashMap<String, String>> listTicket() {
		// TODO Auto-generated method stub
		List<HashMap<String, String>> ticketList = ticketDAO.listTicket(); 
		return ticketList;
	}	 
*/


	
	
	
}
