package com.ecoala.ele.eleAnalysis.vo;

public class EleAnalysisVO {

	private String memId;			/** 회원번호*/
	
	private String selectMonth;		/** 개월 선택*/
	
	
	private String eleNight;		/** 심야전력량 */
	private String eleDawn;			/** 샤벽전력량 */
	private String elePm;			/** 오후전력량 */
	private String eleAm;			/** 오전전력량 */
	private String eleDay;			/** 하루전력량 */
	
	private String userEleDay;		/** 사용자 하루 전력량*/
	private String otherEleDay;		/** 타 사용자 하루 전력량*/
	
	private String weatherDate;		/** 날씨 날짜 */
	private String weatherTEM;		/** 날씨 온도 */
	private String weatherPRCE;		/** 날씨 날짜 */
	private String weatherHUM;		/** 날씨 날짜 */
	
	
	public EleAnalysisVO() {
		
	}


	@Override
	public String toString() {
		return "EleAnalysisVO [memId=" + memId + ", selectMonth=" + selectMonth + ", eleNight=" + eleNight
				+ ", eleDawn=" + eleDawn + ", elePm=" + elePm + ", eleAm=" + eleAm + ", eleDay=" + eleDay
				+ ", userEleDay=" + userEleDay + ", otherEleDay=" + otherEleDay + ", weatherDate=" + weatherDate
				+ ", weatherTEM=" + weatherTEM + ", weatherPRCE=" + weatherPRCE + ", weatherHUM=" + weatherHUM + "]";
	}


	public EleAnalysisVO(String memId, String selectMonth, String eleNight, String eleDawn, String elePm, String eleAm,
			String eleDay, String userEleDay, String otherEleDay, String weatherDate, String weatherTEM,
			String weatherPRCE, String weatherHUM) {
		super();
		this.memId = memId;
		this.selectMonth = selectMonth;
		this.eleNight = eleNight;
		this.eleDawn = eleDawn;
		this.elePm = elePm;
		this.eleAm = eleAm;
		this.eleDay = eleDay;
		this.userEleDay = userEleDay;
		this.otherEleDay = otherEleDay;
		this.weatherDate = weatherDate;
		this.weatherTEM = weatherTEM;
		this.weatherPRCE = weatherPRCE;
		this.weatherHUM = weatherHUM;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getSelectMonth() {
		return selectMonth;
	}


	public void setSelectMonth(String selectMonth) {
		this.selectMonth = selectMonth;
	}


	public String getEleNight() {
		return eleNight;
	}


	public void setEleNight(String eleNight) {
		this.eleNight = eleNight;
	}


	public String getEleDawn() {
		return eleDawn;
	}


	public void setEleDawn(String eleDawn) {
		this.eleDawn = eleDawn;
	}


	public String getElePm() {
		return elePm;
	}


	public void setElePm(String elePm) {
		this.elePm = elePm;
	}


	public String getEleAm() {
		return eleAm;
	}


	public void setEleAm(String eleAm) {
		this.eleAm = eleAm;
	}


	public String getEleDay() {
		return eleDay;
	}


	public void setEleDay(String eleDay) {
		this.eleDay = eleDay;
	}


	public String getUserEleDay() {
		return userEleDay;
	}


	public void setUserEleDay(String userEleDay) {
		this.userEleDay = userEleDay;
	}


	public String getOtherEleDay() {
		return otherEleDay;
	}


	public void setOtherEleDay(String otherEleDay) {
		this.otherEleDay = otherEleDay;
	}


	public String getWeatherDate() {
		return weatherDate;
	}


	public void setWeatherDate(String weatherDate) {
		this.weatherDate = weatherDate;
	}


	public String getWeatherTEM() {
		return weatherTEM;
	}


	public void setWeatherTEM(String weatherTEM) {
		this.weatherTEM = weatherTEM;
	}


	public String getWeatherPRCE() {
		return weatherPRCE;
	}


	public void setWeatherPRCE(String weatherPRCE) {
		this.weatherPRCE = weatherPRCE;
	}


	public String getWeatherHUM() {
		return weatherHUM;
	}


	public void setWeatherHUM(String weatherHUM) {
		this.weatherHUM = weatherHUM;
	}

	
}
