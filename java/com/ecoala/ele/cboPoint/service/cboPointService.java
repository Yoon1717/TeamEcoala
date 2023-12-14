package com.ecoala.ele.cboPoint.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.cboPoint.dao.cboPointDAO;
import com.ecoala.ele.cboPoint.vo.cboPointVO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

@Service
public class cboPointService {
	
	@Autowired
	cboPointDAO dao;
	
	public cboPointVO getCboPoint(MngMemberVO userId) throws Exception{
		cboPointVO result = dao.getCboPoint(userId);
		if (result == null) {
			throw new Exception();
		}
		return result;
		
	}
	
	public void updateCboPoint(cboPointVO vo) throws Exception{
		int result = dao.updateCboPoint(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	public cboPointVO getPoint(String userId) throws Exception{
		cboPointVO result = dao.getPoint(userId);
		if (result== null) {
			throw new Exception();
		}
		return result;
		
	}

}
