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
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
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
	 * @author lee94
	 */
	@RequestMapping("Product.market")
	public ModelAndView marketProduct(HttpSession session,
											ModelAndView mv,
											@RequestParam("productId") int productId,	//상품번호(productId)
//											@RequestParam("writer") String writer, 
											@RequestParam("page") int page) {
		
		
		Member m = (Member)session.getAttribute("loginUser");	//지금 로그인한 놈 객체 만드는 함수
		//지금 당장은 필요없지만, 나주엥 쓰일스도 있어서 만들어놓음.
		Product p = mService.getProductInfo(productId);
		System.out.println(p);
		Member seller = mService.getSellerInfo(p.getProductSellerId());	//판매자 정보(아이디)를 통해 멤버객체를 생성하는, 판매자 정보를 가져오는  함수
		//세션에 담긴 로그인한 멤버 객체를 생성하고, 상품번호를 통해 상품객체를 만듦.
		
		/*만일, 다른페이지로 넘길 때, 그 페이지에 if문을 쓰기 싫으면 이걸 작성합니다.
		 * 여기서 p의 getProductSellerId랑  m.userid랑 비교해서
		 * 맞으면 여기, 틀리면 저기로 넘어가게 합니다.*/
		//하지만, 그냥 같은페이지를 사용하기로 한다면 아래와 같이 합니다.
		
				/*해야할 것:ㅣ
				 * 1. 상품의 id를 통해 문의, 후기를 가져오기*/
		//1. 문의
		ArrayList<Inquire> productInq = mService.getProductInquire(productId);
		System.out.println(productInq); 
		
		//2. 후기
		
		ArrayList<Review> productReview = mService.getProductReview(productId);
		System.out.println(productInq); 
		
		
		
		
		
		
		
		if (p != null) {		//제대로 가져왔다면, 다음과 같이 매핑합니다. 이 값은 product페이지에서 사용합니다.
			mv.addObject("p", p);
			mv.addObject("page", page);
			mv.addObject("seller", seller);
			mv.addObject("productInq", productInq);
			mv.addObject("productReview", productReview);
//			mv.addObject("list", list);
			mv.setViewName("marketProduct");	//어느 jsp로 보내는지에 대한 것

			return mv;
		} else {
			throw new MarketException("게시글 상세보기를 실패하였습니다.");
		}
		
		
		
//		System.out.println("marketProductDetail");
		
	}
	//위가 완성되기 전에는 이걸 사용하세요
//	@RequestMapping("Product.market")
//	public String marketProductDetail() {
//		//TODO
//		
//		System.out.println("marketProductDetail");
//		
//		//다 수정하면 marketProduct로 바꿔주세요
//		return "marketProduct";
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
//		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
//		System.out.println(pi);
		//limit가 9인 page
		
		//다시 이걸 페이지에 넘긴다.
		ArrayList<Product> list = mService.marketMainPage(pi, 1);
//		System.out.println(list);
		
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
