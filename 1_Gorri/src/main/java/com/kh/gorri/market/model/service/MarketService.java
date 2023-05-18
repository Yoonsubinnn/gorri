package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;

public interface MarketService {

	int getListCount(int i);

	ArrayList<Product> marketMainPage(PageInfo pi, int i);

	Product getProductInfo(int bId);

	Member getSellerInfo(String seller);

	ArrayList<Inquire> getProductInquire(int productId);

	ArrayList<Review> getProductReview(int productId);

}

