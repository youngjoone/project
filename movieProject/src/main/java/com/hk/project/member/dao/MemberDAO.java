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
			return memberVO; //로그인 정보에 맞는 VO값
	}
	
	public String duplicateCheckID(String id) {
		//결과값에 id가 있으면 id값이 나오고,
		//        id가 없으면 아무것도 안나오고
		//return : String
		String dupid = sqlSession.selectOne("mapper.member.dupId", id);
		return dupid;
	}

	public int insertUser(MemberVO memberVO) {
		int ret = sqlSession.insert("mapper.member.joinUser", memberVO);
		return ret;
	}
}
