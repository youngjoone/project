package com.hk.project.screendate.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.screendate.vo.ScreenDateVO;

@Repository
public class ScreenDateDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertScreenDate(ScreenDateVO screenDateVO) {
		int ret = sqlSession.insert("mapper.screenDate.insertScreenDate", screenDateVO);
		return ret;
	}

	public List<ScreenDateVO> selectScreenDateList() {
		List<ScreenDateVO> screenDate = sqlSession.selectList("mapper.screenDate.selectScreenDateList");
		return screenDate;
	}

}
