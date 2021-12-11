package com.hk.project.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.project.main.service.MainService;
import com.hk.project.notice.vo.NoticeVO;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	@RequestMapping(value="/movie/main", method={RequestMethod.GET , RequestMethod.POST})
	public String mainPage(Model model) {
		List<NoticeVO> noticeVOList = mainService.getNoticeVOList();
		model.addAttribute("noticeVOList", noticeVOList);
		return "main";
	}
	
}
