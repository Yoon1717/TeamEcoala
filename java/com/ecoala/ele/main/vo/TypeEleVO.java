package com.ecoala.ele.main.vo;

/**
 * Class Name  : typeEleVO
 * Author      : ChoiMinHyeock
 * Created Date: 2023. 11. 29.
 * Version: 1.0
 * Purpose:   
 * Description: 유형별  max, min, 평균 전력량
 */
public class TypeEleVO {
private String memId;
private String averageValue;
private String maxValue;
private String minValue;
private String memNo;
private String houseType;
private String houseArea;


public TypeEleVO() {}


public String getMemId() {
	return memId;
}





public void setMemId(String memId) {
	this.memId = memId;
}





public String getAverageValue() {
	return averageValue;
}





public void setAverageValue(String averageValue) {
	this.averageValue = averageValue;
}





public String getMaxValue() {
	return maxValue;
}





public void setMaxValue(String maxValue) {
	this.maxValue = maxValue;
}





public String getMinValue() {
	return minValue;
}





public void setMinValue(String minValue) {
	this.minValue = minValue;
}





public String getMemNo() {
	return memNo;
}





public void setMemNo(String memNo) {
	this.memNo = memNo;
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





public TypeEleVO(String memId, String averageValue, String maxValue, String minValue, String memNo, String houseType,
		String houseArea) {
	super();
	this.memId = memId;
	this.averageValue = averageValue;
	this.maxValue = maxValue;
	this.minValue = minValue;
	this.memNo = memNo;
	this.houseType = houseType;
	this.houseArea = houseArea;
}


@Override
public String toString() {
	return "TypeEleVO [memId=" + memId + ", averageValue=" + averageValue + ", maxValue=" + maxValue + ", minValue="
			+ minValue + ", memNo=" + memNo + ", houseType=" + houseType + ", houseArea=" + houseArea + "]";
}









}
