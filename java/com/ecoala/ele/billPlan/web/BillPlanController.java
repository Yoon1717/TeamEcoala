package com.ecoala.ele.billPlan.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.billPlan.service.BillPlanService;
import com.ecoala.ele.billPlan.vo.BillPlanVO;

/**
 * Class Name  : BillPlanController
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 4.
 * Version: 1.0
 * Purpose:   요금 계획 페이지 관련
 * Description: 
 * 			- /billPlanView : 요금 계획하기 페이지 이동
 * 			- /billPlanDo : 요금 계산 버튼 (memId, houseType, billMonth, monthTotal 전달
 */
@Controller
public class BillPlanController {
	
	@Autowired
	BillPlanService billPlanService;

	/* 요금계획하기 페이지 이동*/
	@RequestMapping("/billPlanView")
	public String billPlanView() {
		return "user/billPlan/billPlanView";
	}


	@ResponseBody
	@PostMapping("/billPlanDo")
    public BillPlanVO billPlanDo(@RequestBody BillPlanVO vo) throws Exception {
		System.out.println(vo);
		BillPlanVO result = billPlanService.getBillPlan(vo);
		System.out.println(result);
        return result;
    }
	
		
	
}
