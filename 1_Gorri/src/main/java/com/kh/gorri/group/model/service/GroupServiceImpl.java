package com.kh.gorri.group.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.dao.GroupDAO;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GroupDAO gDAO;

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
}
