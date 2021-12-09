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
		return memberDAO.checkUser(memberVO);
	}
	
}
