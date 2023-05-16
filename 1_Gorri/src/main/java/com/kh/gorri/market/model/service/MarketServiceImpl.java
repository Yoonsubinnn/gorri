package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.dao.MarketDAO;
import com.kh.gorri.market.model.vo.Product;
	/**
	 * 마켓에서의 서비스. 추상클래스 상속받게함.
	 * 
	 * @author lee94
	 *
	 */
@Service
public class MarketServiceImpl implements MarketService {
		@Autowired
		private SqlSessionTemplate sqlSession;
		@Autowired
		private MarketDAO mDAO;
	
		@Override
		public int getListCount(int i) {
			// TODO Auto-generated method stub
			return mDAO.getListCount(sqlSession, i);
		}

		@Override
		public ArrayList<Product> marketMainPage(PageInfo pi, int i) {
			// TODO Auto-generated method stub
			return mDAO.marketMainPage(sqlSession,pi,i);
		}
	
}
