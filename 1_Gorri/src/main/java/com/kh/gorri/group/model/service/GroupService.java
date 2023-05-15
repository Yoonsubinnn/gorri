package com.kh.gorri.group.model.service;

import java.util.ArrayList;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;

public interface GroupService {

	//����)�۹�ȣ�� �´� ������ ���� 
	ArrayList<Group> selectGroupView(int groupNo);

	//����)���� ��ȣ�� �´� board �� ���� 
	int getListCount(int i);

	//����)����¡ + board ���� 
	ArrayList<GroupBoard> selectBoardList(PageInfo pi, int i);

	GroupBoard selectDetailBoard(GroupBoard gb);



}
