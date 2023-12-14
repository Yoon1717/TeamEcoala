package com.ecoala.ele.mbrMember.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.board.vo.SearchVO;
import com.ecoala.ele.cboPoint.vo.cboPointVO;
import com.ecoala.ele.mbrMember.dao.IMngMemberDAO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/**
 * Class Name  : MngMemberService
 * Author      : LeeGyuHwan
 * Created Date: 2023. 11. 23.
 * Version: 1.0
 * Purpose:   
 * Description: 회원가입vo
 */
@Service
public class MngMemberService {
	@Autowired
	IMngMemberDAO dao;
	
		// 회원가입
		public void registMember(MngMemberVO member) throws Exception {
			
			dao.registMemInfo(member);
			System.out.println(member);
			int result = dao.registMember(member);
			
			if(result == 0) {
				
				throw new Exception();
		}
	}
		  // 중복 아이디 체크
		public boolean checkId(String userId) {
		    return dao.checkId(userId);
		}
	    
		// 유저 로그인
		public MngMemberVO loginMember(MngMemberVO member) {
			MngMemberVO result = dao.loginMember(member);
			if(result == null) {
				System.out.println(result);
				return null;
		}
		return result;
	}
		// 관리자 로그인
		public MngMemberVO mngrMember(MngMemberVO member) {
			System.out.println("Before mngrMember DAO: " + member);
			MngMemberVO result = dao.mngrMember(member);
			System.out.println("After mngrMember DAO: " + result);
			if(result == null) {
				System.out.println(result);
				return null;
			}
			return result;
		}
		// 관리자 회원정보조회
		public List<MngMemberVO> mngrMemberList(SearchVO searchVO){
			int totalRowCount = dao.getTotalRowCount(searchVO);
			searchVO.setTotalRowCount(totalRowCount);
			searchVO.pageSetting();
			return dao.mngrMemberList(searchVO);
		}
		// 관리자 회원 상세
		public MngMemberVO getmember(String userId)throws Exception{
			MngMemberVO result = dao.getmember(userId);
			
			if(result == null) {
				throw new Exception();
			}
			return result;
		}
		// 관리자 회원 삭제
		public void deleteMember(String memId) throws Exception {
			dao.deleteMember(memId);
			}
		
		// 마이페이지 조회
		public MngMemberVO getmember2(String userId)throws Exception{
			MngMemberVO result = dao.getmember(userId);
			
			if(result == null) {
				throw new Exception();
			}
			return result;
		}
		// 마이페이지 수정
		public void updateMember(MngMemberVO member) throws Exception {
			int result = dao.updateMember(member);
			
			if(result == 0) {
				throw new Exception("회원 정보 업데이트에 실패하였습니다.");
			}
		}
		// 마이페이지 포인트 조회
		public List<cboPointVO> memberPoint(MngMemberVO userId) throws Exception {
			 List<cboPointVO> result = dao.memberPoint(userId);
			    return result != null ? result : Collections.emptyList();
		}


}
