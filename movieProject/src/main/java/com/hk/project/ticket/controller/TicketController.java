package com.hk.project.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hk.project.join.vo.ListTicketVO;
import com.hk.project.notice.vo.NoticeVO;
import com.hk.project.ticket.service.TicketService;

@Controller
public class TicketController {
	
	@Autowired
	TicketService ticketService;
/*	
	@RequestMapping(value="/admin/booking/list", method= {RequestMethod.GET , RequestMethod.POST})
	public String ticketList(Model model) {
		
		List<ListTicketVO> ticketList = ticketService.listTicket();
		model.addAttribute("ticketList", ticketList);
		
		return "adminTicketList1";
	}
*/	
/*	
	 @RequestMapping(value="/admin/booking/list") 
	 public ModelAndView ticketList(ModelAndView mav) {
	  
	 List<HashMap<String,String>> ticketList = ticketService.listTicket();
	 
	 mav.addObject("ticketList", ticketList);
	 mav.setViewName("adminTicketList1");
	  
	 return mav; 
	 }
*/	 
	
	@RequestMapping(value="/admin/booking/list", method=RequestMethod.GET) 
	public String ticketList() {
		return "adminTicketList1";
	}
	
	@RequestMapping(value="/admin/booking/list", method=RequestMethod.POST)
	public String data(Model model) {
		model.addAttribute("list", ticketService.calenList());
		
		return "list";
	}
	
	@RequestMapping(value="/admin/booking/list/chk", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ajax() {
//		model.addAttribute("list", ticketService.calenList());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ListTicketVO> calenderList = ticketService.calenList();
		map.put("list", calenderList);
		System.out.println("-------list="+calenderList);
		return map;
	}
	 
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
