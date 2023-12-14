package com.ecoala.ele.eleInquiry.vo;

public class EleInquiryVO {
	private String memId;			/** 회원번호*/
	private String dateYear;		/** 1년*/
	private String eleYear;			/** 1년 전력량*/
	private String dateMonth;		/** 1개월*/
	private String eleMonth;		/** 1개월 전력량*/
	private String dateWeek;		/** 1주일*/
	private String eleWeek;			/** 1주일 전력량*/
	
	private String	userCom;			/** 사용자 컴퓨터*/
	private String	userAircon;			/** 사용자 에어컨*/
	private String	userTv;				/** 사용자 tv*/
	private String	userHeat;			/** 사용자 난방기*/
	private String	userStove;			/** 사용자 전기난로*/
	private String	userBlanket;		/** 사용자 전기장판*/
	private String	userAfry;			/** 사용자 에어프라이어*/
	private String	userAhs;			/** 사용자 온냉방기*/
	private String	userOther;			/** 사용자 생활가전*/
	
	private String	allCom;				/** 전체사용자 컴퓨터*/
	private String	allAircon;			/** 전체사용자 에어컨*/
	private String	allTv;				/** 전체사용자 tv*/
	private String	allHeat;			/** 전체사용자 난방기*/
	private String	allStove;			/** 전체사용자 전기난로*/
	private String	allBlanket;			/** 전체사용자 전기난로*/
	private String	allAfry;			/** 전체사용자 에어프라이어*/
	private String	allAhs;				/** 전체사용자 온냉방기*/
	private String	allOther;			/** 전체사용자 생활가전*/
	
	
	
	public EleInquiryVO(){
	}



	@Override
	public String toString() {
		return "EleInquiryVO [memId=" + memId + ", dateYear=" + dateYear + ", eleYear=" + eleYear + ", dateMonth="
				+ dateMonth + ", eleMonth=" + eleMonth + ", dateWeek=" + dateWeek + ", eleWeek=" + eleWeek
				+ ", userCom=" + userCom + ", userAircon=" + userAircon + ", userTv=" + userTv + ", userHeat="
				+ userHeat + ", userStove=" + userStove + ", userBlanket=" + userBlanket + ", userAfry=" + userAfry
				+ ", userAhs=" + userAhs + ", userOther=" + userOther + ", allCom=" + allCom + ", allAircon="
				+ allAircon + ", allTv=" + allTv + ", allHeat=" + allHeat + ", allStove=" + allStove + ", allBlanket="
				+ allBlanket + ", allAfry=" + allAfry + ", allAhs=" + allAhs + ", allOther=" + allOther + "]";
	}



	public EleInquiryVO(String memId, String dateYear, String eleYear, String dateMonth, String eleMonth,
			String dateWeek, String eleWeek, String userCom, String userAircon, String userTv, String userHeat,
			String userStove, String userBlanket, String userAfry, String userAhs, String userOther, String allCom,
			String allAircon, String allTv, String allHeat, String allStove, String allBlanket, String allAfry,
			String allAhs, String allOther) {
		super();
		this.memId = memId;
		this.dateYear = dateYear;
		this.eleYear = eleYear;
		this.dateMonth = dateMonth;
		this.eleMonth = eleMonth;
		this.dateWeek = dateWeek;
		this.eleWeek = eleWeek;
		this.userCom = userCom;
		this.userAircon = userAircon;
		this.userTv = userTv;
		this.userHeat = userHeat;
		this.userStove = userStove;
		this.userBlanket = userBlanket;
		this.userAfry = userAfry;
		this.userAhs = userAhs;
		this.userOther = userOther;
		this.allCom = allCom;
		this.allAircon = allAircon;
		this.allTv = allTv;
		this.allHeat = allHeat;
		this.allStove = allStove;
		this.allBlanket = allBlanket;
		this.allAfry = allAfry;
		this.allAhs = allAhs;
		this.allOther = allOther;
	}



	public String getMemId() {
		return memId;
	}



	public void setMemId(String memId) {
		this.memId = memId;
	}



	public String getDateYear() {
		return dateYear;
	}



	public void setDateYear(String dateYear) {
		this.dateYear = dateYear;
	}



	public String getEleYear() {
		return eleYear;
	}



	public void setEleYear(String eleYear) {
		this.eleYear = eleYear;
	}



	public String getDateMonth() {
		return dateMonth;
	}



	public void setDateMonth(String dateMonth) {
		this.dateMonth = dateMonth;
	}



	public String getEleMonth() {
		return eleMonth;
	}



	public void setEleMonth(String eleMonth) {
		this.eleMonth = eleMonth;
	}



	public String getDateWeek() {
		return dateWeek;
	}



	public void setDateWeek(String dateWeek) {
		this.dateWeek = dateWeek;
	}



	public String getEleWeek() {
		return eleWeek;
	}



	public void setEleWeek(String eleWeek) {
		this.eleWeek = eleWeek;
	}



	public String getUserCom() {
		return userCom;
	}



	public void setUserCom(String userCom) {
		this.userCom = userCom;
	}



	public String getUserAircon() {
		return userAircon;
	}



	public void setUserAircon(String userAircon) {
		this.userAircon = userAircon;
	}



	public String getUserTv() {
		return userTv;
	}



	public void setUserTv(String userTv) {
		this.userTv = userTv;
	}



	public String getUserHeat() {
		return userHeat;
	}



	public void setUserHeat(String userHeat) {
		this.userHeat = userHeat;
	}



	public String getUserStove() {
		return userStove;
	}



	public void setUserStove(String userStove) {
		this.userStove = userStove;
	}



	public String getUserBlanket() {
		return userBlanket;
	}



	public void setUserBlanket(String userBlanket) {
		this.userBlanket = userBlanket;
	}



	public String getUserAfry() {
		return userAfry;
	}



	public void setUserAfry(String userAfry) {
		this.userAfry = userAfry;
	}



	public String getUserAhs() {
		return userAhs;
	}



	public void setUserAhs(String userAhs) {
		this.userAhs = userAhs;
	}



	public String getUserOther() {
		return userOther;
	}



	public void setUserOther(String userOther) {
		this.userOther = userOther;
	}



	public String getAllCom() {
		return allCom;
	}



	public void setAllCom(String allCom) {
		this.allCom = allCom;
	}



	public String getAllAircon() {
		return allAircon;
	}



	public void setAllAircon(String allAircon) {
		this.allAircon = allAircon;
	}



	public String getAllTv() {
		return allTv;
	}



	public void setAllTv(String allTv) {
		this.allTv = allTv;
	}



	public String getAllHeat() {
		return allHeat;
	}



	public void setAllHeat(String allHeat) {
		this.allHeat = allHeat;
	}



	public String getAllStove() {
		return allStove;
	}



	public void setAllStove(String allStove) {
		this.allStove = allStove;
	}



	public String getAllBlanket() {
		return allBlanket;
	}



	public void setAllBlanket(String allBlanket) {
		this.allBlanket = allBlanket;
	}



	public String getAllAfry() {
		return allAfry;
	}



	public void setAllAfry(String allAfry) {
		this.allAfry = allAfry;
	}



	public String getAllAhs() {
		return allAhs;
	}



	public void setAllAhs(String allAhs) {
		this.allAhs = allAhs;
	}



	public String getAllOther() {
		return allOther;
	}



	public void setAllOther(String allOther) {
		this.allOther = allOther;
	}
	
	
	
	
	
	
}