<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 12. 4. 오후 2:46:49
 * 3. 작성자 : YoonGaYoung
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 요금 계획하기 페이지
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
<title>요금 계획하기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/splitMainCss/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/splitMainCss/eletric.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/splitMainCss/top.css">

<link href="${pageContext.request.contextPath}/css/billPlanView.css"
	rel="stylesheet" />


</head>

<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>
			<div class="main-contain">
				<div class="top">
					<div class="top-left">
						<h1 class="title">요금 계획하기</h1>
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


				<div class="bottom ">
					<div class="bottom-left-1">
						<div class="point-2">
							<!-- 이번달 요금 계획 table -->
							<div id="billPlanClac">
								<h1 style="position: fixed;">이번 달 요금 계획</h1>
								<!-- eleToBill 전력량이 요금으로 -->
								<table id="billPlanFormTable" cellpadding="0" cellspacing="0"
									border="0">
									<colgroup>
										<col width="40%" />
										<col width="60%" />
									</colgroup>
									<tr class="bpf-tr">
										<td class="bpf-td1">목표금액</td>
										<td class="bpf-td2"><input type="text" id="eleBTE-input"
											placeholder="금액을 입력"> 원</td>
									</tr>
									<tr class="bpf-tr">
										<td class="bpf-td1" style="align-items: center;">
											<button id="btnBTE">
												<span>&#x26A1;</span>
											</button>
										</td>
										<td class="bpf-td2">
											<p id="resultEle">kWh</p>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="point-3">
							<!-- 목표 달성하기 -->
							<div id="billPlanDet" style="height: 43%;">
								<h1 style="color: white; margin-left: 20px;">목표 달성까지</h1>
								<!-- 텍스트로 세부사항 안내 -->
								<div id="toGoalDet" style="margin: 3%; margin-top: 30px;">
									<table
										style="vertical-align: middle; height: 140px; font-size: 20px; font-weight: 800; color: white;">
										<tr>
											<td>
												<p id="elePerDay">하루 전력사용 권장량을 알려드립니다.</p>
											</td>
										</tr>
										<tr>
											<td>
												<p id="d-dueDate"></p>
											</td>
										</tr>
									</table>
								</div>

								<!-- 프로그레스 바 로 안내 -->
								<div style="display: flex; justify-content: center;">
									<div class="progress"
										style="width: 600px; margin: 5%; background-color: rgb(255, 255, 255); height: 40px; border-radius: 20px;">
										<div id="progress-bar"
											class="progress-bar progress-bar-striped progress-bar-animated"
											role="progressbar" style="height: 40px; border-radius: 20px">0%
										</div>
									</div>
								</div>
								<div style="display: flex; justify-content: center;">
									<!-- 잔여량 수치 안내 -->
									<img id="warningSingImg"
										src="${pageContext.request.contextPath}/assets/img/warningSign.png"
										alt="">
									<p id="eleRemain" style="color: white; font-size: 20px;">잔량을
										출력합니다</p>
								</div>
							</div>
						</div>
					</div>
					<div class="bottom-right-1">
						<div class="point-1">
							<h1 id="printToday"
								style="color: white; margin: 20px; align-self: center;"></h1>
							<div
								style="height: 600px; margin: 5%; margin-top: 2%; padding: 3%; background-color: white; border-radius: 30px;">
								<canvas id="elePred-usePattern"></canvas>
								<!-- <canvas id="myAreaChart"></canvas> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<script src="${pageContext.request.contextPath}/js/bill-Chart.js"></script>
