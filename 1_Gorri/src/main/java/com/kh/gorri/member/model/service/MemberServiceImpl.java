package com.kh.gorri.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.member.model.dao.MemberDAO;
import com.kh.gorri.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int findPwd(Member m) {
		return mDAO.findPwd(sqlSession, m);
	}

	@Override
	public int changePwd(Member m) {
		return mDAO.changePwd(sqlSession,m);
	}
	
	//-------------------------------------------����)ȸ������ ���� 2023.05.12
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}
	
	//����)���̵� �ߺ� ���� 2023.05.12
	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}
	
	//����)�г��� �ߺ� ���� 2023.05.12
	@Override
	public int checkNick(String nickName) {
		return mDAO.checkNick(sqlSession, nickName);
	}

	@Override
	public int getListCount() {
		return mDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return mDAO.selectMemberList(sqlSession, pi);
	}
	
	//����) ���̵� ã�� ���� 2023.05.12
//	@Override
//	public ArrayList<Member> findId(Member m) {
//		return mDAO.findId(sqlSession, m);
//	}
	
}
