package com.ecoala.ele.commons.exception;

/**
 * Class Name  : BizAccessFailException
 * Author      : LeeApGil
 * Created Date: 2023. 11. 30.
 * Version: 1.0
 * Purpose:  사용자 예외 처리 
 * Description: 비즈니스 접근권한 없을때 
 */
public class BizAccessFailException extends Exception {
	public BizAccessFailException() {
	}

	public BizAccessFailException(String message) {
		super(message);
	}

	public BizAccessFailException(Throwable cause) {
		super(cause);
	}

	public BizAccessFailException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizAccessFailException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
