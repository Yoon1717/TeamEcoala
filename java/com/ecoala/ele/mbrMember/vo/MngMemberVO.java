package com.ecoala.ele.mbrMember.vo;

/**
 * Class Name  : MngMemberVO
 * Author      : LeeGyuHwan
 * Created Date: 2023. 11. 24.
 * Version: 1.0
 * Purpose:   
 * Description: 회원가입 VO member, mem_info 두개 동시에 인서트 하기
 */
public class MngMemberVO {

	private String memId;     /** 회원 번호 */ 
	private String userId;	  /** 회원 아이디*/ 
	private String userPw;	  /** 회원 비번*/ 
	private String userNm;	  /** 회원 이름*/ 
	private String memNo;	  /** 회원 가구원 수*/ 
	private String jobType;	  /** 회원 직업형태*/	
	private String houseType; /** 회원 주거형태 */ 
	private String houseArea; /** 회원 주거면적 */
	private String region;    /** 회원 지역 */
	private String authority; /** 관리자권한여부 */
	private String userDt;	  /** 유저생성날짜 */
	private String delYn;	  /** 유저삭제여부 */
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public String getHouseArea() {
		return houseArea;
	}
	public void setHouseArea(String houseArea) {
		this.houseArea = houseArea;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getUserDt() {
		return userDt;
	}
	public void setUserDt(String userDt) {
		this.userDt = userDt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	@Override
	public String toString() {
		return "MngMemberVO [memId=" + memId + ", userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm
				+ ", memNo=" + memNo + ", jobType=" + jobType + ", houseType=" + houseType + ", houseArea=" + houseArea
				+ ", region=" + region + ", authority=" + authority + ", userDt=" + userDt + ", delYn=" + delYn + "]";
	}
	public MngMemberVO(String memId, String userId, String userPw, String userNm, String memNo, String jobType,
			String houseType, String houseArea, String region, String authority, String userDt, String delYn) {
		this.memId = memId;
		this.userId = userId;
		this.userPw = userPw;
		this.userNm = userNm;
		this.memNo = memNo;
		this.jobType = jobType;
		this.houseType = houseType;
		this.houseArea = houseArea;
		this.region = region;
		this.authority = authority;
		this.userDt = userDt;
		this.delYn = delYn;
	}
	public MngMemberVO() {
		
	}
	
	
	
}
