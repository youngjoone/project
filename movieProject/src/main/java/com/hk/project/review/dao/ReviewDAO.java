package com.hk.project.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.review.vo.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewVO> selectMovieReview(String mid){
		List<ReviewVO> selectMovieReview = sqlSession.selectList("mapper.review.selectMovieReview",mid);
		return selectMovieReview;
	}
}
