package com.hk.project.screendate.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public ScreenDateVO dupChk(ScreenDateVO screenDateVO) {
		screenDateVO = sqlSession.selectOne("mapper.screenDate.dupChk", screenDateVO);
		return screenDateVO;
	}

	public ScreenDateVO dupChk(String screenNO, Date screenTime) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("screenNO", screenNO);
        map.put("screenTime", screenTime);
        ScreenDateVO screenDateVO = sqlSession.selectOne("mapper.screenDate.dupChk", map);
		return screenDateVO;
	}

}
