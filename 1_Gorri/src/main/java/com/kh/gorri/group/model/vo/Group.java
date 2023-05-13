package com.kh.gorri.group.model.vo;

public class Group {
	private int membershipNo;
	private String membershipName;
	private String membershipContent;
	private int capacity;
	private String membership_status;
	private String hostPhone;
	private String category;
	
	public Group() {}
	public Group(int membershipNo, String membershipName, String membershipContent, int capacity,
			String membership_status, String hostPhone, String category) {
		super();
		this.membershipNo = membershipNo;
		this.membershipName = membershipName;
		this.membershipContent = membershipContent;
		this.capacity = capacity;
		this.membership_status = membership_status;
		this.hostPhone = hostPhone;
		this.category = category;
	}
	public int getMembershipNo() {
		return membershipNo;
	}
	public void setMembershipNo(int membershipNo) {
		this.membershipNo = membershipNo;
	}
	public String getMembershipName() {
		return membershipName;
	}
	public void setMembershipName(String membershipName) {
		this.membershipName = membershipName;
	}
	public String getMembershipContent() {
		return membershipContent;
	}
	public void setMembershipContent(String membershipContent) {
		this.membershipContent = membershipContent;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getMembership_status() {
		return membership_status;
	}
	public void setMembership_status(String membership_status) {
		this.membership_status = membership_status;
	}
	public String getHostPhone() {
		return hostPhone;
	}
	public void setHostPhone(String hostPhone) {
		this.hostPhone = hostPhone;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Group [membershipNo=" + membershipNo + ", membershipName=" + membershipName + ", membershipContent="
				+ membershipContent + ", capacity=" + capacity + ", membership_status=" + membership_status
				+ ", hostPhone=" + hostPhone + ", category=" + category + "]";
	}
	
	
	
}