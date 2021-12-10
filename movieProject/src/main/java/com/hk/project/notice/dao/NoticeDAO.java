package com.hk.project.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.notice.vo.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<NoticeVO> selectAllNotices() {
		// TODO Auto-generated method stub
		
		List<NoticeVO> noticesList = sqlSession.selectList("mapper.notice.selectAllNotices");
		
		return noticesList;
	}

}
