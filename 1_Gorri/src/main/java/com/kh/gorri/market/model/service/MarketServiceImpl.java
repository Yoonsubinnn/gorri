package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.market.model.dao.MarketDAO;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;
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
		/**
		 * 마켓 메인페이지로 가는 서비스
		 */
		@Override
		public ArrayList<Product> marketMainPage(PageInfo pi, String category, String search) {
			/*어느 선택을 할 것인지도 보내야 합니다.*/
			
			return mDAO.marketMainPage(sqlSession, pi, category, search);
		}

		/**
		 * 상품의 정보를, 상품을 등록한 유저의 id를 통해 가져오게 함.
		 */
		@Override
		public Product getProductInfo(int productId) {
			return mDAO.getProductInfo(sqlSession,productId);
		}
		/**
		 * 판매자 객체를 제품의 판매자 ID를 통해 가져오는 함수
		 */
		@Override
		public Member getSellerInfo(String seller) {
			// TODO Auto-generated method stub
			return mDAO.getSellerInfo(sqlSession, seller);
		}
		@Override
		public int insertProduct(Product p) {
			return mDAO.insertproduct(sqlSession, p);
		}
		@Override
		public int insertProudctattm(ArrayList<Attachment> list) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public ArrayList<Inquire> ProductAllInquire(PageInfo pi, Integer productId) {
			// TODO Auto-generated method stub
			return mDAO.ProductAllInquire(sqlSession, pi, productId);
		}
		@Override
		public ArrayList<Review> ProductAllReview(PageInfo pi, Integer productId) {
			// TODO Auto-generated method stub
			return mDAO.ProductAllReview(sqlSession, pi, productId);
		}
		@Override
		public Review ProductOneReview(Integer productId, Integer reviewNo) {
			// TODO Auto-generated method stub
			return mDAO.ProductOneReview(sqlSession, productId, reviewNo);
		}
		@Override
		public Inquire ProductOneInquire(Integer productId, Integer inquireNo) {
			// TODO Auto-generated method stub
			return mDAO.ProductOneInquire(sqlSession, productId, inquireNo);
		}
		@Override
		public ArrayList<Inquire> ProductAllInquire(int productId) {
			// TODO Auto-generated method stub
			return mDAO.ProductAllInquire(sqlSession, productId);
		}
		@Override
		public ArrayList<Review> ProductAllReview(int productId) {
			// TODO Auto-generated method stub
			return mDAO.ProductAllReview(sqlSession, productId);
		}
		@Override
		public ArrayList<InquireReply> ProductOneInquireReply(Integer productId, Integer inquireNo) {
			// TODO Auto-generated method stub
			return mDAO.ProductOneInquireReply(sqlSession, productId, inquireNo);
		}
	
}
