package com.kh.da4jo.dto;

import java.sql.Date;

public class MemberDto {
	
	private String memberId;
	private String memberPw;
	private String memberNameKor;
	private String memberNameEng;
	private String memberEmail;
	private String memberContact1;
	private String memberContact2;
	private String memberBirth;
	private String  memberClearanceId;
	private String memberZipcode;
	private String memberAddress1;
	private String memberAddress2;
	private String memberLevel;
	private Date  memberJoinDate;
	private Date memberLoginDate;
	private int memberCredit;
	private int memberPoint;
	private String memberBlock;

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNameKor() {
		return memberNameKor;
	}
	public void setMemberNameKor(String memberNameKor) {
		this.memberNameKor = memberNameKor;
	}
	public String getMemberNameEng() {
		return memberNameEng;
	}
	public void setMemberNameEng(String memberNameEng) {
		this.memberNameEng = memberNameEng;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberContact1() {
		return memberContact1;
	}
	public void setMemberContact1(String memberContact1) {
		this.memberContact1 = memberContact1;
	}
	public String getMemberContact2() {
		return memberContact2;
	}
	public void setMemberContact2(String memberContact2) {
		this.memberContact2 = memberContact2;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberClearanceId() {
		return memberClearanceId;
	}
	public void setMemberClearanceId(String memberClearanceId) {
		this.memberClearanceId = memberClearanceId;
	}
	public String getMemberZipcode() {
		return memberZipcode;
	}
	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}
	public String getMemberAddress1() {
		return memberAddress1;
	}
	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}
	public String getMemberAddress2() {
		return memberAddress2;
	}
	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	public Date getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public Date getMemberLoginDate() {
		return memberLoginDate;
	}
	public void setMemberLoginDate(Date memberLoginDate) {
		this.memberLoginDate = memberLoginDate;
	}
	public int getMemberCredit() {
		return memberCredit;
	}
	public void setMemberCredit(int memberCredit) {
		this.memberCredit = memberCredit;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberBlock() {
		return memberBlock;
	}
	public void setMemberBlock(String memberBlock) {
		this.memberBlock = memberBlock;
	}
	public MemberDto() {
		super();
	}
	@Override
	public String toString() {
		return "MemberDto [memberId=" + memberId + ", memberNameKor=" + memberNameKor + ", memberNameEng="
				+ memberNameEng + ", memberEmail=" + memberEmail + ", memberContact1=" + memberContact1
				+ ", memberContact2=" + memberContact2 + ", memberBirth=" + memberBirth + ", memberClearanceId="
				+ memberClearanceId + ", memberZipcode=" + memberZipcode + ", memberAddress1=" + memberAddress1
				+ ", memberAddress2=" + memberAddress2 + ", memberLevel=" + memberLevel + ", memberJoinDate="
				+ memberJoinDate + ", memberLoginDate=" + memberLoginDate + ", memberCredit=" + memberCredit
				+ ", memberPoint=" + memberPoint + ", memberBlock=" + memberBlock + "]";
	}
	
	
	
}
