package com.ecoala.ele.main.dao;



import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.main.vo.BillVO;
import com.ecoala.ele.main.vo.EachEleVO;
import com.ecoala.ele.main.vo.EleUsageVO;
import com.ecoala.ele.main.vo.TypeEleVO;


@Mapper
public interface IMainDAO {
	public EachEleVO getEachEle(EachEleVO memId);
	public EleUsageVO getEleUsage(EleUsageVO vo); 	
	public TypeEleVO getTypeEle(TypeEleVO memId);
	public BillVO getBill(String memId);
	
	
}
