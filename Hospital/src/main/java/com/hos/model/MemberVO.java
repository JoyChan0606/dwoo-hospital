package com.hos.model;

public class MemberVO {
	private int memberNum;
	private String memberId;
	private String memberName;
	private String memberPw;
	private String memberIDNum;
	private String memberPhone;
	private String memberEmail;
	private int gender;
	private int adminCk;
	
	private CheckVO cvo;
	
	public CheckVO getCvo() {
		return cvo;
	}
	public void setCvo(CheckVO cvo) {
		this.cvo = cvo;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberIDNum() {
		return memberIDNum;
	}
	public void setMemberIDNum(String memberIDNum) {
		this.memberIDNum = memberIDNum;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberPw=" + memberPw + ", memberIDNum=" + memberIDNum + ", memberPhone=" + memberPhone
				+ ", memberEmail=" + memberEmail + ", gender=" + gender + ", adminCk=" + adminCk + ", cvo=" + cvo + "]";
	}
	
}
