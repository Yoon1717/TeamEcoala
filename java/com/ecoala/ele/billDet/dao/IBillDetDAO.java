package com.ecoala.ele.billDet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.billDet.vo.BillDetVO;
import com.ecoala.ele.board.vo.SearchVO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/**
 * Class Name  : IBillDetDAO
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 5.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Mapper
public interface IBillDetDAO {
	
//	셀렉트 박스로 추가 작업필요
	public List<BillDetVO> getAvgEqCondi (BillDetVO vo);
	
	
	public BillDetVO getLsMonthBill (String memId);
	public List<BillDetVO> getListThisYearBills (String memId);
	public List<BillDetVO> getListLsYearBills (String memId);
	public List<BillDetVO> getListBillDet (String memId);
	

}
