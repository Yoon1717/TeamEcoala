package com.ecoala.ele.mbrMember.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.board.vo.SearchVO;
import com.ecoala.ele.cboPoint.vo.cboPointVO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/**
 * Class Name : IMngMemberDAO Author : LeeGyuHwan Created Date: 2023. 11. 23.
 * Version: 1.0 Purpose: Description: 회원가입DAO
 */
@Mapper
public interface IMngMemberDAO {

	// member 회원가입
	public int registMember(MngMemberVO member);

	public int registMemInfo(MngMemberVO info);
	
	// 중복 아이디 체크
    boolean checkId(String userId);

	// 유저 로그인
	public MngMemberVO loginMember(MngMemberVO member);

	// 관리자 로그인
	public MngMemberVO mngrMember(MngMemberVO member);

	// 관리자 회원 리스트조회
	public List<MngMemberVO> mngrMemberList(SearchVO search);

	// 관리자 회원 상세조회
	public MngMemberVO getmember(String userId);

	// 관리자 회원 삭제
	void deleteMember(String memId);

	// 총 유저 조회
	public int getTotalRowCount(SearchVO searchVO);

	// 마이페이지 수정
	public int updateMember(MngMemberVO member);
	
	// 마이페이지 포인트 조회
	public List<cboPointVO> memberPoint (MngMemberVO userId);
}
