package com.kh.gorri.group.model.service;

import java.util.ArrayList;
import java.util.Properties;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

public interface GroupService {

	int insertGroup(Group g);

	int insertAttm(Attachment a);

	int insertGroupMember(GroupMember gm);

	int getListCount();

	ArrayList<Group> selectGroupList(PageInfo pi);

	ArrayList<Attachment> selectAttmGroupList();

	ArrayList<Group> searchGroup(Properties search);

	// ����)�۹�ȣ�� �´� ������ ����
	ArrayList<Group> selectGroupView(int groupNo);

	// ����)���� ��ȣ�� �´� board �� ����
	int getListCount(int i);

	// ����)����¡ + board ����
	ArrayList<GroupBoard> selectBoardList(PageInfo pi, int i);

	GroupBoard selectDetailBoard(GroupBoard gb);

	ArrayList<Group> selectGroupListWithHost(PageInfo pi);

	int getMemberCount(int membershipNo);

	int getCategoryListCount(String category);

	ArrayList<Group> selectCategoryGroupList(String category, PageInfo pi);

	ArrayList<Member> getGroupMemberList(int membershipNo, PageInfo pi);

	Attachment getGroupPic(int membershipNo);

	Group getGroupInfo(int membershipNo);

	int deleteMember(GroupMember gc);



	


}
