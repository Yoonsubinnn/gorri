package com.kh.gorri.market.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 이 클래스는, 구매 내역(PAY)를 위한 클래스입니다.
 * 
 * @author lee94
 *
 */



@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Review {
	/**
	 * erd와 순서 일치합니다.
	 * 순서대로 구매번호, 구매일자, 수량, 결제금액, 상품번호, 구매자아이디
	 */
	private int paymentNo;
	private Date paymentDate;
	private int Quantity;
	private int paymentAmount;
	private int productNo;
	private String buyerId;
}