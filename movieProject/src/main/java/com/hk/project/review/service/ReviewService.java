package com.hk.project.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.review.dao.ReviewDAO;
import com.hk.project.review.vo.ReviewVO;

@Service
public class ReviewService {

	@Autowired
	ReviewDAO reviewDAO;

	public int insertReview(ReviewVO reviewVO) {
		return reviewDAO.insertReview(reviewVO);
	}
	
	
}
