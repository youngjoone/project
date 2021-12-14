package com.hk.project.movie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.movie.dao.MovieDAO;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.review.dao.ReviewDAO;
import com.hk.project.review.vo.ReviewVO;

@Service
public class MovieService {

	@Autowired
	MovieDAO movieDAO;
	@Autowired
	ReviewDAO reviewDAO;
	
	public List<List<MovieVO>> selectAllMovies(){
		// init return value
		List<List<MovieVO>> returnMovieVOList = new ArrayList<List<MovieVO>>();
		
		// get movie list
		List<MovieVO> movieDaoList = movieDAO.selectAllMovies();
		
		// 4���� �߶�ֱ� 
		int count = 0;
		List<MovieVO> tempMovieDaoList = new ArrayList<MovieVO>();
		
		for (MovieVO movieVO : movieDaoList) {
			count += 1;
			tempMovieDaoList.add(movieVO);
			
			if (count == 4) {
				count = 0;
				returnMovieVOList.add(tempMovieDaoList);
				tempMovieDaoList = new ArrayList<MovieVO>();
			}
		}
		
		//  ���� ��ȭ ����Ʈ �ֱ�
		if (count != 0) {
			returnMovieVOList.add(tempMovieDaoList);	
		}
		
		return returnMovieVOList;
	}
	public Map<String,Object> detail(String mid){
		MovieVO movieVO = movieDAO.detail(mid);
		List<ReviewVO> reviewVO = reviewDAO.selectMovieReview(movieVO.getMid());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movieVO", movieVO);
		map.put("reviewVO", reviewVO);
		return map;
	}
	
	public int addMovie(MovieVO movieVO) {
		return movieDAO.addMovie(movieVO);
	}
	public int updateMovie(MovieVO movieVO) {
		return movieDAO.updateMovie(movieVO);
	}
	public int deleteMovie(MovieVO movieVO) {
		// TODO Auto-generated method stub
		return movieDAO.deleteMovie(movieVO);
	}
	
	public MovieVO dupMid(String mid) {
		// TODO Auto-generated method stub
		MovieVO dupMid = movieDAO.dupMid(mid);
		return dupMid;
	}
}
