package com.hk.project.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.project.notice.service.NoticeService;
import com.hk.project.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value="/admin/notice/list", method= {RequestMethod.GET , RequestMethod.POST})
	public String noticeList(Model model) {
		
		List<NoticeVO> noticesList = noticeService.listNotices();
		model.addAttribute("noticesList", noticesList);
		
		return "noticeList";
	}
}
