package com.hk.project.booking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookingController {

	@RequestMapping(value="/service/booking", method={RequestMethod.GET , RequestMethod.POST})
	public String bookingMain() {
		return "booking";
	}
}
