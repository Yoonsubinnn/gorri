package com.kh.gorri.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Inquire;
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

	public ArrayList<Product> marketMainPage(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("marketMapper.marketMainPage", i, rowBounds);
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

	/**
	 * 한 상품의 모든 문의를 가져오는 메소드
	 */
	public ArrayList<Inquire> getProductInquire(SqlSessionTemplate sqlSession, int productId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("marketMapper.getProductInquire", productId);
	}

	public ArrayList<Review> getProductReview(SqlSessionTemplate sqlSession, int productId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("marketMapper.getProductReview", productId);
	}

}
