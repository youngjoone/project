package com.hk.project.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MovieController {

	@RequestMapping(value="/movie/list", method={RequestMethod.GET , RequestMethod.POST})
	public String header() {
		return "movieList";
	}
}
