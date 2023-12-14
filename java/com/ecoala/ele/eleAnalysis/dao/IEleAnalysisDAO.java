package com.ecoala.ele.eleAnalysis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.eleAnalysis.vo.EleAnalysisVO;



@Mapper
public interface IEleAnalysisDAO {
	public List<EleAnalysisVO> oneMonthEle(EleAnalysisVO user);
	
	public List<EleAnalysisVO> comparisonEle(EleAnalysisVO user);
	public List<EleAnalysisVO> weatherList(EleAnalysisVO user);
}
