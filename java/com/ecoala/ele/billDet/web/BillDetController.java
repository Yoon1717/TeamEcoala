package com.ecoala.ele.billDet.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.billDet.service.BillDetService;
import com.ecoala.ele.billDet.vo.BillDetVO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/**
 * Class Name  : BillDetController
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 5.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Controller
public class BillDetController {
	
	@Autowired
	BillDetService billDetService;

	@RequestMapping("/billDetView") // 빈리스트가 리턴된다
	public String billDetView(Model model,  HttpSession session) throws Exception {
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
//		// 1
		BillDetVO getLsMonthBill = billDetService.getLsMonthBill(loginUser.getMemId());
		System.err.println(getLsMonthBill);
		model.addAttribute("getLsMonthBill", getLsMonthBill);
		// 3-1
		List<BillDetVO> getListThisYearBills = billDetService.getListThisYearBills(loginUser.getMemId());
		model.addAttribute("getListThisYearBills", getListThisYearBills);
		// 3-2
		List<BillDetVO> getListLsYearBills = billDetService.getListLsYearBills(loginUser.getMemId());
		model.addAttribute("getListLsYearBills", getListLsYearBills);
		// 4
		List<BillDetVO> billDetList = billDetService.getListBillDet(loginUser.getMemId());
		System.out.println(billDetList);
		model.addAttribute("billDetList", billDetList);
		
		return "user/billDet/billDetView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAvgEqCondi", method = RequestMethod.POST)
	public ResponseEntity<List<BillDetVO>> getAvgEqCondi(HttpSession session,@RequestBody BillDetVO vo) throws Exception {
		// 2
	    MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
	    vo.setMemId(loginUser.getMemId());
	    // loginUser에서 memId를 직접 사용searchVO <- id set
	    List<BillDetVO> billDetList = billDetService.getAvgEqCondi(vo);
	    System.out.println(billDetList);
	    return new ResponseEntity<>(billDetList, HttpStatus.OK);
	}

	
	
	
	
	
}
