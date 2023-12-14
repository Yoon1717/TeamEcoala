package com.ecoala.ele.eleInquiry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecoala.ele.eleInquiry.vo.EleInquiryVO;

@Mapper
public interface IEleInquiryDAO {
	public List<EleInquiryVO> yearInquiry(EleInquiryVO user);
	public List<EleInquiryVO> monthInquiry(EleInquiryVO user);
	public List<EleInquiryVO> weekInquiry(EleInquiryVO user);
	
	public List<EleInquiryVO> yearInquiryApp(EleInquiryVO user);
	public List<EleInquiryVO> monthInquiryApp(EleInquiryVO user);
	public List<EleInquiryVO> weekInquiryApp(EleInquiryVO user);
	
	public List<EleInquiryVO> getDateEleList(EleInquiryVO user);
}
 