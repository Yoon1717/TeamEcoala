package com.ecoala.ele.cboPoint.vo;

public class cboPointVO {
	private String userId; 
	private String point;
	private String productCode;
	private String productId;
	private String proudctPrice;
	private String dt;
	private String productImg;
	private String totalPoints;
	private String memId;
	
	public cboPointVO() {
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProudctPrice() {
		return proudctPrice;
	}
	public void setProudctPrice(String proudctPrice) {
		this.proudctPrice = proudctPrice;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getTotalPoints() {
		return totalPoints;
	}
	public void setTotalPoints(String totalPoints) {
		this.totalPoints = totalPoints;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "cboPointVO [userId=" + userId + ", point=" + point + ", productCode=" + productCode + ", productId="
				+ productId + ", proudctPrice=" + proudctPrice + ", dt=" + dt + ", productImg=" + productImg
				+ ", totalPoints=" + totalPoints + ", memId=" + memId + "]";
	}
	public cboPointVO(String userId, String point, String productCode, String productId, String proudctPrice, String dt,
			String productImg, String totalPoints, String memId) {
		super();
		this.userId = userId;
		this.point = point;
		this.productCode = productCode;
		this.productId = productId;
		this.proudctPrice = proudctPrice;
		this.dt = dt;
		this.productImg = productImg;
		this.totalPoints = totalPoints;
		this.memId = memId;
	}
	
	
	

}

