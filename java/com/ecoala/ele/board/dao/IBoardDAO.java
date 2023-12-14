package com.ecoala.ele.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecoala.ele.board.vo.BoardVO;
import com.ecoala.ele.board.vo.SearchVO;

/**
 * Class Name  : IBoardDAO
 * Author      : YoonGaYoung
 * Created Date: 2023. 11. 23.
 * Version: 1.0
 * Purpose:   board
 * Description: 게시판
 */
@Mapper
public interface IBoardDAO {

	public BoardVO getBoard(int boardNo);                    /*게시글 상세 조회*/
	public List<BoardVO> searchBoardList(SearchVO search);   /*검색어 기반 게시글 목록 조회*/
	public int writeBoard(BoardVO board);                    /*게시글 생성*/
	public int updateBoard(BoardVO board);                   /*게시글 수정*/
	public int deleteBoard(int boardNo);                     /*게시글 삭제*/
//	public int increaseLike (int boardNo);                   /*좋아요 증가*/
	public int increaseHit(int boNo);                         /*조회수 증가*/
	public int getTotalRowCount(SearchVO searchVO);           /*목록 건수 조회*/

	public List<BoardVO> noticeBoList();					 /*공지글 만 조회*/
	public int writeNoticeBo(BoardVO board);				 /*공지글  작성*/
	public int updateNoticeBo(BoardVO board);				 /*공지 내리기*/
	
	
	public int clickLike(BoardVO vo);						/*좋아요 누르기*/
	public int cancelLike(BoardVO vo);						/*좋아요 취소*/
	public int getLikeCount(BoardVO vo);					/*좋아요 수 조회*/
	
}
