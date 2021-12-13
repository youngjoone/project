package com.hk.project.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.ticket.dao.TicketDAO;

@Service
public class TicketService {

	@Autowired
	TicketDAO ticketDAO;
}
