<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 23. 오후 4:27:01
 * 3. 작성자 : YoonGaYoung
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 화면정의서의 화면명
 * 6. 설명 : 화면명과 동일하거나 기타 특이사항 기술
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 부츠스트렙 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/css/noGirdMain.css"
	rel="stylesheet" />

<style>
table {
	width: 100%;
	table-layout: fixed;
}

.tbl-header {
	background-color: rgba(255, 255, 255, 0.3);
}

.tbl-content {
	height: 470px;
	overflow-x: auto;
	margin-top: 0px;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.tbl-content td {
	height: 47px;
}

th {
	background-color : #6d75d0;
	padding: 15px 10px;
	text-align: left;
	font-weight: 500;
	font-size: 12px;
	color: #fff;
	text-transform: uppercase;
	font-weight: bolder;
	font-size: 14px;
	text-align: center;
}

td {
	padding: 10px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 12px;
	color: black;
	border-bottom: solid 1px rgba(255, 255, 255, 0.1);
	font-weight: bold;
	font-size: 12px;
	text-align: center;
}

.boardTitleTag:not(.logo):hover {
      background-color: #dbf7d88c;
      color: #ffffff;
      padding: 15px;
      border-radius: 20px;
    }
    
.text-left{
	 text-align: left;
	 padding-left: 8%;
}

   
</style>
<!-- 페이지 접속시에 전달받은 message를 띄워줌 -->
<c:if test="${not empty messageVO}">
	<script>
		var title = '${messageVO.title}';
		var message = '${messageVO.message}';
		alert(title + " " + message);
	</script>
</c:if>
</head>
<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>
			<div class="main-contain">
				<div class="top">
					<div class="top-left">
						<h1 class="title">게시판</h1>
					</div>
					<!-- 탑뷰 쪼개기 예상 파트 -------------------------------------------------------------------->
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
									<b class="text-1">${sessionScope.login.userId}님</b>
								</div>
								<div class="right2-mypage">
									<b class="text-2">Logout </b>
								</div>
							</div>
						</div>
					</div>
					<!-- 탑뷰 쪼개기 예상 파트 -------------------------------------------------------------------->
				</div>


				<div class="bottom"
					style="display: flex; background-color: #161A45; border-radius: 10px; padding: 20px;">
					<div class="board-list"
						style="background-color: white; width: 100%; border-radius: 10px; padding: 1%">

						<!-- START : 검색 폼 -->
						<div class="board-top">
							<div class=input-group
								style="gap: 10px; justify-content: center; height: 40px;">
								<form name="search" action="boardView" method="post">
									<input type="hidden" name="curPage"
										value="${searchVO.curPage }"> <input type="hidden"
										name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
									<div class="search-bar" style="display: flex; height: 40px;">
										<select id="id_board_searchOption" name="searchOption"
											class="form-select" aria-label="Default select example"
											style="width: fit-content;">
											<option value="title"
												${searchVO.searchOption eq "title" ? "selected='selected'": "" }>제목</option>
											<option value="userId"
												${searchVO.searchOption eq "userId" ? "selected='selected'": "" }>작성자</option>
											<option value="content"
												${searchVO.searchOption eq "content" ? "selected='selected'": "" }>내용</option>
										</select> <input class="form-control" name="searchWord" type="search"
											placeholder="Search for.." aria-label="search"
											value="${searchVO.searchWord }" />
										<button type="submit" class="btn btn-outline-info"
											style="width: 100px;">검색</button>
									</div>
								</form>
							</div>
							<!-- START : 목록 건수  -->
							<div class="input-group" style="justify-content: flex-end;">
								<div class="total-count"
									style="display: flex; height: 40px; width: max-content;">
									<label class="form-control input-sm"
										style="white-space: nowrap;"> 총
										${searchVO.totalRowCount } 건 </label> <select id="id_rowSizePerPage"
										name="rowSizePerPage" class="form-control">
										<c:forEach var="i" begin="10" end="50" step="10">
											<option value="${i }"
												${searchVO.rowSizePerPage eq i ? "selected='selected'" :"" }>
												${i }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>

						<!-- START : 게시글 리스트 -->
						<div class=" board-main" style="margin-top: 1%; margin-bottom: 1%">
							<div class="tbl-header">
								<table cellpadding="0" cellspacing="0" border="0">
									<colgroup>
										<col width="5%" />
										<col width="15%" />
										<col />
										<col width="13%" />
										<col width="7%" />
										<col width="7%" />
									</colgroup>
									<thead>
										<tr>
											<th>No</th>
											<th>작성자</th>
											<th class="table_title_line">제목</th>
											<th>작성일</th>
											<th>조회수</th>
											<th>좋아요</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="tbl-content" style="overflow-y: scroll;">
								<table cellpadding="0" cellspacing="0" border="0">
									<colgroup>
										<col width="5%" />
										<col width="15%" />
										<col />
										<col width="13%" />
										<col width="7%" />
										<col width="7%" />
									</colgroup>
									<tbody>
										<c:forEach items="${noticeBoList }" var="board">
											<tr class="" style="background-color: #cfd2f7; ho">
												<td>${board.boardNo }</td>
												<td>관리자</td>
												<td class="text-left "><a class="boardTitleTag" style="text-decoration: none; color: black;"
													href="<c:url value="/boardDetialView?boardNo=${board.boardNo }"/> ">[공지] ${board.boardTitle }</a>
												</td>
												<td>${board.boardModDt eq null ? board.boardModDt:board.boardModDt }</td>
												<td>${board.boardHit }</td>
												<td>${board.likeCount }</td>
											</tr>
										</c:forEach>
										<c:forEach items="${boardList }" var="board">
											<tr class="text-center">
												<td>${board.boardNo }</td>
												<td>${board.userId }</td>
												<td class="text-left "><a class="boardTitleTag" style="text-decoration: none; color: black;"
													href="<c:url value="/boardDetialView?boardNo=${board.boardNo }"/> ">${board.boardTitle }</a>
												</td>
												<td>${board.boardModDt eq null ? board.boardModDt:board.boardModDt }</td>
												<td>${board.boardHit }</td>
												<td>${board.likeCount }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- START : 페이지네이션 + 글쓰기버튼 -->
						<div class="container board-bottom"
							style="align-items: center; height: 40px;">
							<div style="justify-content: flex-end; margin-left: auto;">
								<a href="<c:url value="boardWriteView" />">
									<button id="writeBoard" type="button"
										class="btn btn-outline-info">글쓰기</button>
								</a>
							</div>
							<!-- 페이지네이션 -->
							<div>
								<!-- <nav class="" aria-label="Page navigation example"> -->
								<ul class="pagination"
									style="display: flex; justify-content: center; align-items: center; height: 100%; padding-right: 5px;">
									<!-- <ul class="pagination" style="height: 40px; padding-right: 5px;"> -->
									<!-- 이전 페이지 -->
									<c:if test="${searchVO.firstPage !=1 }">
										<li class="page-item"><a class="page-link"
											href="boardView?curPage=${searchVO.firstPage-1 }"
											data-page="${searchVO.firstPage-1 }" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<!-- 특정페이지 이동 -->
									<c:forEach begin="${searchVO.firstPage }"
										end="${searchVO.lastPage }" var="i">
										<c:if test="${searchVO.curPage != i }">
											<li class="page-item"><a class="page-link"
												href="boardView?curPage=${i}" data-page="${i}">${i}</a></li>
										</c:if>
										<c:if test="${searchVO.curPage == i }">
											<li class="page-item active"><a class="page-link"
												href="#" data-page="${i}">${i}</a></li>
										</c:if>
									</c:forEach>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<!-- 다음  페이지  -->
									<c:if test="${searchVO.lastPage!=searchVO.totalPageCount }">
										<li class="page-item"><a class="page-link"
											href="boardView?curPage=${searchVO.lastPage+1 }"
											data-page="${searchVO.lastPage+1 }" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
								<!-- </nav> -->
							</div>



						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">
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

	let search_form = $("form[name='search']");
	let cur_page = search_form.find('input[name="curPage"]');
	$(document).ready(
			function() {
				$("#id_rowSizePerPage").change(
						function() {
							cur_page.val(1);
							search_form.find('input[name="rowSizePerPage"]')
									.val($(this).val());
							search_form.submit();
						});

				search_form.find("button[type='submit']").click(function(e) {
					e.preventDefault(); //디폴트 행동취소 
					cur_page.val(1);
					search_form.submit();
					console.log("Form submitted!"); // 예제: 폼이 제출되었을 때 메시지 출력
				});

				$('ul.pagination li a[data-page]').click(function(e) {
					e.preventDefault();
					cur_page.val($(this).data('page'));
					search_form.submit();
					console.log("Pagination link clicked!"); // 예제: 페이지네이션 링크가 클릭되었을 때 메시지 출력
					console.log("Current Page: " + $(this).data('page')); // 예제: 현재 페이지 출력
				});

			});
</script>
</html>