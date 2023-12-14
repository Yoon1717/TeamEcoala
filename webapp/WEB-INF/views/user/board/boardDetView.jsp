<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 24. 오전 9:15:59
 * 3. 작성자 : YoonGaYoung
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 게시글 상세 내용 보기 페이지
 * 6. 설명 : 화면명과 동일하거나 기타 특이사항 기술
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/boardDetView.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/noGirdMain.css"
	rel="stylesheet" />

<style>
</style>
</head>
<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>

			<div class="main-contain">
				<!--START: top -->
				<div class="top">
					<div class="top-left">
						<h1 class="title">게시판</h1>
					</div>
					<div class="top-center"></div>
					<div class="top-right">
						<div class="right-logout">
							<div class="top-logout"></div>
							<div class="bottom-logout"></div>
						</div>
						<div class="right-mypage">
							<div class="top-mypage">
								<div class="left2-mypage">
									<img class="img-mypage"
										src="${pageContext.request.contextPath}/assets/img/mypage.png"
										alt="" onclick="redirectToMyPage()">

								</div>
								<div class="right2-mypage">
									<img class="img-logout"
										src="${pageContext.request.contextPath}/assets/img/logout.png"
										alt="" onclick="redirectTologout()">
								</div>
							</div>
							<c:if test="${sessionScope.login != null}">
								<div class="bottom-mypage">
									<div class="left2-mypage">
										<b class="text-1">${sessionScope.login.userId}님</b>
									</div>
									<div class="right2-mypage">
										<b class="text-2">Logout </b>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<!--END: top -->
				<div class="bottom">
					<div class="container">
						<div class="board-top">
							<!-- 제목, 작성자, 조회수 정보 -->
							<p class="board-title"
								style="float: left; font-weight: bold; padding-left: 4%; font-size: x-large;">제목 :  ${board.boardTitle }</p>
							<div style="display: flex;">
								<table class="board-info" style="font-size: small;">
									<thead>
										<tr>
											<th>작성자</th>
											<th>작성시간</th>
											<th>조회수</th>
											<th>좋아요</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${board.userId }</td>
											<td>${board.boardDt }</td>
											<td>${board.boardHit }</td>
											<td>${board.likeCount }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="board-main">
							<div style="margin-left: 5px; font-size: large;">

								<!-- 게시글 내용 -->
								${board.boardContent }
								<!-- 내용이 길어질 경우 스크롤이 생성됩니다. -->
							</div>
						</div>

						<div class="board-bottom"
							style="display: flex; justify-content: space-between; align-items: center;">
							<div style="display: flex; padding-left:46%">
							<%-- <input type="hidden" id="userId" value="${sessionScope.login.userId}" /> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${board.likeState == 'N' or board.likeState == null }"> --%>
									<!-- 상태:좋아요 안누름 / 누르면 좋아요  -->
										<div id="likeDiv" style="background-color: rgba(255, 255, 255, 0.7); border-radius: 30px; align-items: center; display:none;">
											<img id="clickLikeButton" 
												src="./assets/img/board_like-clear.png" alt="좋아요버튼"
												style="width: 70px; height: 70px;">
										</div>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
									<!-- 상태:좋아요 누름 / 누르면 좋아요  취소 -->
										<div id="unlikeDiv" style="background-color: pink; border-radius: 30px; align-items: center; display:none;">
											<img id="cancelLikeButton" src="./assets/img/board_like-clear.png" alt="좋아요버튼"
												style="width: 70px; height: 70px;">
										</div>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
							</div>
							
							<c:if test="${sessionScope.login.userId == board.userId }">
								<div class="" style="display: flex;">
									<form action="<c:url value="/boardEditView"/>" method="post">
										<input type="hidden" name="boardNo" value="${board.boardNo}">
										<button type="submit" class="btn"
											style="border: none; background-color: rgb(118, 118, 198); width: 80px; height: 50px; border-radius: 13px; color: white; font-size: 20px; font-weight: 600;">수정</button>
									</form>
									<form action="<c:url value="/boardDel"/>" method="post">
										<input type="hidden" name="boardNo" value="${board.boardNo}">
										<button type="submit" class="btn btn-danger me-2"
											style="border: none; background-color: rgb(118, 118, 198); width: 80px; height: 50px; border-radius: 13px; color: white; font-size: 20px; font-weight: 600;">삭제</button>
									</form>
								</div>
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/topMeun.js"></script>
	<script>
function redirectToMyPage() {
    // 여기에 이동하고자 하는 URL을 설정합니다.
    var targetUrl = "${pageContext.request.contextPath}/myPageView";

    // 설정한 URL로 이동합니다.
    window.location.href = targetUrl;
}
// 로그아웃 클릭시  이동
function redirectTologout() {
    // 여기에 이동하고자 하는 URL을 설정합니다.
    var targetUrl = "${pageContext.request.contextPath}/logoutDo";

    // 설정한 URL로 이동합니다.
    window.location.href = targetUrl;
}

$(document).ready(function(){
	
	var flag = "${board.likeState}"	;
	if(flag=='Y'){
		$("#likeDiv").hide();
		$("#unlikeDiv").show();
	}else{
		$("#unlikeDiv").hide();
		$("#likeDiv").show();
	}
	console.log(flag);
	$('#unlikeDiv').click(function(){
		$.ajax({
			 url: '/clickLikeDo'
			,method: 'POST'
			,data: {boardNo: '${board.boardNo}', userId:'${sessionScope.login.userId}'}
			,success: function(res){
				console.log("좋아요 성공!!");
				$("#unlikeDiv").hide();
				$("#likeDiv").show();
			},
			error: function(error){
				console.error("좋아요 처리 실패: " + error);
			}
		});
	});
	$('#likeDiv').click(function(){
		$.ajax({
			 url: '/cancelLikeDo'
			,method: 'POST'
			,data: {boardNo: '${board.boardNo}', userId: '${sessionScope.login.userId}'}
			,success: function(res){
				console.log("좋아요 취소!!");
				$("#unlikeDiv").show();
				$("#likeDiv").hide();
			},
			error: function(error){
				console.error("좋아요 취소 처리 실패: " + error);
			}
		});
	});
});
</script>
</body>
</html>