<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 12. 12. 오후 12:06:59
 * 3. 작성자 : YoonGaYoung
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 화면정의서의 화면명
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
<title>게시글 상세 보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/boardDetView.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/noGirdMain.css"
	rel="stylesheet" />
</head>
<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/mngrLeft.jsp"%>

			<div class="main-contain">
				<div class="top">
					<div class="top-left">
						<h1 class="title">게시판 관리</h1>
					</div>
					<div class="top-center"></div>
					<div class="top-right">
						<div class="right-logout">
							<div class="top-logout"></div>
							<div class="bottom-logout"></div>
						</div>
						<div class="right-mypage">
							<div class="top-mypage">
								<div class="right2-mypage">
									<img class="img-logout"
										src="${pageContext.request.contextPath}/assets/img/logout.png"
										alt="">
								</div>
							</div>
							<div class="bottom-mypage">
								<div class="right2-mypage">
									<b class="text-2">Logout</b>
								</div>
							</div>
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
							<div class="" style="display: flex;">
								<form action="<c:url value="/admin//mngrBoardDelDo"/>" method="post">
									<input type="hidden" name="boardNo" value="${board.boardNo}">
									<button type="submit" class="btn btn-danger me-2"
										style="border: none; background-color: rgb(118, 118, 198); width: 80px; height: 50px; border-radius: 13px; color: white; font-size: 20px; font-weight: 600;">삭제</button>
								</form>
								<c:if test="${board.boardType == 0 }">
									<form action="<c:url value="/admin/noticeBoUpdateDo"/>" method="post">
										<input type="hidden" name="boardNo" value="${board.boardNo}">
										<button type="submit" class="btn btn-danger me-2"
											style="border: none; background-color: rgb(118, 118, 198); width: 140px; height: 50px; border-radius: 9px; color: white; font-size: 20px; font-weight: 600;">공지 내리기</button>
									</form>
								</c:if>
							</div>
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
</script>
</body>
</html>