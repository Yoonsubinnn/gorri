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
public class InquireReply {
	private int replyNo;
	private String replyContent;
	private String replyWriter;
	private Date replyCreateDate;
	private Date replyModifyDate;
	private int inquireNo;

}

