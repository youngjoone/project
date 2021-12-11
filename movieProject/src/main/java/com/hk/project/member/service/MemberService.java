package com.hk.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.project.member.dao.MemberDAO;
import com.hk.project.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO;

	public MemberVO checkUser(MemberVO memberVO) {
		return memberDAO.isExisted(memberVO);
	}
	
	public String duplicateCheck(String id) {
		return memberDAO.duplicateCheckID(id);
	}

	public int joinUser(MemberVO memberVO) {
		return memberDAO.insertUser(memberVO);
	}
	
}
