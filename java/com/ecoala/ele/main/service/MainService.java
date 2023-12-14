package com.ecoala.ele.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.main.dao.IMainDAO;
import com.ecoala.ele.main.vo.BillVO;
import com.ecoala.ele.main.vo.EachEleVO;
import com.ecoala.ele.main.vo.EleUsageVO;
import com.ecoala.ele.main.vo.TypeEleVO;

/**
 * Class Name  : MainService
 * Author      : ChoiMinHyeock
 * Created Date: 2023. 11. 29.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Service
public class MainService {	
	@Autowired
	IMainDAO dao;
	// 가전별
	public EachEleVO getEachEle(EachEleVO memId) throws Exception {
		EachEleVO result = dao.getEachEle(memId);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	
	// 하루전력량
	public EleUsageVO getEleUsage(EleUsageVO vo) throws Exception {
		EleUsageVO result = dao.getEleUsage(vo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	
	// 유형전력량
	public TypeEleVO getTypeEle(TypeEleVO memId) throws Exception {
		TypeEleVO result = dao.getTypeEle(memId);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	//요금
	public BillVO getBill(String memId) throws Exception {
		BillVO result = dao.getBill(memId);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	
	
}
