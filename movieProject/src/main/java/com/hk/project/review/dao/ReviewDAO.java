package com.hk.project.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.movie.vo.MovieVO;
import com.hk.project.review.vo.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewVO> selectMovieReview(String mid){
		List<ReviewVO> selectMovieReview = sqlSession.selectList("mapper.review.selectMovieReview",mid);
		return selectMovieReview;
	}

	public int insertReview(ReviewVO reviewVO) {
		int ret = sqlSession.insert("mapper.review.insertReview", reviewVO);
		return ret;
	}
	public void deleteReview(MovieVO movieVO) {
		sqlSession.delete("mapper.review.cancleReview2", movieVO);
	}
	public void cancleReview(String ticketNo) {
		sqlSession.delete("mapper.review.cancleReview", ticketNo);
	}
}
