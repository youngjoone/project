package com.hk.project.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.notice.dao.NoticeDAO;
import com.hk.project.notice.vo.NoticeVO;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	public List<NoticeVO> listNotices() {
		// TODO Auto-generated method stub
		return noticeDAO.selectAllNotices();
	}

}
