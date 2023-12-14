package com.ecoala.ele.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ecoala.ele.board.service.BoardService;
import com.ecoala.ele.board.vo.BoardVO;
import com.ecoala.ele.board.vo.SearchVO;
import com.ecoala.ele.commons.exception.BizAccessFailException;
import com.ecoala.ele.commons.exception.BizNotEffectedException;
import com.ecoala.ele.commons.exception.BizNotFoundException;
import com.ecoala.ele.commons.vo.MessageVO;
import com.ecoala.ele.mbrMember.service.MngMemberService;
import com.ecoala.ele.mbrMember.vo.MngMemberVO;

/**
 * Class Name  : MngrBoardController
 * Author      : YoonGaYoung
 * Created Date: 2023. 12. 12.
 * Version: 1.0
 * Purpose:   관리자의 공지 작성 및 게시판 관리 컨트롤러
 * Description: 
 */
@Controller
public class MngrBoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	MngMemberService mngmemberService;
	
	// 게시판 관리 페이지 이동
	@RequestMapping("/admin/mngrBoardView")
	public String mngrBoardView(Model model, HttpSession session, SearchVO search, MessageVO messageVO) {
		List<BoardVO> boardList = boardService.searchBoardList(search);
		List<BoardVO> noticeBoList = boardService.noticeBoList();
		model.addAttribute("noticeBoList", noticeBoList);
		model.addAttribute("boardList", boardList);
		if(messageVO.getTitle() == null) {
			messageVO = null;
		}
		model.addAttribute("messageVO", messageVO);
		return "mngr/mngrBoard/mngrBoardView";
	}
	
	// 게시글 관리 상세보기
	@RequestMapping("/admin/mngrBoardDetView")
	public String mngrBoardDetView(int boardNo, Model model) throws Exception {
		BoardVO boardVO = boardService.getBoard(boardNo);
		if (boardVO != null) {
			boardService.increaseHit(boardNo);
		}
		model.addAttribute("board", boardVO);
		return "mngr/mngrBoard/mngrBoardDetView";
	}
	
	/* 공지 작성 페이지 이동*/
	@RequestMapping("/admin/noticeBoWriteView")
	public String noticeBoWriteView(MngMemberVO member, HttpSession session, boolean remember, HttpServletResponse response) {
			return "mngr/mngrBoard/mngrNoticeBoWrtieView";
	}
	
	/*공지글 생성 작동*/
	@RequestMapping("/admin/noticeBoWriteDo")
	public String noticeBoWriteDo(BoardVO board, HttpSession session, Model model) throws Exception {
		MngMemberVO login = (MngMemberVO) session.getAttribute("login");
		board.setUserId(login.getUserId());
		boardService.writeNoticeBo(board);
		model.addAttribute("messageVO", null);
		
		return "redirect:/admin/mngrBoardView";
	}
	
	
	/*공지 내리기 작동*/
	@RequestMapping("/admin/noticeBoUpdateDo")
	public String noticeBoUpdateDo(BoardVO board) throws Exception {
		boardService.updateNoticeBo(board);
		return "redirect:/admin/mngrBoardView";
	}

	

	
	// 게시글 삭제
	// 관리자가 일반글에 삭제할 수 있는 권한 어떤식으로 줘야할지 고민
	@RequestMapping("/admin/mngrBoardDelDo")
	public String mngrBoardDelDo(int boardNo , Model model) throws Exception {
		boardService.deleteBoard(boardNo);
		model.addAttribute("messageVO", null);
		return "redirect:/admin/mngrBoardView";
	}
	
}
