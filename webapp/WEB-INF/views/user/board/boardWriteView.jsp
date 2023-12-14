<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 28. 오후 2:45:26
 * 3. 작성자 : YoonGaYoung
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 게시글 작성 페이지
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
<title>게시글 작성 페이지</title>
<link href="${pageContext.request.contextPath}/css/noGirdMain.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/boardWrite.css"
	rel="stylesheet" />

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
							<div class="bottom-mypage">
								<div class="left2-mypage">
									<b class="text-1">My Page</b>
								</div>
								<div class="right2-mypage">
									<b class="text-2">Logout </b>
								</div>
							</div>
						</div>
					</div>
					<!-- 탑뷰 쪼개기 예상 파트 -------------------------------------------------------------------->
				</div>

				<!--END: top -->
				<div class="bottom">
					<form action="<c:url value="/boardWriteDo" />" method="post">
						<div class="container">
							<div class="board-top">
								<label for="title">제목</label> <input class="form-control"
									id="title" name="boardTitle" type="text" />
							</div>
							<div class="board-main">
								<textarea class="form-control" name="boardContent"></textarea>
							</div>
							<div class="board-bottom">
								<div class="bo-bot-button">
									<button type="submit">등록</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>
		// 마이페이지 클릭시 마이페이지로 이동
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