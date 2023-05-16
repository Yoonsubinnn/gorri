package com.kh.gorri.group.model.service;

import java.util.ArrayList;
import java.util.Properties;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.dao.GroupDAO;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GroupDAO gDAO;

	@Override
	public int insertGroup(Group g) {
		return gDAO.insertGroup(sqlSession, g);
	}

	@Override
	public int insertAttm(Attachment a) {
		return gDAO.insertAttm(sqlSession, a);
	}

	@Override
	public int insertGroupMember(GroupMember gm) {
		return gDAO.insertGroupMember(sqlSession, gm);
	}

	@Override
	public int getListCount() {
		return gDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Group> selectGroupList(PageInfo pi) {
		return gDAO.selectGroupList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attachment> selectAttmGroupList() {
		return gDAO.selectAttmGroupList(sqlSession);
	}

	@Override
	public ArrayList<Group> searchGroup(Properties search) {
		return gDAO.searchGroupList(sqlSession, search);
	}


	@Override
	public ArrayList<Group> selectGroupView(int groupNo) {
		return gDAO.selectGroupView(sqlSession, groupNo);
	}

	@Override
	public int getListCount(int i) {
		return gDAO.selectListCount(sqlSession, i);
	}

	@Override
	public ArrayList<GroupBoard> selectBoardList(PageInfo pi, int i) {
		return gDAO.selectBoardList(sqlSession, pi, i);
	}

	@Override
	public GroupBoard selectDetailBoard(GroupBoard gb) {
		return gDAO.selectDetailBoard(sqlSession, gb);
	   }

	@Override
	public ArrayList<Group> selectGroupListWithHost(PageInfo pi) {
		return gDAO.selectGroupListWithHost(sqlSession, pi);
	}

	@Override
	public int getMemberCount(int membershipNo) {
		return gDAO.getMemberCount(sqlSession, membershipNo);
	}


	@Override
	public int getCategoryListCount(String category) {
		return gDAO.getCategoryListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Group> selectCategoryGroupList(String category, PageInfo pi) {
		return gDAO.selectCategoryGroupList(sqlSession, category, pi);
	}

	@Override
	public ArrayList<Member> getGroupMemberList(int membershipNo, PageInfo pi) {
		return gDAO.getGroupMemberList(sqlSession, membershipNo, pi);
	}

	@Override
	public Attachment getGroupPic(int membershipNo) {
		return gDAO.getGroupPic(sqlSession, membershipNo);
	}

	@Override
	public Group getGroupInfo(int membershipNo) {
		return gDAO.getGroupInfo(sqlSession, membershipNo);
	}

	@Override
	public int deleteMember(GroupMember gc) {
		return gDAO.deleteMember(sqlSession, gc);
	}


	

	
}
