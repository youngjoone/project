package com.hk.project.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.project.movie.service.MovieService;
import com.hk.project.movie.vo.MovieVO;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;

	@RequestMapping(value="/movie/list", method={RequestMethod.GET , RequestMethod.POST})
	public String movieList(Model model) {
		
		List<List<MovieVO>> movieVO2DList =  movieService.selectAllMovies();
		model.addAttribute("movieVO2DList", movieVO2DList);
		
		return "movieList";
	}
}
