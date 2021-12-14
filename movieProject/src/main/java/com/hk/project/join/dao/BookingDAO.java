package com.hk.project.join.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.join.vo.BookingVO;

@Repository
public class BookingDAO {

	@Autowired
	SqlSession sqlSession;

	public BookingVO bookingInfo(String id) {
		BookingVO bookingVO = sqlSession.selectOne("mapper.booking.bookingInfo", id);
		return bookingVO;
	}
	
}
