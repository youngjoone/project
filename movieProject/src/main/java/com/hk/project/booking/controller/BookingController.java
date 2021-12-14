package com.hk.project.booking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.project.booking.service.BookingService;
import com.hk.project.movie.vo.MovieVO;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;
	
	@RequestMapping(value="/service/booking", method={RequestMethod.GET , RequestMethod.POST})
	public String bookingMain(Model model) {
		List<MovieVO> movieVO = bookingService.movieList();
		model.addAttribute("movieVO",movieVO);
		
		System.out.println(movieVO.toString());
		return "booking";
	}
}
