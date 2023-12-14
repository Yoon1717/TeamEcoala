package com.ecoala.ele.board.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
 * Class Name  : BoardController
 * Author      : YoonGaYoung
 * Created Date: 2023. 11. 27.
 * Version: 1.0
 * Purpose:   board 컨트롤러
 * Description: 
 */
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	MngMemberService mngmemberService;
	
	
	/*게시판 목록 페이지 이동*/
	/*게시판 목록 페이지 이동 시 message를 전달*/
	@RequestMapping("/boardView")
	public String boardView(Model model, HttpSession session, SearchVO search, MessageVO messageVO) {
		System.out.println(search);
		List<BoardVO> boardList = boardService.searchBoardList(search);
		List<BoardVO> noticeBoList = boardService.noticeBoList();
		model.addAttribute("noticeBoList", noticeBoList);
		model.addAttribute("boardList", boardList);
		if(messageVO.getTitle() == null) {
			messageVO = null;
		}
		model.addAttribute("messageVO", messageVO);
		System.out.println(model);
		return "user/board/boardView";
	}
	
	
	/*게시글 상세 조회 페이지 이동*/
	@RequestMapping("/boardDetialView")
	public String boardDetialView(int boardNo, Model model) throws Exception {
		BoardVO boardVO = boardService.getBoard(boardNo);
		if (boardVO != null) {
			boardService.increaseHit(boardNo);
		}
		model.addAttribute("board", boardVO);
		System.out.println(model);
		return "user/board/boardDetView";
	}
	
	/*게시글 생성 페이지 이동*/
	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "user/board/boardWriteView";
	}
	
	
	/*게시글 생성 작동*/
	@RequestMapping("/boardWriteDo")
	public String boardWriteDo(BoardVO board, HttpSession session, Model model) throws Exception {
		MngMemberVO login = (MngMemberVO) session.getAttribute("login");
		board.setUserId(login.getUserId());
		boardService.writeBoard(board);
		model.addAttribute("messageVO", null);
		
		return "redirect:/boardView";
	}
		
	
	
	
	/*-------------------------------------------------*/
	
	/*게시글 수정 페이지 이동*/
	@RequestMapping("/boardEditView")
	public String boardEditView(Model model,int boardNo) throws Exception {
	    BoardVO boardVO = boardService.getBoard(boardNo);
	    model.addAttribute("board", boardVO);
	    model.addAttribute("messageVO", null);
	    
		return "user/board/boardEditView";
	}
	
	
	
	
	/*게시글 수정 작동*/
	/*사용자의 동일한 반응에 다양한 리턴을 주기 위해 조건을 걸어 상황마다 다른 리턴을 준다 
	 *여기서는 상황에 따른 message를 전달 화면에 alert로 출력*/
	@PostMapping("/boardEditDo")
	public String boardEditDo(BoardVO board, Model model,RedirectAttributes redirectAttributes ) {
		
		MessageVO messageVO= new MessageVO();
		try {
			boardService.updateBoard(board);
			messageVO.messageSetting(true, "수정", "수정성공"
				,"user/board/boardView" , "목록으로");
		} catch (BizNotFoundException enf) {
			messageVO.messageSetting(false, "글을 찾을 수 없습니다.", "해당 글이 없습니다",
					"user/board/boardView", "목록으로");
		} catch (BizAccessFailException epm) {
			messageVO.messageSetting(false, "아이디 다름", "글쓴이와 다릅니다.(권한없음)",
					"user/board/boardView", "목록으로");
		} catch (BizNotEffectedException ene) {
			messageVO.messageSetting(false, "수정 내용이 잘 못 되었습니다.", "업데이트에 실패했습니다",
					"user/board/boardView", "목록으로");
		}
		redirectAttributes.addFlashAttribute("messageVO", messageVO);
		return "redirect:/boardView";
	}
	
	/*게시글 삭제 작동*/
	@PostMapping("/boardDel")
	public String boardDel(int boardNo , Model model) throws Exception {
		boardService.deleteBoard(boardNo);
		model.addAttribute("messageVO", null);
		return "redirect:/boardView";
	}
	

	
	/*좋아요 누르기*/
	@PostMapping("/clickLikeDo")
	public String clickLikeDo(HttpSession session, BoardVO board) throws Exception {
		MngMemberVO login = (MngMemberVO) session.getAttribute("login");
		System.out.println(board);
		board.setUserId(login.getUserId());
		boardService.clickLike(board);
		
		return "redirect:/boardDetView";
	}
	/*좋아요 취소*/
	@PostMapping("/cancelLikeDo")
	public String cancelLikeDo(HttpSession session, BoardVO board) throws Exception {
		System.out.println(board);
		MngMemberVO login = (MngMemberVO) session.getAttribute("login");
		board.setUserId(login.getUserId());
		boardService.cancelLike(board);
		return "redirect:/boardDetView";
	}
	
	
	
	
}
