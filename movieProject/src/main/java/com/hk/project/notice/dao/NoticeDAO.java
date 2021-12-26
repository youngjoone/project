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

	public int addNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		int ret = sqlSession.insert("mapper.notice.insertNotice", noticeVO);
		return ret;
	}

	public NoticeVO selectNotice(int noticeNO) {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = sqlSession.selectOne("mapper.notice.selectOneNotice", noticeNO);
		return noticeVO;
	}

	public int updateNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		int ret = sqlSession.update("mapper.notice.updateNotice", noticeVO);
		return ret;
	}

	public int deleteNotice(int noticeNO) {
		// TODO Auto-generated method stub
		int ret = sqlSession.delete("mapper.notice.deleteNotice", noticeNO);
		return ret;
	}

	public void viewCount(int noticeNO) {
		// TODO Auto-generated method stub
		sqlSession.selectOne("mapper.notice.viewCount", noticeNO);
		
	}


}
