package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;

public interface MarketService {

	int getListCount(int i);

	ArrayList<Product> marketMainPage(PageInfo pi, String category, String search);

	Product getProductInfo(int bId);

	Member getSellerInfo(String seller);

//	ArrayList<Inquire> getProductInquire(int productId);
//
//	ArrayList<Review> getProductReview(int productId);
	
	int insertProduct(Product p);

	int insertProudctattm(ArrayList<Attachment> list);

	ArrayList<Inquire> ProductAllInquire(PageInfo pi, Integer productId);
	
	ArrayList<Inquire> ProductAllInquire(int productId);

	ArrayList<Review> ProductAllReview(PageInfo pi, Integer productId);
	
	ArrayList<Review> ProductAllReview(int productId);

	Review ProductOneReview(Integer productId, Integer reviewNo);

	Inquire ProductOneInquire(Integer productId, Integer inquireNo);

	ArrayList<InquireReply> ProductOneInquireReply(Integer productId, Integer inquireNo);

	

	

}

