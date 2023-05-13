package com.kh.gorri.member.model.service;

import com.kh.gorri.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int findPwd(Member m);

	int changePwd(Member m);
	
	int insertMember(Member m);

	int checkId(String id);

	int checkNick(String nickName);

	String findId(Member m);
}
