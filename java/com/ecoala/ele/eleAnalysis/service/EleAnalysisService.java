package com.ecoala.ele.eleAnalysis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.eleAnalysis.dao.IEleAnalysisDAO;
import com.ecoala.ele.eleAnalysis.vo.EleAnalysisVO;



@Service
public class EleAnalysisService {

	
	@Autowired
	IEleAnalysisDAO dao;
	
	public  List<EleAnalysisVO> oneMonthEle(EleAnalysisVO user) {
		 List<EleAnalysisVO> result =dao.oneMonthEle(user);
		if(result ==null) {
			return null;	
		}
		return result;
	
}
	public  List<EleAnalysisVO> comparisonEle(EleAnalysisVO user) {
		 List<EleAnalysisVO> result =dao.comparisonEle(user);
		if(result ==null) {
			return null;	
		}
		return result;
	
}
	
	public  List<EleAnalysisVO> weatherList(EleAnalysisVO user) {
		 List<EleAnalysisVO> result =dao.weatherList(user);
		if(result ==null) {
			return null;	
		}
		return result;
}
}
