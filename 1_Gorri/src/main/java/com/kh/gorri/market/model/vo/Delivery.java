package com.kh.gorri.market.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Delivery {
	
	private int deliveryNo;
	private Date deliveryDate;
	private String deliveryStatus;
	private int paymentNo;
}