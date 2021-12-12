package com.hk.project.movie.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.project.movie.service.MovieService;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.review.service.ReviewService;
import com.hk.project.review.vo.ReviewVO;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;
	@Autowired
	ReviewService reviewService;
	
	
	@RequestMapping(value="/movie/list", method={RequestMethod.GET , RequestMethod.POST})
	public String movieList(Model model) {
		
		List<List<MovieVO>> movieVO2DList =  movieService.selectAllMovies();
		model.addAttribute("movieVO2DList", movieVO2DList);
		
		return "movieList";
	}
	@RequestMapping(value="/movie/detail", method={RequestMethod.GET , RequestMethod.POST})
	public String movieDetail(Model model,@RequestParam("MID") String mid,@ModelAttribute MovieVO movieVO) {
		System.out.println(mid);
		
		Map<String,Object> map = movieService.detail(mid);
		model.addAttribute("movieVO", map.get("movieVO"));
		model.addAttribute("reviewVO", map.get("reviewVO"));
		System.out.println(map.toString());
		
		
		return "movieDetail";
	}
	
	@RequestMapping(value="/admin/list", method={RequestMethod.GET , RequestMethod.POST})
	public String adminMovieList(Model model) {
		
		List<List<MovieVO>> movieVO2DList =  movieService.selectAllMovies();
		model.addAttribute("movieVO2DList", movieVO2DList);
		
		return "adminMovieList";
	}
	@RequestMapping(value="/admin/movie/add", method={RequestMethod.GET})
	public String adminMovieAdd(Model model) {
		
		
		return "adminMovieAdd";
	}
	
	@RequestMapping(value="/admin/movie/add", method={RequestMethod.POST})
	public String adminMovieAddDone(Model model,@ModelAttribute MovieVO movieVO) {
		int ret = movieService.addMovie(movieVO);
		model.addAttribute("ret", ret);
		
		return "adminMovieAddDone";
	}
	@RequestMapping(value="/admin/detail", method={RequestMethod.GET , RequestMethod.POST})
	public String adminMovieDetail(Model model,@RequestParam("MID") String mid,@ModelAttribute MovieVO movieVO) {
		System.out.println(mid);
		
		Map<String,Object> map = movieService.detail(mid);
		model.addAttribute("movieVO", map.get("movieVO"));
		model.addAttribute("reviewVO", map.get("reviewVO"));
		System.out.println(map.toString());
		
		
		return "adminMovieDetail";
	}
}
