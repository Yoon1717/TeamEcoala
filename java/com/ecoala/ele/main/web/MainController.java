package com.ecoala.ele.main.web;




import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.main.service.MainService;
import com.ecoala.ele.main.vo.BillVO;
import com.ecoala.ele.main.vo.CombinedVO;
import com.ecoala.ele.main.vo.EachEleVO;
import com.ecoala.ele.main.vo.EleUsageVO;
import com.ecoala.ele.main.vo.TypeEleVO;
import com.ecoala.ele.mbrMember.service.MngMemberService;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;
import com.ecoala.ele.member1.vo.MemberVO;




@Controller
public class MainController {
	@Autowired
	MainService mainservice;
	@Autowired
	MngMemberService mngservice;
	
//	@RequestMapping("/mainView")
//	public String mainView(HttpSession session) {
//		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
//		System.out.println("얌얌이"+loginUser);
//		if(loginUser == null) {
//			return "redirect:/";
//		}
//		
//		return "user/main/mainView";			    
//	}
	@RequestMapping("/mainView")
	public String mainView(HttpSession session, Model model) throws Exception {
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
		System.out.println("얌얌이"+loginUser);
		if(loginUser == null) {
			return "redirect:/";
		}
		try {			
			String memId = loginUser.getMemId();
//			BillVO bill = new BillVO();
//			bill.setMemId(memId);
			BillVO bill = mainservice.getBill(memId);		
			System.out.println("나의요금확인:"+bill);
			model.addAttribute("bill",bill);
			return "user/main/mainView";
		} catch (Exception e) {
            e.printStackTrace(); // 예시로 간단하게 출력
            return "errorPage"; // 오류 페이지로 리다이렉트 또는 에러 메시지를 표시하는 페이지로 이동
		}
					    
	}
	// 두개의 VO를 총괄해서 사용
	@ResponseBody
	@PostMapping("/combineDo")
	public CombinedVO combineDo(@RequestBody CombinedVO combine) throws Exception {
		
		
		EleUsageVO result = mainservice.getEleUsage(combine.getEleUsageVO()); 
		TypeEleVO result2 = mainservice.getTypeEle(combine.getTypeEleVO());
		
		System.out.println(result2);
		CombinedVO output = new CombinedVO(result, result2);
		return output;
												 
	}
	
	
	@ResponseBody
	@PostMapping("/eachDo")
	public ResponseEntity<?> eachDo(@RequestBody EachEleVO memId) throws Exception {		
		try {
			//System.out.println("콘솔1: " + memId);	
			Date day = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(day);
			memId.setUseDt(date);			
			EachEleVO result = mainservice.getEachEle(memId);			
			//System.out.println("콘솔2: "+ result);
			return ResponseEntity.ok(result);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버오류: "+ e.getMessage());
		}		 		
	}	
	@ResponseBody
	@GetMapping("/getSession")	
	public String getSession(HttpSession session) {
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
		String sessionValue = loginUser.getUserId();
	 System.out.println("세션확인:   "+ sessionValue);
		return sessionValue;
	}

	
	
	
	
}



