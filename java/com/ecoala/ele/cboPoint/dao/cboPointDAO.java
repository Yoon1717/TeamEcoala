package com.ecoala.ele.cboPoint.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.cboPoint.vo.cboPointVO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

@Mapper
public interface cboPointDAO {
	
	public cboPointVO getCboPoint (MngMemberVO userId);
	public int updateCboPoint (cboPointVO vo);
	public cboPointVO getPoint (String userId);
}
