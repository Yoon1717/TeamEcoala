package com.ecoala.ele.eleInquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.eleInquiry.dao.IEleInquiryDAO;
import com.ecoala.ele.eleInquiry.vo.EleInquiryVO;

@Service
public class EleInquiryService {
	@Autowired
	IEleInquiryDAO dao;
	
	public  List<EleInquiryVO> yearInquiry(EleInquiryVO user) {
		 List<EleInquiryVO> result =dao.yearInquiry(user);
		if(result ==null) {
			return null;	
		}
		return result;
	}
	
	public List<EleInquiryVO> monthInquiry(EleInquiryVO user) {
		List<EleInquiryVO> result =dao.monthInquiry(user);
		if(result ==null) {
			return null;	
		}
		return result;
	}
	
	public List<EleInquiryVO> weekInquiry(EleInquiryVO user) {
		List<EleInquiryVO> result =dao.weekInquiry(user);
		if(result ==null) {
			return null;	
		}
		return result;
	}
	
	public List<EleInquiryVO> yearInquiryApp(EleInquiryVO user){
		List<EleInquiryVO> result =dao.yearInquiryApp(user);
		if(result ==null) {
			return null;	
		}
		return result;
	}
	
	public List<EleInquiryVO> monthInquiryApp(EleInquiryVO user){
		List<EleInquiryVO> result =dao.monthInquiryApp(user);
		if(result ==null) {
			return null;	
		}
		return result;
	}
	
	public List<EleInquiryVO> weekInquiryApp(EleInquiryVO user){
		List<EleInquiryVO> result =dao.weekInquiryApp(user);
		if(result ==null) {
			return null;	
		}
		return result;
	}
		
	
	public List<EleInquiryVO> getDateEleList(EleInquiryVO user){
		List<EleInquiryVO> result = dao.getDateEleList(user);
		System.out.println(result);
		System.out.println("result");
		return result;
	}
	


}
