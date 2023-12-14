package com.ecoala.ele.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecoala.ele.board.dao.IBoardDAO;
import com.ecoala.ele.board.vo.BoardVO;
import com.ecoala.ele.board.vo.SearchVO;
import com.ecoala.ele.commons.exception.BizAccessFailException;
import com.ecoala.ele.commons.exception.BizNotEffectedException;
import com.ecoala.ele.commons.exception.BizNotFoundException;

/**
 * Class Name  : BoardService
 * Author      : YoonGaYoung
 * Created Date: 2023. 11. 23.
 * Version: 1.0
 * Purpose:   
 * Description: 
 */
@Service
public class BoardService {

	@Autowired
	IBoardDAO dao;
	
	 /*게시글 상세 조회*/
	public BoardVO getBoard(int boardNo) throws Exception {
		BoardVO result = dao.getBoard(boardNo);
		if (result == null) {
			throw new Exception();
		}
		return result;
	}
	
	/*검색어 기반 게시글 목록 조회*/
	public List<BoardVO> searchBoardList(SearchVO searchVO){
		int totalRowCount = dao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dao.searchBoardList(searchVO);
	}
	
	/*공지글 만 조회*/
	public List<BoardVO> noticeBoList(){
		return dao.noticeBoList();
	}
	
	/*공지글  작성*/
	public void writeNoticeBo(BoardVO board) throws Exception {
		int result = dao.writeNoticeBo(board);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	
	/*게시글 생성*/
	public void writeBoard(BoardVO board) throws Exception {
		int result = dao.writeBoard(board);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	/*공지 내리기*/
	public void updateNoticeBo(BoardVO board) throws Exception{
		int result = dao.updateNoticeBo(board);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	/*게시글 수정*/
	public void updateBoard(BoardVO board) throws BizNotFoundException, BizNotEffectedException, BizAccessFailException{
		BoardVO vo = dao.getBoard(board.getBoardNo());
		// 없는 게시글일 경우		
		if (vo == null)
			throw new BizNotFoundException();
		// 동일한 사용자 id
		if(vo.getUserId().equals(board.getUserId())){
			// 수정이 안 일어났을때
			int result = dao.updateBoard(board);
			if (result == 0) {
				throw new BizNotEffectedException();
			}
		}else {
			throw new BizAccessFailException();
		}
	}
	
	/*게시글 삭제*/
	public void deleteBoard(int boardNo) throws Exception {
		int result = dao.deleteBoard(boardNo);
		if(result == 0) {
			throw new Exception();
		}
	}
	
	/*조회수 증가*/
	public void increaseHit(int boardNo) throws Exception {
		int result = dao.increaseHit(boardNo);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	
//	public int clickLike(BoardVO vo);						/*좋아요 누르기*/
	public void clickLike(BoardVO vo) throws Exception {
		int result = dao.clickLike(vo);
		if (result == 0) {
			throw new Exception();			
		}
	}
//	public int cancelLike(BoardVO vo);						/*좋아요 취소*/
	public void cancelLike(BoardVO vo) throws Exception {
		int result = dao.cancelLike(vo);
		if (result == 0) {
			throw new Exception();			
		}
	}
	

}
