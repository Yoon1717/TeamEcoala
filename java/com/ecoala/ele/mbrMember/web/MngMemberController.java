package com.ecoala.ele.mbrMember.web;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.board.vo.SearchVO;
import com.ecoala.ele.cboPoint.vo.cboPointVO;
import com.ecoala.ele.mbrMember.service.MngMemberService;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/**
 * Class Name : MngMemberController Author : LeeGyuHwan Created Date: 2023. 11.
 * 23. Version: 1.0 Purpose: Description: 회원가입 페이지 만듬 회원가입시 디비매핑가능
 */
@Controller
public class MngMemberController {

	@Autowired
	MngMemberService mngmemberService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session, HttpServletRequest request) {
		// 세션 종료
		session.invalidate();
		// 현재 요청이 어느 URL을 바라보는지
		String requestToURL = request.getRequestURL().toString();
		System.out.println(requestToURL);
		String requestUrl = request.getHeader("Referer");
		System.out.println(requestUrl);
		return "redirect:/";
	}

	// 회원가입 화면
	@RequestMapping("/regist")
	public String registView() {
		return "commons/registView";
	}
	@ResponseBody
	@PostMapping("/checkId")
	public boolean checkId(@RequestParam String id) {
	    return mngmemberService.checkId(id);
	}
	// 회원가입 기능
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		// 폼에서 전달된 파라미터값?
		String memId = request.getParameter("idnm");
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		String userNm = request.getParameter("name");
		String memNo = request.getParameter("memno");
		String jobType = request.getParameter("jobtype");
		String houseType = request.getParameter("housetype");
		String houseArea = request.getParameter("housearea");
		String region = request.getParameter("region");
		String authority = request.getParameter("authority");
		String userDt = request.getParameter("userdt");
		String delYn = request.getParameter("delyn");
		// 비번 암호화
		String encodePw = passwordEncoder.encode(userPw);
		System.out.println("encodePw :" + encodePw);
		 // 중복 아이디 체크
	    boolean isIdDuplicate = mngmemberService.checkId(userId);
	    if (isIdDuplicate) {
	        // 중복된 아이디인 경우 처리 (예: 에러 메시지 반환 또는 다른 처리)
	        return "redirect:/regist";
	    }
		
		MngMemberVO member = new MngMemberVO(memId, userId, encodePw, userNm, jobType, memNo, houseType, houseArea,
				region, authority, userDt, delYn);
		try {
			mngmemberService.registMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return "errorView";
		}
		return "redirect:/login";
	}
	

	// 사용자 로그인 화면
	@RequestMapping("/login")
	public String loginView(HttpServletRequest request, Model model, String msg) {
		// 현재 request 객체의 요청이 어느 URL로 부터 왔는지
		String requestUrl = request.getHeader("Referer");
		// Controller와 view 사이에 데이터를 전달하는 객체
		// model에 addAttribute 로 key-value 쌍의 형태로 데이터를 저장하면
		// view에서 해당 key로 사용가능함.
		model.addAttribute("fromUrl", requestUrl);
		model.addAttribute("msg", msg);
		return "commons/loginView";
	}

	// 사용자 로그인 기능
	@RequestMapping("/loginDo")
	public String loginDo(MngMemberVO member, HttpSession session, boolean remember, HttpServletResponse response)
			throws Exception {
		System.out.println(member); // 회원정보
		// 회원 서비스를 통해 입력된 데이터베이스 조회
		MngMemberVO login = mngmemberService.loginMember(member);
		// 조회정보 없을시 로그인 실패
		if (login == null) {
			return "redirect:/login?msg=N";
		}
		// 입력 비밀번호를 암호화하여 비교
		boolean match = passwordEncoder.matches(member.getUserPw(), login.getUserPw());
		// 비번 일치 실패시 로그인 x
		if (!match) {
			return "redirect:/login?msg=N";
		}
		// 세션에 로그인 정보 저장
		session.setAttribute("login", login);
		// 세션정보확인
		System.out.println("Session Attribute: " + session.getAttribute("login"));
		if (remember) {
			// 아이디 기억 쿠키 생성
			Cookie cookie = new Cookie("rememberId", member.getUserId());
			// 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		} else {
			// 아이디 기억 헤제 시 쿠키 삭제 (동일한 key값을 쿠키를 생성 후 유효기간을 0으로 만든다)
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			// 유효기간 0짜리인 쿠키를 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}
		// 요청 페이지
		return "redirect:/mainView";
	}

	// 관리자 로그인 화면
	@RequestMapping("/mngrlogin")
	public String mngrloginView(HttpServletRequest request, Model model, String msg) {

		String requestUrl = request.getHeader("Referer");

		model.addAttribute("fromUrl", requestUrl);
		model.addAttribute("msg", msg);
		return "mngr/mngrMember/mngrloginView";
	}

	// 관리자 로그인 기능
	@RequestMapping("/mngrloginDo")
	public String mngrloginDo(MngMemberVO member, HttpSession session, boolean remember, HttpServletResponse response)
			throws Exception {
		System.out.println(member); // 회원정보
		// 회원 서비스를 통해 입력된 데이터베이스 조회
		MngMemberVO login = mngmemberService.mngrMember(member);
		// 로그로 확인
		System.out.println("Login Object: " + login);
		// 조회정보 없을시 로그인 실패
		if (login == null || !"Y".equals(login.getAuthority())) {
			return "redirect:/mngrlogin?msg=N";
		}
		// 입력 비밀번호를 암호화하여 비교
		boolean match = passwordEncoder.matches(member.getUserPw(), login.getUserPw());
		// 비번 일치 실패시 로그인 x
		if (!match) {
			return "redirect:/mngrlogin?msg=N";
		}
		// 세션에 로그인 정보 저장
		session.setAttribute("login", login);
		// 세션정보확인
		System.out.println("Session Attribute: " + session.getAttribute("login"));
		if (remember) {
			// 아이디 기억 쿠키 생성
			Cookie cookie = new Cookie("rememberId", member.getUserId());
			// 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		} else {
			// 아이디 기억 헤제 시 쿠키 삭제 (동일한 key값을 쿠키를 생성 후 유효기간을 0으로 만든다)
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			// 유효기간 0짜리인 쿠키를 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}
		// 요청 페이지
		return "redirect:/admin/mngrMemList";
	}

	// 관리자 회원 조회
	@RequestMapping("/admin/mngrMemList")
	public String memList(Model model, HttpSession session, SearchVO search) {
		System.out.println("서치" + search);
		List<MngMemberVO> memList = mngmemberService.mngrMemberList(search);
		model.addAttribute("memList", memList);
		return "mngr/mngrMember/mngrMemList";
	}

	// 관리자 회원 상세
	@RequestMapping("/admin/mngrmemView")
	public String mngrMemView(String userId, Model model) throws Exception {
		MngMemberVO memView = mngmemberService.getmember(userId);
		model.addAttribute("memView", memView);

		return "mngr/mngrMember/mngrMemView";
	}

	// 관리자 회원 삭제
	@PostMapping("/memDelete")
	public String memberDel(String memId) throws Exception {
		mngmemberService.deleteMember(memId);
		return "redirect:/admin/mngrMemList";
	}

	// 마이페이지 회원탈퇴
	@PostMapping("/userDelete")
	public String memberDel2(String memId, HttpSession session) throws Exception {		
		mngmemberService.deleteMember(memId); 
		session.invalidate();
		return "redirect:/";
	}

	// 마이페이지
	@RequestMapping("/myPageView")
	public String myPage(Model model, HttpSession session) throws Exception {
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
		if (loginUser == null) {
			return "redirect:/"; 
		}
		try { 
		// 마이페이지 정보 조회
		MngMemberVO memView = mngmemberService.getmember2(loginUser.getUserId());
		model.addAttribute("memView", memView);
		
		// 마이페이지 포인트 조회
		List<cboPointVO> pointInfo = mngmemberService.memberPoint(memView);
		 model.addAttribute("pointInfo", pointInfo);
		
		return "commons/myPage";
		} catch (Exception e) {
            // 오류 처리 로직 추가
            e.printStackTrace(); // 예시로 간단하게 출력
            return "errorPage"; // 오류 페이지로 리다이렉트 또는 에러 메시지를 표시하는 페이지로 이동
        }
	}			
	
	/*
	 * // 마이페이지 업데이트
	 * 
	 * @PostMapping("/updateMemDo") public String updateMemDo(MngMemberVO member)
	 * throws Exception { mngmemberService.updateMember(member); return
	 * "redirect:/myPageView"; }
	 */
	@PostMapping("/updateMemDo")
	public String updateMemDo(MngMemberVO member, HttpSession session) throws Exception {
	    // 입력된 새로운 비밀번호를 암호화
		if(member.getUserPw() != null) {
			String encodedPassword = passwordEncoder.encode(member.getUserPw());
			member.setUserPw(encodedPassword);
		}
	    // 회원 업데이트
	    mngmemberService.updateMember(member);

	    // 세션에서 로그인 정보 다시 설정 (암호화된 비밀번호로)
	    MngMemberVO updatedUser = mngmemberService.getmember2(member.getUserId());
	    session.setAttribute("login", updatedUser);

	    return "redirect:/myPageView";
	}
}
