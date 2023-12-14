package com.ecoala.ele.commons.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/* 인턴셉터
 * ecoala 프로젝트의 경우
 * 관리 페이지에는 관리자 아이디만 접속이 가능해야한다 
 * 이에 대한 다른 아이디들은 접속할 수 없도록
 * */
public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session= request.getSession();
		MngMemberVO user = (MngMemberVO)session.getAttribute("login");
		if(user==null) {
			//로그인x
			response.sendRedirect(request.getContextPath()+"/mngrlogin");
			return false;
		}
		//로그인은 됨
		if(! "Y".equals(user.getAuthority())) {
			// 로그아웃 시키거나 오류 메세지 출력		
			response.sendRedirect(request.getContextPath()+"/logoutDo");
			// response.sendError(403, "당신은 매니저가 아닙니다");
			return false; 
		}
		
		// 로그인 정보가 admin일 경우 		
		return true;
	}

}
