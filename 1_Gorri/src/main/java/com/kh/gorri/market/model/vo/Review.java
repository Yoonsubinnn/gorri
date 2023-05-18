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



@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Review {
	/**
	 * erd�� ���� ��ġ�մϴ�.
	 * ������� ���Ź�ȣ, ��������, ����, �����ݾ�, ��ǰ��ȣ, �����ھ��̵�
	 */
	private int paymentNo;
	private Date paymentDate;
	private int Quantity;
	private int paymentAmount;
	private int productNo;
	private String buyerId;
}