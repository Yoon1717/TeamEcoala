<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 28. 오전 10:50:53
 * 3. 작성자 : yejunseo 
 * 4. 화면ID : 
 * 5. 화면명 : 관리자 회원관리 페이지
 * 6. 설명 : 
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ecoala</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 부트 스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>

<link href="${pageContext.request.contextPath}/css/admin.css"
	rel="stylesheet" />
<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/mngrLeft.jsp"%>

			<div class="main-contain">
				<div class="top">
					<div class="top-left">
						<h1 class="title">Admin</h1>
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
				<!-- 게시판 css -->
				<div class="bottom"
					style="display: flex; background-color: #161A45; border-radius: 10px; padding: 20px;">
					<div class="board-list"
						style="background-color: #E0F4FF; width: 100%; border-radius: 10px; padding: 1%">
						<!-- START : 검색 폼 -->
						<div class="board-top">
							<div class=input-group
								style="gap: 10px; justify-content: center; height: 40px;">
								<form name="search" action="mngrMemList" method="post">
									<input type="hidden" name="curPage"
										value="${searchVO.curPage }"> <input type="hidden"
										name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
									<div class="search-bar" style="display: flex; height: 40px;">
										<select id="id_board_searchOption" name="searchOption"
											class="form-select" aria-label="Default select example"
											style="width: fit-content;">
											<option value="userId"
												${searchVO.searchOption eq "userId" ? "selected='selected'": "" }>유저
												아이디</option>
											<option value="userNm"
												${searchVO.searchOption eq "userNm" ? "selected='selected'": "" }>유저
												닉네임</option>
										</select> <input class="form-control" name="searchWord" type="search"
											placeholder="Search for.." aria-label="search"
											value="${searchVO.searchWord }" />
										<button type="submit" class="btn btn-outline-info"
											style="width: 100px;">검색</button>
									</div>
								</form>
							</div>
							<!-- 건수 출력 -->
							<div class="row justify-content-md-end">
								<div class="col-sm-2">
									<div class="input-group">
										<label class="form-control input-sm">총
											${searchVO.totalRowCount } 건</label> 
									</div>
								</div>
							</div>
						</div>
						<div class="container mt-4">
							<div class="row">
								<div class="col">
									<table class="table table-bordered table-striped table-hover">
										<thead>
											<tr>
												<th class="text-center">유저아이디</th>
												<th class="text-center">유저닉네임</th>
												<th class="text-center">유저생성날짜</th>
												<th class="text-center">유저삭제여부</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${memList}" var="mem">
												<tr class="text-center">
													<td><a href="#" onclick="go_user('${mem.userId }')">${mem.userId }</a></td>
													<td>${mem.userNm }</td>
													<td>${mem.userDt }</td>
													<td>${mem.delYn }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- START : 페이지네이션 + 글쓰기버튼 -->
							<div class="container board-bottom"
								style="align-items: center; height: 40px;">

								<!-- 페이지네이션 -->
								<div>
									<!-- <nav class="" aria-label="Page navigation example"> -->
									<ul class="pagination"
										style="display: flex; justify-content: center; align-items: center; height: 100%;
										padding-right: 5px; margin-top:40px;">
										<!-- <ul class="pagination" style="height: 40px; padding-right: 5px;"> -->
										<!-- 이전 페이지 -->
										<c:if test="${searchVO.firstPage !=1 }">
											<li class="page-item"><a class="page-link"
												href="mngrMemList?curPage=${searchVO.firstPage-1 }"
												data-page="${searchVO.firstPage-1 }" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<!-- 특정페이지 이동 -->
										<c:forEach begin="${searchVO.firstPage }"
											end="${searchVO.lastPage }" var="i">
											<c:if test="${searchVO.curPage != i }">
												<li class="page-item"><a class="page-link"
													href="mngrMemList?curPage=${i}" data-page="${i}">${i}</a></li>
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
												href="mngrMemList?curPage=${searchVO.lastPage+1 }"
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
					<!-- 스크립트 추가 부분 -->
					<script>
					
						$(document).ready(function() {
						// Logout 버튼을 클릭했을 때
						$('.img-logout').click(function() 
						{// 로그아웃 처리 후 원하는 경로로 이동
						window.location.href = 
						"${pageContext.request.contextPath}/logoutDo";
						});
					});
					</script>
					<!-- 부트 스트랩 -->
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
						crossorigin="anonymous"></script>
					<script>
						function go_user(id){
							    var new_form = $('<form></form>');
						        new_form.attr("method", "post");
						        new_form.attr("action", '<c:url value="/admin/mngrmemView"/>');
						        new_form.append($('<input/>', {type: 'hidden', name: 'userId', value: id}));
						        new_form.appendTo('body');
						        new_form.submit();
						}
					   
					</script>
</body>
</html>