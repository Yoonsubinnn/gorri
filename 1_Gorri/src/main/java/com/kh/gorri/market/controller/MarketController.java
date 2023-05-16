package com.kh.gorri.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	/**
	 * 각 게시물을 누르면 게시물의 상세내용으로 이동합니다.
	 * @author lee94
	 */
	@RequestMapping("ProductDetail.market")
	public String marketProductDetail() {
		
		System.out.println("작동");
		
		return "marketProductDetail";
	}
	/**
	 * 마켓 메인페이지에서 등록한 상품 버튼 누르면
	 * 유저가 등록한 상품 게시판으로 이동
	 */
	@RequestMapping("MyProductBoard.market")
	public String marketMyProductBoard() {
		
		System.out.println("작동");
		
		return "marketMyProductBoard";
	}
	
	/**
	 * 마켓 메인페이지에서 상품 등록 버튼 누르면
	 * 상품 등록하는 게시글 뜹니다.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		
		System.out.println("작동");
		
		return "marketRegister";
	}
	
	/**
	 * 내가 등록한 상품 게시판에서, 게시글 누르면
	 * 유저의 등록 게시물로 넘어가게 함
	 */
	@RequestMapping("MyProduct.market")
	public String marketMyProduct() {
		
		System.out.println("작동");
		
		return "marketMyProduct";
	}
	
	/**
	 * 남이 등록한 게시물에서, 구매하기 누르면
	 * 구매창으로 넘어가게 함.
	 */
	@RequestMapping("BuyingPage.market")
	public String marketBuyingPage() {
		
		System.out.println("작동");
		
		return "marketBuyingPage";
	}
	
	/**
	 * 마켓 메인페이지로 넘어가게 하는 기능
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage() {
		
		System.out.println("작동");
		
		return "marketMainPage";
	}
	
}
