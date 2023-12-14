package com.ecoala.ele.billPlan.vo;

/**
 * Class Name  : BillPlanVO
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 4.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
public class BillPlanVO {

	private String memId;     	/** 회원 번호 */ 
	private String houseType; 	/** 회원 주거형태 */ 
	private String billMonth;	/** 월 정보*/
	private int monthTotal;		/** 월별 전력량 총합 */
	
	@Override
	public String toString() {
		return "BillPlanVO [memId=" + memId + ", houseType=" + houseType + ", billMonth=" + billMonth + ", monthTotal="
				+ monthTotal + "]";
	}

	public BillPlanVO() {
		super();
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getBillMonth() {
		return billMonth;
	}

	public void setBillMonth(String billMonth) {
		this.billMonth = billMonth;
	}

	public int getMonthTotal() {
		return monthTotal;
	}

	public void setMonthTotal(int monthTotal) {
		this.monthTotal = monthTotal;
	}
	
	
	
	
	
}
