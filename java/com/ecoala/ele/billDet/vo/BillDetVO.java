package com.ecoala.ele.billDet.vo;


/**
 * Class Name : BillDetVO Author : YoonGaYoung Created Date: 2023. 12. 5.
 * Version: 1.0 Purpose: Description:
 */
public class BillDetVO  {

	private String memId; /* 회원 고유 번호 */
	private String billMonth; /* 요금 발생 월정보 */
	private int crTotalEle; /* 당월 총 전력량 */
	private int crEleBill; /* 당월 요금 */
	private int billDiffLsYear; /* 작년 대비 요금의 증가/감소 수치 */
	private int eleDiffRatio; /* 작년 대비 전력량의 증가/감소 비율 */
	private String division; /* user|other 구분 */
	private int avgEleBill; /* 요금 평균 */
	private int avgEle; /* 전력량 평균 */
	private String selNm; /*선택한 조건 한글 설명*/
	private String searchOption;
	
	public BillDetVO() {
		super();
	}

	public BillDetVO(String memId, String billMonth, int crTotalEle, int crEleBill, int billDiffLsYear,
			int eleDiffRatio, String division, int avgEleBill, int avgEle, String selNm, String searchOption) {
		super();
		this.memId = memId;
		this.billMonth = billMonth;
		this.crTotalEle = crTotalEle;
		this.crEleBill = crEleBill;
		this.billDiffLsYear = billDiffLsYear;
		this.eleDiffRatio = eleDiffRatio;
		this.division = division;
		this.avgEleBill = avgEleBill;
		this.avgEle = avgEle;
		this.selNm = selNm;
		this.searchOption = searchOption;
	}

	@Override
	public String toString() {
		return "BillDetVO [memId=" + memId + ", billMonth=" + billMonth + ", crTotalEle=" + crTotalEle + ", crEleBill="
				+ crEleBill + ", billDiffLsYear=" + billDiffLsYear + ", eleDiffRatio=" + eleDiffRatio + ", division="
				+ division + ", avgEleBill=" + avgEleBill + ", avgEle=" + avgEle + ", selNm=" + selNm
				+ ", searchOption=" + searchOption + "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBillMonth() {
		return billMonth;
	}

	public void setBillMonth(String billMonth) {
		this.billMonth = billMonth;
	}

	public int getCrTotalEle() {
		return crTotalEle;
	}

	public void setCrTotalEle(int crTotalEle) {
		this.crTotalEle = crTotalEle;
	}

	public int getCrEleBill() {
		return crEleBill;
	}

	public void setCrEleBill(int crEleBill) {
		this.crEleBill = crEleBill;
	}

	public int getBillDiffLsYear() {
		return billDiffLsYear;
	}

	public void setBillDiffLsYear(int billDiffLsYear) {
		this.billDiffLsYear = billDiffLsYear;
	}

	public int getEleDiffRatio() {
		return eleDiffRatio;
	}

	public void setEleDiffRatio(int eleDiffRatio) {
		this.eleDiffRatio = eleDiffRatio;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public int getAvgEleBill() {
		return avgEleBill;
	}

	public void setAvgEleBill(int avgEleBill) {
		this.avgEleBill = avgEleBill;
	}

	public int getAvgEle() {
		return avgEle;
	}

	public void setAvgEle(int avgEle) {
		this.avgEle = avgEle;
	}

	public String getSelNm() {
		return selNm;
	}

	public void setSelNm(String selNm) {
		this.selNm = selNm;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

}
