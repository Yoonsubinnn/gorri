package com.kh.gorri.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Pay;

@Controller // rest api �ޱ����ؼ� ��Ʈ�ѷ� �ۼ���.
public class MarketPaymentController {

	@Autowired
	private MarketService mService;

	// ���� ������ �ޱ� ���� ��Ʈ�ѷ�

	@PostMapping("/BuyingEnd.market")
	@ResponseBody
	public String processPayment(@RequestBody Pay pay
			) { // �̷��� �ص� �������� ������??? �����ؾ��ϴ°žƴ�?
																						// ajax����?
		// ���� ó�� ����
		// rsp.imp_uid, rsp.merchant_uid �� payment ��ü���� ������ �� �ֽ��ϴ�.
		System.out.println("���� �����Դϴ�");
		System.out.println(pay);
		
		int result = mService.purchase(pay);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
		
	}
	
	
	
	
	@RequestMapping("marketBuyingEnd.market")
	public String buyEndPage() {
			System.out.println("��������");
		return "marketBuyingEnd";
	}
	
	// ���� ���� ��Ʈ�ѷ� ��

}
