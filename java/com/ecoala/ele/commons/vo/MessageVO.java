package com.ecoala.ele.commons.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * Class Name  : MessageVO
 * Author      : LeeApGil
 * Created Date: 2023. 11. 30.
 * Version: 1.0
 * Purpose:메세지 정보 관리 VO   
 * Description: 처리 결과와 같은 정보 처리를 위한 VO 
 */
public class MessageVO {
	
	private boolean result;
	private String title;
	private String message;
	private String url;
	private String urlTitle;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	public void messageSetting(boolean result,String title, String message, String url, String urlTitle) {
		this.result=result; this.title=title; this.message=message; this.url=url; this.urlTitle=urlTitle;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrlTitle() {
		return urlTitle;
	}
	public void setUrlTitle(String urlTitle) {
		this.urlTitle = urlTitle;
	}
	
}
