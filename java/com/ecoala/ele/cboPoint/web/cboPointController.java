package com.ecoala.ele.cboPoint.web;

import java.io.Console;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.cboPoint.service.cboPointService;
import com.ecoala.ele.cboPoint.vo.cboPointVO;
import com.ecoala.ele.commons.vo.MessageVO;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

@Controller
public class cboPointController {
	@Autowired
	private cboPointService cboPointService;
	
	@RequestMapping("cboPointView")
	public String cboPoint(Model model, HttpSession session) throws Exception {
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
		cboPointVO getCboPoint = cboPointService.getCboPoint(loginUser);
		model.addAttribute("result", getCboPoint);
		return "user/cboPoint/cboPointView";
	}
	
	@ResponseBody
	@RequestMapping("/cboPointDo")
	public MessageVO cboPointDo(Model model, HttpSession session,@RequestBody cboPointVO cboPointVO) throws Exception {
		System.out.println(cboPointVO);
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
		cboPointVO.setUserId(loginUser.getUserId());
		cboPointVO.setMemId(loginUser.getMemId());
		System.out.println(cboPointVO);
		cboPointService.updateCboPoint(cboPointVO);
		MessageVO msgMessageVO = new MessageVO();
		msgMessageVO.setMessage("성공");
		return msgMessageVO;
	}
	@ResponseBody
	@RequestMapping("/getPoint")
	public cboPointVO getPoint (HttpSession session, Model model) throws Exception{
		MngMemberVO loginUser = (MngMemberVO) session.getAttribute("login");
		cboPointVO getPoint = null;
		if (loginUser != null ) {
			getPoint = cboPointService.getPoint(loginUser.getUserId());
		}
		return getPoint;
	}

}
