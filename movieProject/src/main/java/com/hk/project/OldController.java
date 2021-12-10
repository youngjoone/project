package com.hk.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//올라가~!
@Controller
public class OldController {

	@RequestMapping(value="/tttt")
	@ResponseBody
	public String tttt() { 
		return "Hello";
	}
}
