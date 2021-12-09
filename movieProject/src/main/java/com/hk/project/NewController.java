package com.hk.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NewController {
	
	@RequestMapping(value="/member/list")
	@ResponseBody 
	public String list() { 
		return "Hello";
	}

}
