package com.ecoala.ele.main.vo;

/**
 * Class Name  : BillVO
 * Author      : ChoiMinHyeock
 * Created Date: 2023. 12. 8.
 * Version: 1.0
 * Purpose:   
 * Description: 이번달요금, 이전달요금, 전년동월요금 
 */
public class BillVO {
 private String memId;
 private String currentBill;
 private String preMonthBill;
 private String lastYearBill;
 
 public BillVO() {}

public BillVO(String memId, String currentBill, String preMonthBill, String lastYearBill) {
	super();
	this.memId = memId;
	this.currentBill = currentBill;
	this.preMonthBill = preMonthBill;
	this.lastYearBill = lastYearBill;
}

public String getMemId() {
	return memId;
}

public void setMemId(String memId) {
	this.memId = memId;
}

public String getCurrentBill() {
	return currentBill;
}

public void setCurrentBill(String currentBill) {
	this.currentBill = currentBill;
}

public String getPreMonthBill() {
	return preMonthBill;
}

public void setPreMonthBill(String preMonthBill) {
	this.preMonthBill = preMonthBill;
}

public String getLastYearBill() {
	return lastYearBill;
}

public void setLastYearBill(String lastYearBill) {
	this.lastYearBill = lastYearBill;
}

@Override
public String toString() {
	return "BillVO [memId=" + memId + ", currentBill=" + currentBill + ", preMonthBill=" + preMonthBill
			+ ", lastYearBill=" + lastYearBill + "]";
}

 
}
