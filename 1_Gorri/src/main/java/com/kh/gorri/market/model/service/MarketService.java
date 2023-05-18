package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.common.model.vo.Attachment;

public interface MarketService {

	int getListCount(int i);

	ArrayList<Product> marketMainPage(PageInfo pi, int i);

	int insertProduct(Product p);



}
