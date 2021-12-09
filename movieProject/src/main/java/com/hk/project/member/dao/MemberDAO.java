package com.hk.project.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.member.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;

	public MemberVO checkUser(MemberVO memberVO) {
		memberVO = sqlSession.selectOne("mapper.member.checkUser", memberVO);
		return null;
	}

}
