package com.ecoala.ele.member1.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.member1.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	
	public List<MemberVO> getMemInfo();

}
