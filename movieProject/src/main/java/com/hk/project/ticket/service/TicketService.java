package com.hk.project.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.ticket.dao.TicketDAO;
import com.hk.project.ticket.vo.TicketVO;

@Service
public class TicketService {

	@Autowired
	TicketDAO ticketDAO;

	public int cancleTicket(String ticketNo) {
		return ticketDAO.cancleTicket(ticketNo);
	}

	public List<TicketVO> listTickets() {
		// TODO Auto-generated method stub
		return ticketDAO.selectAllTickets();
	}

}
