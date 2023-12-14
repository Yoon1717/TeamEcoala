<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>탄소포인트</title>
<link href="${pageContext.request.contextPath}/css/point.css"
	rel="stylesheet" />
</head>


<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>
		</div>

		<div class="main-contain">
			<div class="top">
				<div class="top-left">
					<h1 class="title">탄소 포인트</h1>
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
									alt="">
							</div>
							<div class="right2-mypage">
								<img class="img-logout"
									src="${pageContext.request.contextPath}/assets/img/logout.png"
									alt="">
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
			<div class="bottom ">
				<div class="bottom-left-1">
					<div class="point-1">
						<div class="point-top">
							<div class="point-title">
								<b>탄소 포인트 부여</b>
							</div>
						</div>
						<div class="point-mid">
							<p class="text-4">
								<b>에너지 항목별 감축률에 따라 탄소포인트 매달 1회 부여.</b>
							</p>
							<table border="1" class="point-table-1">
								<th>감축률</th>
								<th>전기</th>
								<tr>
									<!-- 첫번째 줄 시작 -->
									<td>5% 이상 ~10% 미만</td>
									<td>500 P</td>
								</tr>
								<!-- 첫번째 줄 끝 -->
								<tr>
									<!-- 두번째 줄 시작 -->
									<td>10% 이상 ~ 15% 미만</td>
									<td>1,000 P</td>
								</tr>
								<!-- 두번째 줄 끝 -->
								<tr>
									<td>15% 이상</td>
									<td>1,500 P</td>
								</tr>
							</table>
						</div>
						<div class="point-bottom">
							<p class="text-5">
								<b> 4회 이상 연속 감축자 다음 반기부터 0%초과 ~5% 미만 감축 시 포인트 부여</b>
							</p>
							<table border="1" class="point-table-2">
								<th>감축률</th>
								<th>전기</th>
								<tr>
									<!-- 첫번째 줄 시작 -->
									<td>0% 초과 ~ 5% 미만</td>
									<td>300 P</td>
								</tr>
								<!-- 첫번째 줄 끝 -->

							</table>
						</div>
					</div>
				</div>
				<div class="bottom-right-1">
					<div class="point-2">
						<h2 class="text-6">보유 포인트</h2>
						<div>
							<img src="${pageContext.request.contextPath}/assets/img/coin.png"
								alt="" class="coin">
							<div class="point-all" style="display: flex;">
								<div class="all-left" style="flex: 3;">
									<b class="points-all-1"
										style="color: white; font-size: 48px; margin-left: 80px;">${result.totalPoints}</b>
								</div>
								<div class="all-right" style="flex: 1;">
									<b class="points-all"
										style="font-size: 48px; color: white; margin-left: 33px;">P</b>
								</div>
							</div>
						</div>
					</div>
					<div class="point-3">
						<div class="point-3-top">
							<h2 class="text-6">상품 교환</h2>
						</div>
						<div class="point-3-bottom">
							<div class="one">
								<div class="one-1">
									<img
										src="${pageContext.request.contextPath}/assets/img/money.png"
										alt="" class="money">
								</div>
								<h2 class="text-8">현금</h2>
								<div class="one-2">
									<h2 class="text-9">5,000P</h2>
								</div>
								<div class="one-3">
									<div>
										<button class="exchange" id="change">교환</button>
									</div>
								</div>
							</div>
							<div class="two">
								<div class="two-1">
									<img
										src="${pageContext.request.contextPath}/assets/img/bag.png"
										alt="" class="bag">
								</div>
								<h2 class="text-8">에코백</h2>
								<div class="two-2">
									<h2 class="text-10">8,000P</h2>
								</div>
								<div class="two-3">
									<button class="exchange-2" id="change2">교환</button>
								</div>
							</div>
							<div class="three">
								<div class="three-1">
									<img
										src="${pageContext.request.contextPath}/assets/img/cup.png"
										alt="" class="cup">
								</div>
								<h2 class="text-11">텀블러</h2>
								<div class="three-2">
									<h2 class="text-10">7,000P</h2>
								</div>
								<div class="three-3">
									<button class="exchange-3" id="change3">교환</button>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>

	</div>

