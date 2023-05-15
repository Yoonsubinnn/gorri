package com.kh.gorri.group.model.service;

import java.util.ArrayList;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;

public interface GroupService {

	//보서)글번호에 맞는 데이터 셀렉 
	ArrayList<Group> selectGroupView(int groupNo);

	//보서)모임 번호에 맞는 board 수 셀렉 
	int getListCount(int i);

	//보서)페이징 + board 셀렉 
	ArrayList<GroupBoard> selectBoardList(PageInfo pi, int i);

	GroupBoard selectDetailBoard(GroupBoard gb);



}
