package com.kh.gorri.market.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Product;
	/**
	 * 마켓에서의 DAO
	 * @author lee94
	 *
	 */
@Repository
public class MarketDAO {

		public int getListCount(SqlSessionTemplate sqlSession, int i) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("marketMapper.getListCount", sqlSession);
		}

		public ArrayList<Product> marketMainPage(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
			// TODO Auto-generated method stub
			return (ArrayList)sqlSession.selectList("marketMapper.marketMainPage", sqlSession);
		}

}
