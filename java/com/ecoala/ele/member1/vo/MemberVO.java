package com.ecoala.ele.member1.vo;

/**
 * Class Name  : MemberVO
 * Author      : LeeGyuHwan
 * Created Date: 2023. 11. 20.
 * Version: 1.0
 * Purpose:   
 * Description: 회원 정보 
 */




public class MemberVO {
	
	private String memId;     /** 회원 아이디 */
	private String memNo;     /** 회원 가구원 수 */
	private String jobType;   /** 회원 직업 */
	private String houseType; /** 회원 주거형태 */ 
	private String houseArea; /** 회원 주거면적 */
	private String region;    /** 회원 지역 */
	
	
	public MemberVO() {
		
	}
	
	public MemberVO(String memId, String memNo, String jobType, String houseType, String houseArea, String region) {
		this.memId = memId;
		this.memNo = memNo;
		this.jobType = jobType;
		this.houseType = houseType;
		this.houseArea = houseArea;
		this.region = region;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memNo=" + memNo + ", jobType=" + jobType + ", houseType=" + houseType
				+ ", houseArea=" + houseArea + ", region=" + region + "]";
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
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
	
}
