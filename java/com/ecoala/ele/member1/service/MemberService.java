package com.ecoala.ele.member1.service;

import java.util.List;

import com.ecoala.ele.member1.vo.MemberVO;

/**
 * Class Name  : MemberService
 * Author      : LeeGyuHwan
 * Created Date: 2023. 11. 20.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */

public interface MemberService {
	
	/**
	 * @Author : LeeGyuHwan
	 * @Date   : 2023. 11. 20.
	 * @Method : getMemInfo
	 * @return : List<MemberVO>
	 * Purpose :
	 * Description : 회원기본 정보 조회
	*/
	public List<MemberVO> getMemInfo();
	
}