<script src="${pageContext.request.contextPath}/js/billPlan-chart-area-demo.js"></script>
<!-- 전력량 조절 -->
<script src="${pageContext.request.contextPath}/js/billPlan.js"></script>
<script src="${pageContext.request.contextPath}/js/topMeun.js"></script>
<script src="${pageContext.request.contextPath}/js/list.js"></script>
<script>
	/* 마이페이지, 로그아웃 */
    function redirectToMyPage() {
        var targetUrl = "${pageContext.request.contextPath}/myPageView";
        window.location.href = targetUrl;
    }
    function redirectTologout() {
        var targetUrl = "${pageContext.request.contextPath}/logoutDo";
        window.location.href = targetUrl;
    }

    //jQuery 문서가 완전히 로드된 후 실행되는 함수
    $(document).ready(function () {
    /* 날짜 로드 */
     // 월이나 일이 한 자리 숫자일 경우 앞에 0을 추가하는 함수
     function addZero(number) {
         return number < 10 ? '0' + number : number;
     }
     // 이번 달의 마지막 날짜를 구하기
     var currentDate = new Date();
     var formattedDate = currentDate.getFullYear() + '-'
         + addZero(currentDate.getMonth() + 1) + '-'
         + addZero(currentDate.getDate());
     $("#printToday").html(formattedDate)
     var lastDayOfMonth = new Date(currentDate
         .getFullYear(), currentDate.getMonth() + 1,
         0).getDate();
     var today = currentDate.getDate();
     // 남은 일 수 계산
     // $("#d-dueDate").text("요금 납부까지 " + remainingDays + "일 남았습니다.");
     var remainingDays = lastDayOfMonth - today;
     var remDays = "<span>요금 납부까지 <strong class='remDays' >"
         + remainingDays
         + '일 </strong>'
         + '남았습니다.</span>';
     $("#d-dueDate").html(remDays)
	
     /* 입력한 요금에 따라 사용가능한 전력량을 계산, 사용자의 DB 서버에 저장되어있는 전력량 내역을 제외하고 하루 권장 사용량을 계산 */
     $("#btnBTE").click(function () {
      $.ajax({
              url: '<c:url value="/billPlanDo" />',
              type: 'POST',
              contentType: 'application/json', // 데이터 전송 형식 지정
              dataType: 'json', // 서버에서 받아올 데이터 형식 지정
              data: JSON
                  .stringify({
                      memId: '${sessionScope.login.memId}'
                  }), // 보낼 데이터를 JSON 문자열로 변환 
              success: function (res) {
                  console.log(res);
                  // 사용자의 목표 요금 입력 가져오기
                  var billBTE = $("#eleBTE-input").val();
                  // DB 사용자의 집유형 / 계산할 달 정보 가져오기----------------------------------
                  var htBTE = res.houseType;
                  var mthBTE = res.billMonth;
                  var dbSumEle = res.monthTotal;
                  console.log('버튼 누름');
                  console.log('사용자 입력' + billBTE);
                  console.log('주거 유형'+ htBTE);
                  console.log('사용 월 정보'+ mthBTE);
                  console.log('이번달 사용 총합' + dbSumEle);
                  var resultEle = clacBTE(billBTE, htBTE, mthBTE);
                  console.log('resultEle' + resultEle);
                  $("#resultEle").text(resultEle + "kWh 사용가능");

                  // 프로그레스 바의 요소를 가져오기
                  const progressBar = document.getElementById('progress-bar');
                  // 잔량 출력
                  const eleRemain = document .getElementById('eleRemain');
                  // 프로그레스 바 업데이트
                  const percentage = (dbSumEle / resultEle) * 100;
                  progressBar.style.width = percentage + '%';
                  progressBar.setAttribute('aria-valuenow', dbSumEle);
                  progressBar.innerText = percentage.toFixed(2);
                  console.log('퍼센트: ' + percentage);

                  // 초과할 경우 클래스 추가
                  if (dbSumEle == resultEle) {
                      progressBar.classList.remove('bg-danger','bg-info');
                      progressBar.classList.add('bg-warning');
                      var oneEle = "모두 사용했습니다."
                      $("#eleRemain").text("모두 사용했습니다.");
                      $("#elePerDay").text("모두 사용했습니다.");

                  } else if (dbSumEle > resultEle) {
                      progressBar.classList.remove('bg-info','bg-warning');
                      progressBar.classList.add('bg-danger');
                      progressBar.style.width = '100%'; 
                      var pl_eleRemain = dbSumEle - resultEle
                      var remELE = "<span><strong class='remELE' >" + pl_eleRemain.toFixed(2) + 'kWh </strong>' + '만큼 초과했습니다.</span>';
                      // 이전 텍스트를 남기고 싶으면
                      // $("#eleRemain").append(test);
                      // 지금 내용만 나오게 하려면
                      $("#eleRemain").html(remELE);
                      var oneEle = "초과했습니다."
                      $("#elePerDay").html(oneEle);
                      
                  } else {
                      progressBar.classList.remove('bg-danger','bg-warning');
                      progressBar.classList.add('bg-info');
                      console.log('잔량:', resultEle - dbSumEle);
                      var mn_eleRemain = resultEle - dbSumEle
                      var remELE = "<span><strong class='remELE' >" + mn_eleRemain.toFixed(2) + 'kWh </strong>' + '만큼 남았습니다.</span>';
                      $("#eleRemain").html(remELE)
                      var oneDayEle = (mn_eleRemain / remainingDays).toFixed(2);
                      console.log("mn_eleRemain / remainingDays"+ mn_eleRemain+ ','+ remainingDays);
                      console.log('mn_eleRemain / remainingDays ='+ oneDayEle);
                      var oneEle = "<span>하루에 평균 <strong class='oneDayEle'>"+ oneDayEle + "kWh" + "</strong>"  + " 사용 할 수 있습니다.</span>"
                      $("#elePerDay").html(oneEle)
                  }
              },
              error: function (xhr, status, error) {
                  console .error( 'AJAX 오류: ' + status, error);
              }
          });
        });
       });
</script>
</body>

</html>