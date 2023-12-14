<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트 
 * 2. 작성일 : 2023. 12. 1. 오전 10:34:48
 * 3. 작성자 : LeeGyuHwan
 * 4. 화면ID : 
 * 5. 화면명 : myPage
 * 6. 설명 : 마이페이지 및 수정
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
<!-- 부트 스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/admin.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/noGirdMain.css"
	rel="stylesheet" />

</head>

<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>
			<div class="main-contain">
				<div class="top">
					<div class="top-left">
						<h1 class="title">마이 페이지</h1>
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
				<div class="bottom"
					style="display: flex; background-color: #161A45; border-radius: 10px; padding: 20px;">
					<div class="board-list"
						style="background-color: white; width: 100%; border-radius: 10px; padding: 1%">
				<div class="container mt-4">
					<div class="row">
						<div class="col-md-6">
							<h3>내정보</h3>
							<form id="myForm"
								action="${pageContext.request.contextPath}/updateMemDo"
								method="post">
								<table class="table table-bordered table-striped table-hover">
									<tbody>
										<tr>
											<th>고유번호</th>
											<td>${memView.memId}</td>
										</tr>
										<tr>
											<th>유저아이디</th>
											<td><input type="text" id="userId" name="userId"
												class="form-control" value="${memView.userId}" readonly></td>
										</tr>
										<tr>
											<th>유저닉네임</th>
											<td><input type="text" id="usernm" name="userNm"
												class="form-control" value="${memView.userNm}"></td>
										</tr>
										<tr>
											<th>유저비밀번호</th>
											<td><input type="password" id="userpw" name="userPw"
												class="form-control" value="" placeholder=" 4자이상"></td>
										</tr>
										<tr>
											<th>비밀번호확인</th>
											<td><input type="password" id="pw" class="form-control"
												value="" placeholder=" 4자이상"></td>
										</tr>
										<tr>
											<th>가구원수</th>
											<td>
												<div class="user-box">
													<select name="memNo">
														<option value="1" ${memView.memNo == 1 ? 'selected' : ''}>1인가구</option>
														<option value="2" ${memView.memNo == 2 ? 'selected' : ''}>2~3인가구</option>
														<option value="3" ${memView.memNo == 3 ? 'selected' : ''}>4인이상</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>직업유형</th>
											<td>
												<div class="user-box">
													<select name="jobType">
														<option value="1"
															${memView.jobType == 1 ? 'selected' : ''}>외벌이</option>
														<option value="2"
															${memView.jobType == 2 ? 'selected' : ''}>맞벌이</option>
														<option value="3"
															${memView.jobType == 3 ? 'selected' : ''}>노령(상주)</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>주거형태</th>
											<td>
												<div class="user-box">
													<select name="houseType">
														<option value="1"
															${memView.houseType == 1 ? 'selected' : ''}>아파트</option>
														<option value="2"
															${memView.houseType == 2 ? 'selected' : ''}>단독주택</option>
														<option value="3"
															${memView.houseType == 3 ? 'selected' : ''}>빌라</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>주거면적</th>
											<td>
												<div class="user-box">
													<select name="houseArea">
														<option value="1"
															${memView.houseArea == 1 ? 'selected' : ''}>80㎡(24평)이하</option>
														<option value="2"
															${memView.houseArea == 2 ? 'selected' : ''}>116㎡(35평)이하</option>
														<option value="3"
															${memView.houseArea == 3 ? 'selected' : ''}>116㎡(35평)초과</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>지역</th>
											<td>
												<div class="user-box">
													<select name="region">
														<option value="1" ${memView.region == 1 ? 'selected' : ''}>순천시</option>
														<option value="2" ${memView.region == 2 ? 'selected' : ''}>목포시</option>
														<option value="3" ${memView.region == 3 ? 'selected' : ''}>여수시</option>
														<option value="4" ${memView.region == 4 ? 'selected' : ''}>광양시</option>
														<option value="5" ${memView.region == 5 ? 'selected' : ''}>나주시</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>유저생성날짜</th>
											<td>${memView.userDt}</td>
										</tr>
									</tbody>
								</table>
								<!-- 수정, 삭제 버튼 추가 -->
								<button type="submit" class="btn btn-success">회원수정</button>
								<button type="button" class="btn btn-danger"
									onclick="deleteUser()">회원탈퇴</button>
							</form>
						</div>
						<div class="col-md-6">
							<h3>포인트 사용 기록</h3>

							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>날짜</th>
										<th>품목</th>
										<th>금액</th>
										<th>잔여 포인트</th>
									</tr>
								</thead>
								<tbody>
									<!-- 여기에 포인트 사용 기록을 반복하여 출력하는 코드 추가 -->
									<c:forEach var="point" items="${pointInfo}" varStatus="loop">
										<c:if test="${loop.index < 10}">
											<tr>
												<td>${point.dt}</td>
												<td>${point.userId}</td>
												<td>${point.point}</td>
												<td>${point.totalPoints}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				</div>
</body>
<script>
	/* 마이페이지 로그아웃 경로 */
	function redirectToMyPage() {
		var targetUrl = "${pageContext.request.contextPath}/myPageView";
		window.location.href = targetUrl;
	}
	function redirectTologout() {
		var targetUrl = "${pageContext.request.contextPath}/logoutDo";
		window.location.href = targetUrl;
	}
	function deleteUser() {
		// 유저 삭제 전 확인 다이얼로그 등을 표시할 수 있음
		var confirmDelete = confirm("정말로 삭제하시겠습니까?");

		if (confirmDelete) {
			// memId를 어떻게 가져올지에 대한 로직을 추가해야 합니다.
			var memId = "${memView.memId}";

			// 삭제를 서버로 요청하는 Ajax 요청 등을 사용할 수 있습니다.
			// 아래는 기본적인 예시입니다.
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/userDelete",
				data : {
					memId : memId
				},
				success : function(response) {
					// 성공 시 어떤 처리를 할지 정의
					// 예: 삭제 후 페이지 리로드 또는 메시지 표시 등
					location.reload(); // 페이지 리로드 예시
				},
				error : function(error) {
					// 오류 시 어떤 처리를 할지 정의
				}
			});
		}
	}
	$(document).ready(function() {
		$('#myForm').submit(function(event) {
			validateAndUpdate();
			// 	            return false;
			// 폼 제출 전 유효성 검사 수행
			if (!validateAndUpdate()) {
				event.preventDefault(); // 폼 제출을 막음
			}
		});

		function validateAndUpdate() {
			var userPw = $('#userpw').val();
			var pw = $('#pw').val();

			// 비밀번호가 입력되었는지 확인
			if ($.trim(userPw) === '') {
				// 비밀번호를 입력하지 않은 경우, 기존 비밀번호를 사용하도록 값 변경
				$('#userpw').attr('disabled', 'disabled');
				$('#pw').attr('disabled', 'disabled');
				alert('수정되었습니다.');
				return true; // 제출을 허용
			} else if (userPw.length < 4) {
				// 비밀번호가 4자 이상인지 확인
				alert('비밀번호는 4자 이상이어야 합니다.');
				return false; // 제출을 막음
			}
			return true; // 비밀번호가 유효하면 제출 허용
		}
	});
</script>
</html>