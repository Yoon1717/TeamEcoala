package com.ecoala.ele.commons.exception;

/**
 * Class Name  : BizNotFoundException
 * Author      : LeeApGil
 * Created Date: 2023. 11. 30.
 * Version: 1.0
 * Purpose: 사용자 예외처리  
 * Description: 요청된 리소스나 데이터가 비즈니스 로직 상에서 찾을 수 없을 때 사용되는 예외
 */
public class BizNotFoundException extends Exception {
	
	public BizNotFoundException() {
	}

	public BizNotFoundException(String message) {
		super(message);
	}

	public BizNotFoundException(Throwable cause) {
		super(cause);
	}

	public BizNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
