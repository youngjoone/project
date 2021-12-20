package com.hk.project.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.movie.vo.MovieVO;

@Repository
public class MovieDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<MovieVO> selectAllMovies(){
		List<MovieVO> moviesList = sqlSession.selectList("mapper.movie.movieListReview");
		return moviesList;
	}
	
	public List<MovieVO> allMovies(){
		List<MovieVO> moviesList = sqlSession.selectList("mapper.movie.movieList");
		return moviesList;
	}
	
	public MovieVO detail(String mid) {
		MovieVO movieVO = sqlSession.selectOne("mapper.movie.selectOne", mid);
		
		return movieVO;
	}
	
	public int addMovie(MovieVO movieVO) {
		int ret = sqlSession.insert("mapper.movie.insertMovie", movieVO);
		return ret;
	}
	public int updateMovie(MovieVO movieVO) {
		// TODO Auto-generated method stub
		int ret = sqlSession.update("mapper.movie.updateMovie", movieVO);
		return ret;
	}
	public int deleteMovie(MovieVO movieVO) {
		// TODO Auto-generated method stub
		int ret = sqlSession.delete("mapper.movie.deleteMovie", movieVO);
		return ret;
	}
	public MovieVO dupMid(String mid) {
		// TODO Auto-generated method stub
		MovieVO dupMid = sqlSession.selectOne("mapper.movie.selectOne", mid);
		return dupMid;
	}

	public List<MovieVO> bookingMovieList() {
		// TODO Auto-generated method stub
		List<MovieVO> movieVO = sqlSession.selectList("mapper.movie.bookingMovieList");
		return movieVO;
	}

	//관리자 상영정보입력
	public List<MovieVO> movieList() {
		List<MovieVO> movieList = sqlSession.selectList("mapper.movie.movieListSelect");
		return movieList;
	}

	public int selectMid() {
		int mid = sqlSession.selectOne("mapper.movie.selectMid");
		return mid;
	}
	
	public List<MovieVO> movieList2(String mid){
		List<MovieVO> movieList = sqlSession.selectList("mapper.movie.selectOne",mid);
		return movieList;
	}
}
