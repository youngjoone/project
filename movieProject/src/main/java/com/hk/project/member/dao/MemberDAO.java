package com.hk.project.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.project.member.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;

	//로그인
	public MemberVO isExisted(MemberVO memberVO) {
		  //MemberVO login
			memberVO = sqlSession.selectOne("mapper.member.isExisted", memberVO);
			System.out.println("dao"+memberVO.toString());
			return memberVO; //로그인 정보에 맞는 VO값
		}
}
