package com.ecoala.ele.billDet.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.billDet.dao.IBillDetDAO;
import com.ecoala.ele.billDet.vo.BillDetVO;
import com.ecoala.ele.board.vo.BoardVO;
import com.ecoala.ele.board.vo.SearchVO;

/**
 * Class Name  : BillDetService
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 5.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Service
public class BillDetService {
	
	@Autowired
	IBillDetDAO dao;
	
	
 	public BillDetVO getLsMonthBill (String memId) throws Exception {
 		BillDetVO result = dao.getLsMonthBill(memId);
 		if (result == null) {
			throw new Exception();
		}
 		return result;
 	}
 	
// 	비교 필요
	public List<BillDetVO> getAvgEqCondi (BillDetVO vo) throws Exception {
		List<BillDetVO> result = dao.getAvgEqCondi(vo);
 		if (result == null) {
			throw new Exception();
		}
 		return result;
	}
	
	
	public List<BillDetVO> getListThisYearBills (String memId) throws Exception{
		List<BillDetVO> result = dao.getListThisYearBills(memId);
		if (result == null) {
			throw new Exception();
		}
		return result;
	}
	public List<BillDetVO> getListLsYearBills (String memId) throws Exception{
		List<BillDetVO> result = dao.getListLsYearBills(memId);
		if (result == null) {
			throw new Exception();
		}
		return result;
	}
	public List<BillDetVO> getListBillDet (String memId) throws Exception{
		List<BillDetVO> result = dao.getListBillDet(memId);
		if (result.isEmpty()) {
			return Collections.emptyList();
		}
		return result;
	}


}
