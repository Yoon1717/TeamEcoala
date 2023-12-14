package com.ecoala.ele.main.vo;

/**
 * Class Name  : EleUsageVO
 * Author      : ChoiMinHyeock
 * Created Date: 2023. 11. 28.
 * Version: 1.0
 * Purpose:   하루전력량
 * Description: 
 */
public class EleUsageVO {
	private String memId; // 회원아이디
	private String useDt; // 날짜
	private String totalEle; // 모든가전전력량
	
	
	
	public EleUsageVO() {}
	
	
	public EleUsageVO(String memId, String useDt, String totalEle) {
		super();
		this.memId = memId;
		this.useDt = useDt;
		this.totalEle = totalEle;
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


	public String gettotalEle() {
		return totalEle;
	}


	public void settotalEle(String totalEle) {
		this.totalEle = totalEle;
	}


	@Override
	public String toString() {
		return "EleUsageVO [memId=" + memId + ", useDt=" + useDt + ", totalEle=" + totalEle + "]";
	}
	
}
