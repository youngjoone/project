package com.hk.project.join.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.join.vo.BookingDateVO;

@Repository
public class BookingDateDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	public List<BookingDateVO> getMMDD(String mid) {
		// TODO Auto-generated method stub
		List<BookingDateVO> getMMDD = sqlSession.selectList("mapper.bookingDate.getMMDD", mid);
		return getMMDD;
	}


	public List<BookingDateVO> getHHMM(HashMap<String,Object> MMDDmap) {
		// TODO Auto-generated method stub
		List<BookingDateVO> getHHMM = sqlSession.selectList("mapper.bookingDate.getHHMM", MMDDmap);
		return getHHMM;
	}
	
	public int selectScreenDateNo() {
		int screenDateNo = sqlSession.selectOne("mapper.bookingDate.getScreenDateNoLast");
		return screenDateNo;
	}


	public List<BookingDateVO> getSeat(BookingDateVO bookingDateVO) {
		// TODO Auto-generated method stub
		List<BookingDateVO> getSeat = sqlSession.selectList("mapper.bookingDate.getSeat",bookingDateVO);
		return getSeat;
	}
}
