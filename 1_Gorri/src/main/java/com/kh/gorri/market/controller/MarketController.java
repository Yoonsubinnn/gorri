package com.kh.gorri.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	/**
	 * �� �Խù��� ������ �Խù��� �󼼳������� �̵��մϴ�.
	 * @author lee94
	 */
	@RequestMapping("ProductDetail.market")
	public String marketProductDetail() {
		
		System.out.println("�۵�");
		
		return "marketProductDetail";
	}
	/**
	 * ���� �������������� ����� ��ǰ ��ư ������
	 * ������ ����� ��ǰ �Խ������� �̵�
	 */
	@RequestMapping("MyProductBoard.market")
	public String marketMyProductBoard() {
		
		System.out.println("�۵�");
		
		return "marketMyProductBoard";
	}
	
	/**
	 * ���� �������������� ��ǰ ��� ��ư ������
	 * ��ǰ ����ϴ� �Խñ� ��ϴ�.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		
		System.out.println("�۵�");
		
		return "marketRegister";
	}
	
	/**
	 * ���� ����� ��ǰ �Խ��ǿ���, �Խñ� ������
	 * ������ ��� �Խù��� �Ѿ�� ��
	 */
	@RequestMapping("MyProduct.market")
	public String marketMyProduct() {
		
		System.out.println("�۵�");
		
		return "marketMyProduct";
	}
	
	/**
	 * ���� ����� �Խù�����, �����ϱ� ������
	 * ����â���� �Ѿ�� ��.
	 */
	@RequestMapping("BuyingPage.market")
	public String marketBuyingPage() {
		
		System.out.println("�۵�");
		
		return "marketBuyingPage";
	}
	
	/**
	 * ���� ������������ �Ѿ�� �ϴ� ���
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage() {
		
		System.out.println("�۵�");
		
		return "marketMainPage";
	}
	
}
