package com.hk.project.join.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.join.vo.BookingVO;

@Repository
public class BookingDAO {

	@Autowired
	SqlSession sqlSession;

	public List<BookingVO> bookingInfo(String id) {
		List<BookingVO> bookingList = sqlSession.selectList("mapper.booking.bookingInfo",id);
		return bookingList;
	}
	


	

//	public BookingVO selectTno(String ticketNo) {
//		BookingVO bookingVO = sqlSession.selectOne("mapper.booking.selectInfo", ticketNo);
//		return bookingVO;
//	}
	
}
