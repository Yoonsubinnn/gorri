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
public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private Date reviewPostDate;
	private String buyerId;
	private int productNo;
}
