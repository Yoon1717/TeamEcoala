package com.ecoala.ele.billPlan.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ecoala.ele.billPlan.dao.IBillPlanDAO;
import com.ecoala.ele.billPlan.vo.BillPlanVO;

/**
 * Class Name  : BillPlanService
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 4.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Service
public class BillPlanService {

	@Autowired
	IBillPlanDAO dao;
	
//	요금 계획하기 페이지 [목표치 - 사용량]을 위해 
//	이번달의 전력량(mem_app_ele)의 합 가져오기
	public BillPlanVO getBillPlan(BillPlanVO memId) throws Exception {
		BillPlanVO result = dao.getSumEle(memId);
		if (result == null) {
			throw new Exception();
		}
		return result;
	}
	

}
