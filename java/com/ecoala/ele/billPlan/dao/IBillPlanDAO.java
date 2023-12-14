package com.ecoala.ele.billPlan.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.billPlan.vo.BillPlanVO;

/**
 * Class Name  : IBillPlanDAO
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 4.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Mapper
public interface IBillPlanDAO {
	
//	요금 계획하기 페이지 [목표치 - 사용량]을 위해 
//	이번달의 전력량(mem_app_ele)의 합 가져오기
	public BillPlanVO getSumEle (BillPlanVO memId);

}
