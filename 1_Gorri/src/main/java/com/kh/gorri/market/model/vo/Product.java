package com.kh.gorri.market.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/**
 * 마켓 테이블 위한 클래스
 * @author lee94
 *
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Product {
	
	private int productNo;
	private String productName;
	private String productContent;
	private int productPrice;
	private Date productPostDate;
	private Date productModifyDate;
	private String productCategory;
	private String productSellerId;
	
	
	
	
	
	
	
}
