package com.kh.gorri.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.ProductForPayment;


@RestController						//rest api �ޱ����ؼ� ��Ʈ�ѷ� �ۼ���.
@RequestMapping("/BuyApprove")
public class MarketPaymentController {
	
	@Autowired
	private MarketService mService;
	
	
	//���� ������ �ޱ� ���� ��Ʈ�ѷ�
	
	
		@PostMapping(value = "/BuyApprove", consumes = "application/json")
		public ResponseEntity<String> processPayment(@RequestBody ProductForPayment p) {	//�̷��� �ص� �������� ������??? �����ؾ��ϴ°žƴ�? ajax����?
			// ���� ó�� ����
	        // rsp.imp_uid, rsp.merchant_uid �� payment ��ü���� ������ �� �ֽ��ϴ�.
			System.out.println("���� �����Դϴ�");
			
//			mService.buyProduct();
			
			
	        
	        // ���� ó���� �����ϸ� ������ ���� ��ü�� ��ȯ�մϴ�.
	        // �� �κ��� ���� ����Ͻ� ������ ���� �޶��� �� �ֽ��ϴ�.
	        return ResponseEntity.ok().build();					//�������ڰŵ�.
	        
		}
		
		
		//���� ���� ��Ʈ�ѷ� ��

}
