<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트 
 * 2. 작성일 : 2023. 11. 28. 오후 5:03:17
 * 3. 작성자 : LeeGyuHwan
 * 4. 화면ID : 
 * 5. 화면명 : mngrMemView
 * 6. 설명 : 관리자 회원 상세정보 조회 페이지
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
				<div class="bottom"
					style="display: flex; background-color: #161A45; border-radius: 10px; padding: 20px;">
					<div class="board-list"
						style="background-color: #E0F4FF; width: 100%; border-radius: 10px; padding: 1%">
						<div class="container mt-4">
							<div class="row" style="padding-top: 100px;">
								<div class="col">
									<table class="table table-bordered table-striped table-hover">
										<thead>
											<tr>
												<th class="text-center">고유번호</th>
												<th class="text-center">유저아이디</th>
												<th class="text-center">유저닉네임</th>
												<th class="text-center">가구원수</th>
												<th class="text-center">직업유형</th>
												<th class="text-center">주거형태</th>
												<th class="text-center">주거면적</th>
												<th class="text-center">지역</th>
												<th class="text-center">유저생성날짜</th>
												<th class="text-center">유저삭제여부</th>
											</tr>
										</thead>
										<tbody>
											<tr class="text-center">
												<td>${memView.memId }</td>
												<td>${memView.userId }</td>
												<td>${memView.userNm }</td>
												<td id="memNoValue">${memView.memNo }</td>
												<td id="jobTypeValue">${memView.jobType }</td>
												<td id="houseTypeValue">${memView.houseType }</td>
												<td id="houseAreaValue">${memView.houseArea }</td>
												<td id="regionValue">${memView.region }</td>
												<td>${memView.userDt }</td>
												<td>${memView.delYn }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
					<!-- 삭제 버튼 추가 -->
					<button type="button" class="btn btn-danger" onclick="deleteUser()">유저삭제</button>
						</div>
					</div>
</body>
<script>
	function deleteUser() {
		// 유저 삭제 전 확인 다이얼로그 등을 표시할 수 있음
		var confirmDelete = confirm("정말로 이 회원을 삭제하시겠습니까?");

		if (confirmDelete) {
			// memId를 어떻게 가져올지에 대한 로직을 추가해야 합니다.
			var memId = "${memView.memId}";

			// 삭제를 서버로 요청하는 Ajax 요청 등을 사용할 수 있습니다.
			// 아래는 기본적인 예시입니다.
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/memDelete",
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
	var memNoValue = document.getElementById('memNoValue');

	// 가구원수에 따라 텍스트 설정
	if ('${memView.memNo}' == 1) {
		memNoValue.innerText = '1인';
	} else if ('${memView.memNo}' == 2) {
		memNoValue.innerText = '2~3인';
	} else if ('${memView.memNo}' == 3) {
		memNoValue.innerText = '4인이상';
	}
	var jobTypeValue = document.getElementById('jobTypeValue');
	// 직업유형에 따라 텍스트 설정
	if ('${memView.jobType}' == 1) {
		jobTypeValue.innerText = '외벌이';
	} else if ('${memView.jobType}' == 2) {
		jobTypeValue.innerText = '맞벌이';
	} else if ('${memView.jobType}' == 3) {
		jobTypeValue.innerText = '노령(상주)';
	}
	var houseTypeValue = document.getElementById('houseTypeValue');
	// 집 유형에 따라 텍스트 설정
	if ('${memView.houseType}' == 1) {
		houseTypeValue.innerText = '단독주택';
	} else if ('${memView.houseType}' == 2) {
		houseTypeValue.innerText = '아파트';
	} else if ('${memView.houseType}' == 3) {
		houseTypeValue.innerText = '빌라';
	}
	var houseAreaValue = document.getElementById('houseAreaValue');
	// 집 면적에 따라 텍스트 설정
	if ('${memView.houseArea}' == 1) {
		houseAreaValue.innerText = '80㎡(24평)이하';
	} else if ('${memView.houseArea}' == 2) {
		houseAreaValue.innerText = '116㎡(35평)이하';
	} else if ('${memView.houseArea}' == 3) {
		houseAreaValue.innerText = '116㎡(35평)초과';
	}
	var regionValue = document.getElementById('regionValue');
	// 주거지역에 따라 텍스트 설정
	if ('${memView.region}' == 1) {
		regionValue.innerText = '순천시';
	} else if ('${memView.region}' == 2) {
		regionValue.innerText = '목포시';
	} else if ('${memView.region}' == 3) {
		regionValue.innerText = '여수시';
	} else if ('${memView.region}' == 4) {
		regionValue.innerText = '광양시';
	} else if ('${memView.region}' == 5) {
		regionValue.innerText = '나주시';
	}
</script>
</html>