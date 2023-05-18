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
	
	
	/*sysout�� �׽�Ʈ�� ���� ���ܵξ����ϴ�. �������������� �ּ�ó���ϼ���
	 * TODO�� �ۼ��ؾ� �ϴ� �����Դϴ�. TODO�� ������ �ϼ��̶�� �����մϴ�.
	 * �� �޼��� ���� ���� �޼������� �ּ��� ���ܳ����ϴ�.
	 * */
//	----------------------------0
	/**
	 * �� �Խù��� ������ �Խù��� �󼼳������� �̵��մϴ�.
	 * 
	 * @author lee94
	 */
	@RequestMapping("Product.market")
	public ModelAndView marketProduct(HttpSession session,
											ModelAndView mv,
											@RequestParam("productId") int productId,	//��ǰ��ȣ(productId)
//											@RequestParam("writer") String writer, 
											@RequestParam("page") int page) {
		
		
		Member m = (Member)session.getAttribute("loginUser");	//���� �α����� �� ��ü ����� �Լ�
		//���� ������ �ʿ������, ���ֿ� ���Ͻ��� �־ ��������.
		Product p = mService.getProductInfo(productId);
		System.out.println(p);
		Member seller = mService.getSellerInfo(p.getProductSellerId());	//�Ǹ��� ����(���̵�)�� ���� �����ü�� �����ϴ�, �Ǹ��� ������ ��������  �Լ�
		//���ǿ� ��� �α����� ��� ��ü�� �����ϰ�, ��ǰ��ȣ�� ���� ��ǰ��ü�� ����.
		
		/*����, �ٸ��������� �ѱ� ��, �� �������� if���� ���� ������ �̰� �ۼ��մϴ�.
		 * ���⼭ p�� getProductSellerId��  m.userid�� ���ؼ�
		 * ������ ����, Ʋ���� ����� �Ѿ�� �մϴ�.*/
		//������, �׳� ������������ ����ϱ�� �Ѵٸ� �Ʒ��� ���� �մϴ�.
		
				/*�ؾ��� ��:��
				 * 1. ��ǰ�� id�� ���� ����, �ı⸦ ��������*/
		//1. ����
		ArrayList<Inquire> productInq = mService.getProductInquire(productId);
		System.out.println(productInq); 
		
		//2. �ı�
		
		ArrayList<Review> productReview = mService.getProductReview(productId);
		System.out.println(productInq); 
		
		
		
		
		
		
		
		if (p != null) {		//����� �����Դٸ�, ������ ���� �����մϴ�. �� ���� product���������� ����մϴ�.
			mv.addObject("p", p);
			mv.addObject("page", page);
			mv.addObject("seller", seller);
			mv.addObject("productInq", productInq);
			mv.addObject("productReview", productReview);
//			mv.addObject("list", list);
			mv.setViewName("marketProduct");	//��� jsp�� ���������� ���� ��

			return mv;
		} else {
			throw new MarketException("�Խñ� �󼼺��⸦ �����Ͽ����ϴ�.");
		}
		
		
		
//		System.out.println("marketProductDetail");
		
	}
	//���� �ϼ��Ǳ� ������ �̰� ����ϼ���
//	@RequestMapping("Product.market")
//	public String marketProductDetail() {
//		//TODO
//		
//		System.out.println("marketProductDetail");
//		
//		//�� �����ϸ� marketProduct�� �ٲ��ּ���
//		return "marketProduct";
//	}
	/**
	 * ���� �������������� ����� ��ǰ ��ư ������
	 * ������ ����� ��ǰ �Խ������� �̵�
	 */
	@RequestMapping("MyProductBoard.market")
	public String marketMyProductBoard() {
		//TODO
		System.out.println("marketMyProductBoard");
		
		return "marketMyProductBoard";
	}
	
	/**
	 * ���� �������������� ��ǰ ��� ��ư ������
	 * ��ǰ ����ϴ� �Խñ� ��ϴ�.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		//TODO
		System.out.println("marketRegister");
		
		return "marketRegister";
	}
	
	/**
	 * ���� ����� ��ǰ �Խ��ǿ���, �Խñ� ������
	 * ������ ��� �Խù��� �Ѿ�� ��
	 */
	@RequestMapping("MyProduct.market")
	public String marketMyProduct() {
		//TODO
		System.out.println("marketMyProduct");
		
		return "marketMyProduct";
	}
	
	/**
	 * ���� ����� �Խù�����, �����ϱ� ������
	 * ����â���� �Ѿ�� ��.
	 */
	@RequestMapping("BuyingPage.market")
	public String marketBuyingPage() {
		//TODO
		System.out.println("marketBuyingPage");
		
		return "marketBuyingPage";
	}
	
	/**
	 * ���� ������������ �Ѿ�� �ϴ� ���
	 * ���� ������������ �Ѿ����,
	 * ���������̼ǰ� ��� ���� ����Ʈ�� �����;� �մϴ�.
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								Model model
								) {
		//TODO
		System.out.println("marketMainPage");
		//1. ����������� ���ٰ� ���� �� ������ �⺻������ 1�� �־���
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = mService.getListCount(1);
//		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
//		System.out.println(pi);
		//limit�� 9�� page
		
		//�ٽ� �̰� �������� �ѱ��.
		ArrayList<Product> list = mService.marketMainPage(pi, 1);
//		System.out.println(list);
		
		if(list !=null) {
			//�� �������� ��.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "marketMainPage";
		} else {
			throw new MarketException("�Խñ� ��ȸ ����");
		}
		
		
		
	}
	/*������ �����ϸ�, �̰� ������������*/
//	@RequestMapping("MainPage.market")
//	public String marketMainPage() {
//		System.out.println("marketMainPage");
//		return "marketMainPage";
//	}
	
	
	
	
	
	
}
