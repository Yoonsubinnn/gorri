package com.kh.gorri.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Pay;

@Controller // rest api 받기위해서 컨트롤러 작성함.
public class MarketPaymentController {

	@Autowired
	private MarketService mService;

	// 마켓 결제를 받기 위한 컨트롤러

	@PostMapping("/BuyingEnd.market")
	@ResponseBody
	public String processPayment(@RequestBody Pay pay
			) { // 이렇게 해도 문제없이 가능함??? 선언해야하는거아님?
																						// ajax에서?
		// 결제 처리 로직
		// rsp.imp_uid, rsp.merchant_uid 는 payment 객체에서 가져올 수 있습니다.
		System.out.println("결제 성공입니다");
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
			System.out.println("결제종료");
		return "marketBuyingEnd";
	}
	
	// 마켓 결제 컨트롤러 끝

}
