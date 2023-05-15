package com.kh.gorri.group.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;

@Repository
public class GroupDAO {

	public ArrayList<Group> selectGroupView(SqlSessionTemplate sqlSession, int groupNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectGroupView", groupNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("groupMapper.selectListCount", i);
	}

	public ArrayList<GroupBoard> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.selectBoardList", i, rowBounds);
	}

	//0514 상세 게시글 조회
	public GroupBoard selectDetailBoard(SqlSessionTemplate sqlSession, GroupBoard gb) {
		return sqlSession.selectOne("groupMapper.selectDetailBoard", gb);
	}
	
	
	
}
