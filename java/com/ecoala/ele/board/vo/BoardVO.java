package com.ecoala.ele.board.vo;

/**
 * Class Name  : BoardVO
 * Author      : YoonGaYoung
 * Created Date: 2023. 11. 23.
 * Version: 1.0
 * Purpose:   게시판 VO
 * Description: board 테이블 
 */
public class BoardVO {
	
	private int    boardNo;        /*글 번호*/
	private String userId;         /*작성자 명*/
	private String boardTitle;     /*글 제목*/
	private String boardContent;   /*글 내용*/
	private String boardDt;        /*등록 일자*/
	private String boardModDt;     /*수정 일자*/
	private String boardYn;        /*삭제 여부*/
//	private int    boardLike;      /*좋아요 수*/
	private int    boardHit;       /*조회 수*/
	private int	   boardType;	   /*게시글 타입 || 공지글 : 0 || 일반 게시글 : 1*/
	
	private String likeState;		/*좋아요 상태*/
//	private String cr_dt;			/*좋아요 생성일*/
//	private String up_dt;			/*좋아요 수정일*/
	private int likeCount;			/*게시글의 좋아요 수*/
	
	public BoardVO() {
		super();
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", userId=" + userId + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardDt=" + boardDt + ", boardModDt=" + boardModDt + ", boardYn=" + boardYn
				+ ", boardHit=" + boardHit + ", boardType=" + boardType + ", likeState=" + likeState + ", likeCount="
				+ likeCount + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDt() {
		return boardDt;
	}

	public void setBoardDt(String boardDt) {
		this.boardDt = boardDt;
	}

	public String getBoardModDt() {
		return boardModDt;
	}

	public void setBoardModDt(String boardModDt) {
		this.boardModDt = boardModDt;
	}

	public String getBoardYn() {
		return boardYn;
	}

	public void setBoardYn(String boardYn) {
		this.boardYn = boardYn;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getLikeState() {
		return likeState;
	}

	public void setLikeState(String likeState) {
		this.likeState = likeState;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	
	
	
	
	
	

}
