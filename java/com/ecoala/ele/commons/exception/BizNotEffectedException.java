package com.ecoala.ele.commons.exception;

/**
 * Class Name  : BizNotEffectedException
 * Author      : LeeApGil
 * Created Date: 2023. 11. 30.
 * Version: 1.0
 * Purpose: 사용자 예외 처리 
 * Description: 비즈니스 로직이 예상한 대로 효과를 발휘하지 못했을때  
 */
public class BizNotEffectedException extends Exception {

	public BizNotEffectedException() {
	}

	public BizNotEffectedException(String message) {
		super(message);
	}

	public BizNotEffectedException(Throwable cause) {
		super(cause);
	}

	public BizNotEffectedException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizNotEffectedException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
