package com.hk.project.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int addNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDAO.addNotice(noticeVO);
	}

	public NoticeVO viewNotice(int noticeNO) {
		// TODO Auto-generated method stub
		return noticeDAO.selectNotice(noticeNO);
	}

	public int modNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDAO.updateNotice(noticeVO);
	}

	public int removeNotice(int noticeNO) {
		// TODO Auto-generated method stub
		return noticeDAO.deleteNotice(noticeNO);
	}

	public Map<String, Integer> multiDelete(List<Integer> noticeNOs) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap<String,Integer>();
		int succ = 0;
		int fail = 0;
		for(int i=0; i<noticeNOs.size(); i++) {
			int noticeNO = noticeNOs.get(i);
			int ret = noticeDAO.deleteNotice(noticeNO);
			
			System.out.println("ret = " + ret);
			if(ret != 0) {
				//성공이면
				++succ;
			} else {
				//실패이면
				++fail;
			}
		}
		//성공갯수,실패갯수
		map.put("succ", succ);
		map.put("fail", fail);
		
		return map;
	}

}
