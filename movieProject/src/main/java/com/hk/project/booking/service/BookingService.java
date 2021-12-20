package com.hk.project.booking.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.join.dao.BookingDAO;
import com.hk.project.join.dao.BookingDateDAO;
import com.hk.project.join.vo.BookingDateVO;
import com.hk.project.movie.dao.MovieDAO;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.ticket.dao.TicketDAO;

@Service
public class BookingService {

	
	
	@Autowired
	MovieDAO movieDAO;
	@Autowired
	BookingDAO bookingDAO;
	@Autowired
	BookingDateDAO bookingDateDAO;
	@Autowired
	TicketDAO ticketDAO;
	
	public List<MovieVO> bookingMovieList(){
		
		return movieDAO.bookingMovieList();
	}

	public List<BookingDateVO> getMMDD(String mid) {
		// TODO Auto-generated method stub
		return bookingDateDAO.getMMDD(mid);
	}

	public List<BookingDateVO> getHHMM(HashMap<String,Object> MMDDmap) {
		// TODO Auto-generated method stub
		
		return bookingDateDAO.getHHMM(MMDDmap);
	}
		
	//관리자 상영정보입력
	public List<MovieVO> selectMovieList() {
		return movieDAO.movieList();
	}
	
	public int selectScreenDateNo() {
		return bookingDateDAO.selectScreenDateNo();
	}

	public List<BookingDateVO> getSeat(BookingDateVO bookingDateVO) {
		// TODO Auto-generated method stub
		return bookingDateDAO.getSeat(bookingDateVO);
	}

	public int insertTicket(BookingDateVO bookingDateVO) {
		String[] seat = bookingDateVO.getSeat().split(",");
		String[] age = bookingDateVO.getAge().split(",");
				
		int count = 0;
		for(int i =0; i < seat.length; i++) {
			bookingDateVO.setSeat(seat[i]);
			bookingDateVO.setAge(age[i]);
			System.out.println(bookingDateVO.toString());
			
			count += ticketDAO.insertTicket(bookingDateVO);
		}
		
		if (count != seat.length) {
			System.out.println("뭔가 큰 사고가 났습니다?");
		}
		
				
		return count;
	}
}
