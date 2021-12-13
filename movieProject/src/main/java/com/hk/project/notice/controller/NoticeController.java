package com.hk.project.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		return "adminNoticeList";
	}
	
	@RequestMapping(value="/admin/notice/add", method=RequestMethod.GET)
	public String noticeAdd(Model model) {
		
		return "adminNoticeAdd";
	}
	
	@RequestMapping(value="/admin/notice/add", method=RequestMethod.POST)
	public String noticeAddDone(Model model, @ModelAttribute NoticeVO noticeVO) {
		
		System.out.println("nTitle= " + noticeVO.getnTitle());
		System.out.println(("nContent= " + noticeVO.getnContent()));
		
		int ret = noticeService.addNotice(noticeVO);
		System.out.println("ret : "+ ret);
		model.addAttribute("ret", ret);
		
		return "adminNoticeAddDone";
	}
	
	@RequestMapping(value="/admin/notice/update" , method=RequestMethod.GET)
	public String noticeView(Model model, @RequestParam("noticeNO") int noticeNO) {
		
		NoticeVO noticeVO = noticeService.viewNotice(noticeNO);
		model.addAttribute("noticeVO", noticeVO);
		
		return "adminNoticeView";
	}
	
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.POST)
	public String noticeUpdate(Model model, @ModelAttribute NoticeVO noticeVO) {
		int ret = noticeService.modNotice(noticeVO);
		model.addAttribute("ret", ret);
		
		return "adminNoticeUpdateDone";
	}
	
	@RequestMapping(value="/admin/notice/delete", method= RequestMethod.POST)
	public String noticeDelete(Model model, @RequestParam("noticeNO") int noticeNO) {
		
		int ret = noticeService.removeNotice(noticeNO);
		System.out.println("ret : " + ret);
		model.addAttribute("ret", ret);
		
		return "adminNoticeDelete";
	}
	
	@RequestMapping(value="/muldelete", method=RequestMethod.GET)
	public String noticeMulDelete(@RequestParam("chkbox") List<Integer> noticeNOs) {
		
		System.out.println("noticeNOs : " + noticeNOs.toString());
		
		Map<String,Integer> map = noticeService.multiDelete(noticeNOs);
		System.out.println("성공한 갯수 = " + map.get("succ"));
		System.out.println("실패한 갯수 = " + map.get("fail"));
		
		return "adminMulDelete";
	}
}
