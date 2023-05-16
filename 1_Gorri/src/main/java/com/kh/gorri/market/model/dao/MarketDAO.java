package com.kh.gorri.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Product;
	/**
	 * ���Ͽ����� DAO
	 * @author lee94
	 *
	 */
@Repository
public class MarketDAO {

	/**
	 * ���������̼��� ���� �Լ�	
	 * @param sqlSession
	 * @param i
	 * @return
	 */
	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("marketMapper.getListCount", i);
	}

	public ArrayList<Product> marketMainPage(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("marketMapper.marketMainPage", i, rowBounds);
	}

}
