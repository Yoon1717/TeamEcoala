package com.ecoala.ele.eleInquiry.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.eleInquiry.service.EleInquiryService;
import com.ecoala.ele.eleInquiry.vo.EleInquiryVO;
@Controller
public class EleInquiryController {

	@Autowired
	EleInquiryService eleInquiryService; 
	

	@RequestMapping("/eleInquiryView")
	public String eleInquiry() {
		return "user/eleInquiry/eleInquiryView";
	}
	
	
	@ResponseBody
	@PostMapping("/yearInquiryDo")
	public  List<EleInquiryVO>  yearInquiryDo(@RequestBody EleInquiryVO user) throws Exception {
		 List<EleInquiryVO> result = eleInquiryService.yearInquiry(user);
		return result;
	}
	@ResponseBody
	@PostMapping("/monthInquiryDo")
	public List<EleInquiryVO>  monthInquiryDo(@RequestBody EleInquiryVO user) throws Exception {
		List<EleInquiryVO> result = eleInquiryService.monthInquiry(user);
		return result;
	}
	@ResponseBody
	@PostMapping("/weekInquiryDo")
	public List<EleInquiryVO>  weekInquiryDo(@RequestBody EleInquiryVO user) throws Exception {
		List<EleInquiryVO> result = eleInquiryService.weekInquiry(user);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/yearInquiryAppDo")
	public  List<EleInquiryVO>  yearInquiryAppDo(@RequestBody EleInquiryVO user) throws Exception {
		 List<EleInquiryVO> result = eleInquiryService.yearInquiryApp(user);
		return result;
	}
	@ResponseBody
	@PostMapping("/monthInquiryAppDo")
	public  List<EleInquiryVO>  monthInquiryAppDo(@RequestBody EleInquiryVO user) throws Exception {
		 List<EleInquiryVO> result = eleInquiryService.monthInquiryApp(user);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/weekInquiryAppDo")
	public  List<EleInquiryVO>  weekInquiryAppDo(@RequestBody EleInquiryVO user) throws Exception {
		 List<EleInquiryVO> result = eleInquiryService.weekInquiryApp(user);
		return result;
	}
}
