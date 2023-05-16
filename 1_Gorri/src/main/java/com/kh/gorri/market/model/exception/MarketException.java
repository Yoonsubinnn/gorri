package com.kh.gorri.market.model.exception;
	/**
	 * 마켓에서의 예외처리용 클래스
	 * 
	 * @author lee94
	 *
	 */
public class MarketException extends RuntimeException{

	public MarketException() {}
	public MarketException(String msg) {
		super(msg);
	}
	
}
