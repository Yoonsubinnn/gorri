package com.kh.gorri.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.ProductForPayment;


@RestController						//rest api 받기위해서 컨트롤러 작성함.
@RequestMapping("/BuyApprove")
public class MarketPaymentController {
	
	@Autowired
	private MarketService mService;
	
	
	//마켓 결제를 받기 위한 컨트롤러
	
	
		@PostMapping(value = "/BuyApprove", consumes = "application/json")
		public ResponseEntity<String> processPayment(@RequestBody ProductForPayment p) {	//이렇게 해도 문제없이 가능함??? 선언해야하는거아님? ajax에서?
			// 결제 처리 로직
	        // rsp.imp_uid, rsp.merchant_uid 는 payment 객체에서 가져올 수 있습니다.
			System.out.println("결제 성공입니다");
			
//			mService.buyProduct();
			
			
	        
	        // 결제 처리가 성공하면 적절한 응답 객체를 반환합니다.
	        // 이 부분은 실제 비즈니스 로직에 따라 달라질 수 있습니다.
	        return ResponseEntity.ok().build();					//뭔지몰겠거든.
	        
		}
		
		
		//마켓 결제 컨트롤러 끝

}
