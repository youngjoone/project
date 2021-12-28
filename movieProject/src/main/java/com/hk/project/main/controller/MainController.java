package com.hk.project.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.project.main.service.MainService;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.notice.vo.NoticeVO;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	@RequestMapping(value="/movie/main", method={RequestMethod.GET , RequestMethod.POST})
	public String mainPage(Model model) {
		long startTime = System.currentTimeMillis();
		
		List<NoticeVO> noticeVOList = mainService.getNoticeVOList();
		model.addAttribute("noticeVOList", noticeVOList);
		
		long endTime1 = System.currentTimeMillis();
		List<MovieVO> movieVOList = mainService.getMovieVOList();
		model.addAttribute("movieVOList", movieVOList);
		
		long endTime2 = System.currentTimeMillis();
		
		System.out.println("DIFF = " + (endTime2 - startTime));
		System.out.println("DIFF1 = " + (endTime2 - endTime1));
		
		return "main";
	}
	
	@RequestMapping(value="/admin/main", method={RequestMethod.GET , RequestMethod.POST})
	public String adminMainPage(Model model) {
		
		List<NoticeVO> noticeVOList = mainService.getNoticeVOList();
		model.addAttribute("noticeVOList", noticeVOList);
		List<MovieVO> movieVOList = mainService.getMovieVOList();
		model.addAttribute("movieVOList", movieVOList);
		return "adminMain";
	}
}