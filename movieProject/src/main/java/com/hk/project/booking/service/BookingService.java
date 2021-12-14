package com.hk.project.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.movie.dao.MovieDAO;
import com.hk.project.movie.vo.MovieVO;

@Service
public class BookingService {

	@Autowired
	MovieDAO movieDAO;
	
	public List<MovieVO> movieList(){
		
		return movieDAO.allMovies();
	}
}
