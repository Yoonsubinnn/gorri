package com.kh.gorri.market.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * �� Ŭ������, ���� ����(PAY)�� ���� Ŭ�����Դϴ�.
 * 
 * @author lee94
 *
 */

public class Pay {
	private String originalId;		//����������ȣ
	private int paymentNo;		//�ֹ���ȣ
	private int productNo;		//��ǰ��ȣ
	private String buyerId;		//�����ھ��̵�
	private String buyerName;	//�������̸�
	private String buyerPhone;	//��������
	private String address;		//�������ּ�
	private int amount;			//����
	private int paymentAmount;	//�� �ݾ�
	private String require;		//�䱸����
	private Date payDate;		//�Ǹ���
	public Pay(String originalId, int paymentNo, int productNo, String buyerId, String buyerName, String buyerPhone,
			String address, int amount, int paymentAmount, String require, Date payDate) {
		super();
		this.originalId = originalId;
		this.paymentNo = paymentNo;
		this.productNo = productNo;
		this.buyerId = buyerId;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.address = address;
		this.amount = amount;
		this.paymentAmount = paymentAmount;
		this.require = require;
		this.payDate = payDate;
	}
	public Pay() {
		super();
	}
	@Override
	public String toString() {
		return "Pay [originalId=" + originalId + ", paymentNo=" + paymentNo + ", productNo=" + productNo + ", buyerId="
				+ buyerId + ", buyerName=" + buyerName + ", buyerPhone=" + buyerPhone + ", address=" + address
				+ ", amount=" + amount + ", paymentAmount=" + paymentAmount + ", require=" + require + ", payDate="
				+ payDate + "]";
	}
	public String getOriginalId() {
		return originalId;
	}
	public void setOriginalId(String originalId) {
		this.originalId = originalId;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public String getRequire() {
		return require;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
	
	
	
	
}
