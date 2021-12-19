package com.hk.project.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.project.ticket.service.TicketService;
import com.hk.project.ticket.vo.TicketVO;

@Controller
public class TicketController {
	
	@Autowired
	TicketService ticketService;
	
	
	 @RequestMapping(value="/admin/booking/list", method= RequestMethod.GET) 
	 public String ticketList(Model model) {
	  
	 List<TicketVO> ticketsList = ticketService.listTickets();
	 model.addAttribute("ticketsList", ticketsList);
	  
	 return "adminTicketList"; 
	 }
	 
/*	
	@RequestMapping(value="/admin/booking/list", method=RequestMethod.GET) 
	public String ticketList() {
		return "adminTicketList";
	}
	
	@RequestMapping(value="/admin/booking/list", method=RequestMethod.POST)
	public String data(Model model) {
		model.addAttribute("list", ticketService.calenList());
		
		return "list";
	}
*/	 
/*	
	@RequestMapping("/admin/booking/list")
	public class ticketList {
		@GetMapping(params="method=list")
		public String list() {
			
			return "adminTicketList"; 
		}
				
		@GetMapping(params="method=data")
		public String data(Model model) {
			model.addAttribute("list", ticketService.calenList());
			
			return "list";
		}			 
	}
*/

}
