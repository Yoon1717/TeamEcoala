package com.ecoala.ele.member1.web;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecoala.ele.member1.service.MemberService;
import com.ecoala.ele.member1.vo.MemberVO;

/**
 * Class Name  : MemberController
 * Author      : LeeGyuHwan
 * Created Date: 2023. 11. 20.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Controller
public class MemberController {
	
	@Inject
	MemberService service;
	
	@RequestMapping(value = "/meminfo", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {
		List<MemberVO> memberList = service.getMemInfo();
		model.addAttribute("memberList", memberList);
		return "test/member/meminfo";
	}

}
