package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.dao.MarketDAO;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;
	/**
	 * ���Ͽ����� ����. �߻�Ŭ���� ��ӹް���.
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
		/**
		 * ���� ������������ ���� ����
		 */
		@Override
		public ArrayList<Product> marketMainPage(PageInfo pi, int i) {
			// TODO Auto-generated method stub
			return mDAO.marketMainPage(sqlSession,pi,i);
		}

		/**
		 * ��ǰ�� ������, ��ǰ�� ����� ������ id�� ���� �������� ��.
		 */
		@Override
		public Product getProductInfo(int productId) {
			return mDAO.getProductInfo(sqlSession,productId);
		}
		/**
		 * �Ǹ��� ��ü�� ��ǰ�� �Ǹ��� ID�� ���� �������� �Լ�
		 */
		@Override
		public Member getSellerInfo(String seller) {
			// TODO Auto-generated method stub
			return mDAO.getSellerInfo(sqlSession, seller);
		}
		@Override
		public ArrayList<Inquire> getProductInquire(int productId) {
			// TODO Auto-generated method stub
			return mDAO.getProductInquire(sqlSession, productId);
		}
		@Override
		public ArrayList<Review> getProductReview(int productId) {
			// TODO Auto-generated method stub
			return mDAO.getProductReview(sqlSession, productId);
		}
	
}
