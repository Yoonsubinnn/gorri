package com.kh.gorri.group.model.dao;

import java.util.ArrayList;
import java.util.Properties;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

@Repository
public class GroupDAO {

	public int insertGroup(SqlSessionTemplate sqlSession, Group g) {
		return sqlSession.insert("groupMapper.insertGroup", g);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("groupMapper.insertAttm", a);
	}

	public int insertGroupMember(SqlSessionTemplate sqlSession, GroupMember gm) {
		return sqlSession.insert("groupMapper.insertGroupMember", gm);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("groupMapper.getListCount");
	}

	public ArrayList<Group> selectGroupList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.selectGroupList", null, rowBounds);
	}
	
	public ArrayList<Attachment> selectAttmGroupList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("groupMapper.selectAttmGroupList");
	}

	public ArrayList<Group> searchGroupList(SqlSessionTemplate sqlSession, Properties search) {
		String searchCate = search.getProperty("searchCate");
		String searchWord = search.getProperty("searchWord");
		
		if(searchCate == "������") {
			return (ArrayList)sqlSession.selectList("groupMapper.searchGroupByHost", searchWord);			
		} else if(searchCate == "���Ӹ�"){
			return (ArrayList)sqlSession.selectList("groupMapper.searchGroupByName", searchWord);	
		} else {
			return (ArrayList)sqlSession.selectList("groupMapper.searchGroup", searchWord);
		}
	}
	

	public ArrayList<Group> selectGroupView(SqlSessionTemplate sqlSession, int groupNo) {
		return (ArrayList) sqlSession.selectList("groupMapper.selectGroupView", groupNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("groupMapper.selectListCount", i);
	}

	public ArrayList<GroupBoard> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("groupMapper.selectBoardList", i, rowBounds);
	}

	// 0514 �� �Խñ� ��ȸ
	public GroupBoard selectDetailBoard(SqlSessionTemplate sqlSession, GroupBoard gb) {
		return sqlSession.selectOne("groupMapper.selectDetailBoard", gb);
	}

	public ArrayList<Group> selectGroupListWithHost(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.selectGroupListWithHost", null, rowBounds);
	}
	
	// ���� ȸ�� ��
	public int getMemberCount(SqlSessionTemplate sqlSession, int membershipNo) {
		return sqlSession.selectOne("groupMapper.getMemberCount", membershipNo);
	}

	public int getCategoryListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("groupMapper.getCategoryListCount", category);
	}

	public ArrayList<Group> selectCategoryGroupList(SqlSessionTemplate sqlSession, String category, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.selectCategoryGroupList", category, rowBounds);
	}

	public ArrayList<Member> getGroupMemberList(SqlSessionTemplate sqlSession, int membershipNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.getGroupMemberList", membershipNo, rowBounds);
	}

	public Attachment getGroupPic(SqlSessionTemplate sqlSession, int membershipNo) {
		return sqlSession.selectOne("groupMapper.getGroupPic", membershipNo);
	}

	public Group getGroupInfo(SqlSessionTemplate sqlSession, int membershipNo) {
		return sqlSession.selectOne("groupMapper.getGroupInfo", membershipNo);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, GroupMember gc) {
		return sqlSession.update("groupMapper.deleteMember", gc);
	}

}
