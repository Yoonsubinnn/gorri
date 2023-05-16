package com.kh.gorri.market.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.exception.MarketException;
import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Product;

@Controller
public class MarketController {

	@Autowired
	private MarketService mService;
	
	
	/*sysout은 테스트를 위해 남겨두었습니다. 최종버전에서는 주석처리하세요
	 * TODO는 작성해야 하는 로직입니다. TODO가 없으면 완성이라고 간주합니다.
	 * 각 메서드 위에 무슨 메서드인지 주석도 남겨놨습니다.
	 * */
	
	
	
	
	
	
	/**
	 * 각 게시물을 누르면 게시물의 상세내용으로 이동합니다.
	 * @author lee94
	 */
	@RequestMapping("ProductDetail.market")
	public String marketProductDetail() {
		//TODO
		
		System.out.println("marketProductDetail");
		
		return "marketProductDetail";
	}
	/**
	 * 마켓 메인페이지에서 등록한 상품 버튼 누르면
	 * 유저가 등록한 상품 게시판으로 이동
	 */
	@RequestMapping("MyProductBoard.market")
	public String marketMyProductBoard() {
		//TODO
		System.out.println("marketMyProductBoard");
		
		return "marketMyProductBoard";
	}
	
	/**
	 * 마켓 메인페이지에서 상품 등록 버튼 누르면
	 * 상품 등록하는 게시글 뜹니다.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		//TODO
		System.out.println("marketRegister");
		
		return "marketRegister";
	}
	
	/**
	 * 내가 등록한 상품 게시판에서, 게시글 누르면
	 * 유저의 등록 게시물로 넘어가게 함
	 */
	@RequestMapping("MyProduct.market")
	public String marketMyProduct() {
		//TODO
		System.out.println("marketMyProduct");
		
		return "marketMyProduct";
	}
	
	/**
	 * 남이 등록한 게시물에서, 구매하기 누르면
	 * 구매창으로 넘어가게 함.
	 */
	@RequestMapping("BuyingPage.market")
	public String marketBuyingPage() {
		//TODO
		System.out.println("marketBuyingPage");
		
		return "marketBuyingPage";
	}
	
	/**
	 * 마켓 메인페이지로 넘어가게 하는 기능
	 */
	@GetMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								Model model
								) {
		//TODO
		System.out.println("marketMainPage");
		//1. 어느페이지로 간다고 지정 안 했으면 기본적으로 1을 넣어줌
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = mService.getListCount(1);
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println(pi);
		//limit가 9인 page
		
		ArrayList<Product> list = mService.marketMainPage(pi, 1);
		System.out.println(list);
		
		if(list !=null) {
			//잘 가져왔을 때.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "marketMainPage";
		} else {
			throw new MarketException("게시글 조회 실패");
		}
		
		
		
	}
	
	
	
	
	
	
}
