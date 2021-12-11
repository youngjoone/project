package com.hk.project.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.notice.dao.NoticeDAO;
import com.hk.project.notice.vo.NoticeVO;



@Service
public class MainService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	public List<NoticeVO> getNoticeVOList() {
		return noticeDAO.selectAllNotices();
	}
}
