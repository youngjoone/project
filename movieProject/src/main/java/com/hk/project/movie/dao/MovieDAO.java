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
}
