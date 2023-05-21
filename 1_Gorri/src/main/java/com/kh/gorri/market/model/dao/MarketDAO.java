package com.kh.gorri.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;
	/**
	 * 마켓에서의 DAO
	 * @author lee94
	 *
	 */
@Repository
public class MarketDAO {

	/**
	 * 페이지네이션을 위한 함수2r개
	 * @param sqlSession
	 * @param i
	 * @return
	 */
	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("marketMapper.getListCount", i);
	}

	public ArrayList<Product> marketMainPage(SqlSessionTemplate sqlSession, PageInfo pi,  String category, String search) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		//2개의 값을 넘겨주기 위해 만든 Map
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("category", category);
		parameterMap.put("search", search);
		
		return (ArrayList)sqlSession.selectList("marketMapper.marketMainPage", parameterMap, rowBounds);
	}
	
	/**
	 * 상품 정보를 가져오는 메소드
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public Product getProductInfo(SqlSessionTemplate sqlSession, int productId) {
		return sqlSession.selectOne("marketMapper.getProductInfo", productId);
	}

	/**
	 * 판매자 정보를 가져오는 메소드
	 * @param sqlSession
	 * @param writer
	 * @return
	 */
	public Member getSellerInfo(SqlSessionTemplate sqlSession, String seller) {
		return sqlSession.selectOne("marketMapper.getSellerInfo", seller);
	}

	public int insertproduct(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Inquire> ProductAllInquire(SqlSessionTemplate sqlSession, PageInfo pi, 
											 Integer productId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllInquire", productId, rowBounds);
	}

	public ArrayList<Review> ProductAllReview(SqlSessionTemplate sqlSession, PageInfo pi, 
										   Integer productId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllReview", productId, rowBounds);
	}

	public Review ProductOneReview(SqlSessionTemplate sqlSession, Integer productId, Integer reviewNo) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("productId", productId);
		parameterMap.put("reviewNo", reviewNo);
		return sqlSession.selectOne("marketMapper.ProductOneReview", parameterMap);
	}

	public Inquire ProductOneInquire(SqlSessionTemplate sqlSession, Integer productId, Integer inquireNo) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("productId", productId);
		parameterMap.put("inquireNo", inquireNo);
		return sqlSession.selectOne("marketMapper.ProductOneInquire", parameterMap);
	}

	public ArrayList<Inquire> ProductAllInquire(SqlSessionTemplate sqlSession, int productId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllInquire", productId);
	}

	public ArrayList<Review> ProductAllReview(SqlSessionTemplate sqlSession, int productId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllReview", productId);
	}

	public ArrayList<InquireReply> ProductOneInquireReply(SqlSessionTemplate sqlSession, Integer productId, Integer inquireNo) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("productId", productId);
		parameterMap.put("inquireNo", inquireNo);	
		return (ArrayList)sqlSession.selectList("marketMapper.ProductOneInquireReply", parameterMap);
	}

}
