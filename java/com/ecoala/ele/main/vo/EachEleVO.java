package com.ecoala.ele.main.vo;

/**
 * Class Name  : EachEleVO
 * Author      : ChoiMinHyeock
 * Created Date: 2023. 11. 28.
 * Version: 1.0
 * Purpose: 가전별 전력량 VO 
 * Description: 
 */
public class EachEleVO {
	private String memId; // 회원아이디
	private String useDt; // 날짜
	private String dt; // 컴퓨터
	private String aircon;   // 에어컨
	private String tv;       // TV
	private String heat;     // 난방기
	private String stove;	  // 전기난로
	private String blanket;  // 전기장판
	private String afry;     // 에어프라이어
	private String ahs;	  // 온냉방기
	private String otherAppliances; // 기타가전
	
	
	public EachEleVO() {}
					
		
	public EachEleVO(String memId,String useDt, String dt, String aircon, String tv, String heat, String stove, String blanket,
			String afry, String ahs, String otherAppliances) {
		super();
		this.memId = memId;
		this.useDt = useDt;
		this.dt = dt;
		this.aircon = aircon;
		this.tv = tv;
		this.heat = heat;
		this.stove = stove;
		this.blanket = blanket;
		this.afry = afry;
		this.ahs = ahs;
		this.otherAppliances = otherAppliances;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getUseDt() {
		return useDt;
	}
	public void setUseDt(String useDt) {
		this.useDt = useDt;
	}
	public String getdt() {
		return dt;
	}
	public void setdt(String dt) {
		this.dt = dt;
	}
	public String getAircon() {
		return aircon;
	}
	public void setAircon(String aircon) {
		this.aircon = aircon;
	}
	public String getTv() {
		return tv;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	public String getHeat() {
		return heat;
	}
	public void setHeat(String heat) {
		this.heat = heat;
	}
	public String getStove() {
		return stove;
	}
	public void setStove(String stove) {
		this.stove = stove;
	}
	public String getBlanket() {
		return blanket;
	}
	public void setBlanket(String blanket) {
		this.blanket = blanket;
	}
	public String getAfry() {
		return afry;
	}
	public void setAfry(String afry) {
		this.afry = afry;
	}
	public String getAhs() {
		return ahs;
	}
	public void setAhs(String ahs) {
		this.ahs = ahs;
	}
	public String getOtherAppliances() {
		return otherAppliances;
	}
	public void setOtherAppliances(String otherAppliances) {
		this.otherAppliances = otherAppliances;
	}
	
	
	@Override
	public String toString() {
		return "EachEleVO [memId=" + memId + ", useDt=" + useDt + ", dt=" + dt + ", aircon=" + aircon
				+ ", tv=" + tv + ", heat=" + heat + ", stove=" + stove + ", blanket=" + blanket + ", afry=" + afry
				+ ", ahs=" + ahs + ", otherAppliances=" + otherAppliances + "]";
	}
	
}
