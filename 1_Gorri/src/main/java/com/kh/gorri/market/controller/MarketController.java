package com.kh.gorri.market.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.exception.MarketException;
import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.member.model.vo.Member;

@Controller
public class MarketController {

	@Autowired
	private MarketService mService;
	
	
	/*sysout은 테스트를 위해 남겨두었습니다. 최종버전에서는 주석처리하세요
	 * TODO는 작성해야 하는 로직입니다. TODO가 없으면 완성이라고 간주합니다.
	 * 각 메서드 위에 무슨 메서드인지 주석도 남겨놨습니다.
	 * */
//	----------------------------0
	/**
	 * 각 게시물을 누르면 게시물의 상세내용으로 이동합니다.
	 * 
	 * 1. 글 작성자와 로그인한 사람이 같은지 알아야 하는 정보를 받아야 하고,
	 * 2. Product객체의 정보를 받아와야 하기 때문에 받아오고,
	 * 
	 * 그니까 이건,  이 컨트롤러는 왜 존재하냐?
	 * 제품 상세 표시 링크의 jsp 공간을 메꾸기 위해 존재한다.
	 * 이 공간에는 뭐가 존재하느냐?
	 * 1. 로그인 정보
	 * 2. 게시글 작성자 정보
	 * 3. 연관된 게시글 정보(문의, 후기)
	 * 4. 상품 번호(이걸로 가져오는 과정을 단축시킬 수 있음)
	 * 
	 * @author lee94
	 */
	@RequestMapping("ProductDetail.market")
	public ModelAndView marketProductDetail(HttpSession session,
											@RequestParam("ProductId") String ProductId) {
		
		Member m = (Member)session.getAttribute("loginUser");
		Product p = mService.getProductInfo(ProductId);		
		//제품 정보를 가져옴. 멤버 객체를 세션을 통해 생성
		
		
		
		
		
//		System.out.println("marketProductDetail");
		
		return null;
	}
	//위가 완성되기 전에는 이걸 사용하세요
//	@RequestMapping("ProductDetail.market")
//	public String marketProductDetail() {
//		//TODO
//		
//		System.out.println("marketProductDetail");
//		
//		//다 수정하면 marketProduct로 바꿔주세요
//		return "marketProductDetail";
//	}
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
	 * 마켓 메인페이지로 넘어가려면,
	 * 페이지네이션과 모든 마켓 리스트를 가져와야 합니다.
	 */
	@RequestMapping("MainPage.market")
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
		
		//다시 이걸 페이지에 넘긴다.
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
	/*위에꺼 수정하면, 이거 날려버리세요*/
//	@RequestMapping("MainPage.market")
//	public String marketMainPage() {
//		System.out.println("marketMainPage");
//		return "marketMainPage";
//	}
	
	
	
	
	
	
}
