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
public class Inquire {
	
	private int inquireNo;
	private String inquireContent;
	private Date inquirePostDate;
	private String buyerId;
	private int productNo;
}