</body>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script>
	$(document).ready(function() {
		// 버튼 클릭 이벤트에 ajax 호출 추가
		$("#change").on("click", function() {

			let proudctPrice = 5000;

			$.ajax({
				url : '<c:url value="/getPoint" />',
				type : 'POST',
				dataType : 'json',
				success : function(user) {
					console.log(user);
					if (user.totalPoints >= proudctPrice) {
						if (confirm("정말로 교환하시겠습니까??")) {
							$.ajax({
								url : '<c:url value="/cboPointDo"/>',
								type : 'POST',
								contentType : 'application/json', // 데이터 전송 형식 지정
								dataType : 'json', // 서버에서 받아올 데이터 형식 지정
								data : JSON.stringify({
									proudctPrice : -proudctPrice,
									productCode : 1
								}), // 보낼 데이터를 JSON 문자열로 변환 
								success : function(res) {
									console.log(res); // 성공 시 서버에서 받은 데이터 출력
								},
								error : function(xhr, status, error) {
									console.error('AJAX 오류: ' + status, error);
								}
							});
						}
					} else {
						alert("포인트가 부족하여 교환할 수 없습니다.")
					}
				},
				error : function(xhr, status, error) {
					console.error('AJAX 오류: ' + status, error);

				}
			});
		});
		let proudctPrice1 = 8000;
		$("#change2").on("click", function() {

			$.ajax({
				url : '<c:url value="/getPoint" />',
				type : 'POST',
				dataType : 'json',
				success : function(user) {
					if (user.totalPoints >= proudctPrice1) {
						if (confirm("정말로 교환하시겠습니까??")) {
							$.ajax({
								url : '<c:url value="/cboPointDo"/>',
								type : 'POST',
								contentType : 'application/json', // 데이터 전송 형식 지정
								dataType : 'json', // 서버에서 받아올 데이터 형식 지정
								data : JSON.stringify({
									proudctPrice : -proudctPrice1,
									productCode : 2
								}), // 보낼 데이터를 JSON 문자열로 변환 
								success : function(res) {
									console.log(res); // 성공 시 서버에서 받은 데이터 출력
								},
								error : function(xhr, status, error) {
									console.error('AJAX 오류: ' + status, error);
								}
							});

						}

					} else {
						alert("포인트가 부족하여 교환할 수 없습니다.")
					}

				},
				error : function(xhr, status, error) {
					console.error('AJAX 오류: ' + status, error);
				}
			});
		});
		let proudctPrice2 = 7000;

		$("#change3").on("click", function() {

			$.ajax({
				url : '<c:url value="/getPoint" />',
				type : 'POST',
				dataType : 'json',
				success : function(user) {
					if (user.totalPoints >= proudctPrice1) {
						if (confirm("정말로 교환하시겠습니까??")) {
							$.ajax({
								url : '<c:url value="/cboPointDo"/>',
								type : 'POST',
								contentType : 'application/json', // 데이터 전송 형식 지정
								dataType : 'json', // 서버에서 받아올 데이터 형식 지정
								data : JSON.stringify({
									proudctPrice : -proudctPrice2,
									productCode : 3
								}), // 보낼 데이터를 JSON 문자열로 변환 
								success : function(res) {
									console.log(res); // 성공 시 서버에서 받은 데이터 출력
								},
								error : function(xhr, status, error) {
									console.error('AJAX 오류: ' + status, error);
								}
							});

						}

					} else {
						alert("포인트가 부족하여 교환할 수 없습니다.")
					}

				},
				error : function(xhr, status, error) {
					console.error('AJAX 오류: ' + status, error);
				}
			});

		});
	});
</script>

</html>