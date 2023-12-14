package com.ecoala.ele;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {

	/**
	 * @Author : YoonGaYoung
	 * @Date   : 2023. 11. 23.
	 * @Method : registView
	 * @return : String
	 * Purpose : root 화면에서 각기로그인, 회원가입으로 url만 이동하기 위한 테스트 컨트롤러 입니다.
	 * Description : mainView 의 경우 로그인 후 이동해야하지만 테스트를 수월하게 하기위해 root에서 바로 갈수있도록 생성해둠
	*/
	
	/**
	 * Class Name  : TestController
	 * Author      : ChoiMinHyeock
	 * Created Date: 2023. 11. 27.
	 * @Method : InquiryView
	 * Purpose:   
	 * Description: 전력량조회 컨트롤러 대충만들어봄
	 */
	
//	공통페이지 -----------------------------------------------------------
	@RequestMapping("/registView")
	public String registView() {
		return "commons/registView";
	}
	
//	@RequestMapping("/loginView")
//	public String loginView() {
//		return "commons/loginView";
//	}
//	
	
//	사용자 페이지 ----------------------------------------------------------
//	@RequestMapping("/mainView")
//	public String mainView() {
//		return "user/main/mainView";
//	}

	@RequestMapping("/InquiryView")
	public String InquiryView() {
		return "user/eleInquiry/eleInquiry";
	}
		
//	관리자 페이지 ----------------------------------------------------------
//	@RequestMapping("/mngrMemList")
//	public String mngrMemList() {
//		return "mngr/mngrMember/mngrMemList";
//	}
//	

	
	
}
