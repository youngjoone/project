package com.hk.project.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.movie.dao.MovieDAO;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.notice.dao.NoticeDAO;
import com.hk.project.notice.vo.NoticeVO;



@Service
public class MainService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	@Autowired
	MovieDAO movieDAO;
	
	public List<NoticeVO> getNoticeVOList() {
		return noticeDAO.selectAllNotices();
	}
	public List<MovieVO> getMovieVOList(){
		return movieDAO.selectAllMovies();
	}
}
