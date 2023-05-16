package com.kh.gorri.group.model.vo;

import java.sql.Date;

public class GroupBoardReply {
	int replyNo;
	String replyContent;
	String replyWriter;
	Date replyCreateDate;
	Date replyModifyDate;
	int boardNo;
	
	
	public GroupBoardReply() {};
	
	public GroupBoardReply(int replyNo, String replyContent, String replyWriter, Date replyCreateDate,
			Date replyModifyDate, int boardNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.boardNo = boardNo;
	}
	
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Date getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "GroupBoardReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyWriter=" + replyWriter
				+ ", replyCreateDate=" + replyCreateDate + ", replyModifyDate=" + replyModifyDate + ", boardNo="
				+ boardNo + "]";
	}
	
	
}
