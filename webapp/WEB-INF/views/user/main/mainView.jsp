<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ecoala</title>
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
body {
	user-select: none;
}

.bottom-left-1, .bottom-right-1, .bottom-left-2, .bottom-right-2 {
	z-index: 1;
	box-shadow: 5px 5px 5px gray;
	background-color: #19014b;
	width: 42rem;
	border-radius: 30px/25px;
	/* margin: 10px;             */
}

.bottom-left-1 {
	z-index: 2;
}

.bottom-left-1, .bottom-left-2 {
	margin-left: 25px;
	margin-right: 0;
	margin-bottom: 25px;
}

.bottom-right-1, .bottom-right-2 {
	margin-left: 0;
	margin-right: 100px;
}

/* 전력사용량_제목 */
.bottom_title {
	forced-color-adjust: none;
	padding: 14px;
	z-index: 2;
	color: aliceblue;
	font-weight: 600;
	font-size: 25px;
}

/* 전력사용량_가로막대바 */
/* .width_bar {
        	position: relative;
        	display: inline-block;
            background-image: linear-gradient(to right, rgb(51, 255, 51), rgb(230, 245, 16), red);
            z-index: 2;
            width: 92%;
            height: 35px;
            border-radius: 30px;
            margin-left: 3.5%;
            margin-top: 50px;
        } */
.width_bar .tooltiptext {
	visibility: hidden; /* 최초에는 툴팁 박스 안 보이게 */
	width: 110px;
	background-color: rgba(0, 0, 0, 0.8);
	color: #fff;
	text-align: center; /*툴팁 박스 안의 글자가 가운데로 모이도록 */
	border-radius: 6px; /* 툴팁 박스 모서리가 약간 둥글게 */
	padding: 5px 5; /* 위아래 padding을 5 좌우 패딩을 5로 */
	z-index: 150; /* 툴팁이 화면의 다른 요소들 위에 보이고 가려지지 않도록 하기 위해 */
	position: absolute; /* 툴팁 박스의 위치 지정 방식 설정 */
	left: -30%;
	bottom: 0%;
	margin-left: -10px; /* 툴팁 박스가 마우스 위치에 적당히 놓이도록 */
}

.width_bar .tooltiptext::after {
	z-index: 3;
	/* content: "20231201"; */
	position: absolute;
	color: green; /* content의 색깔*/
	top: 100%;
	left: 30%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	/* border-color의 Top Right Bottom Left의 색상 지정 */
	border-color: black transparent transparent transparent;
	/*border-color: black red blue cyan;*/
}

.width_bar:hover .tooltiptext {
	visibility: visible;
}

.width_bar {
	position: relative;
	display: inline-block;
	background-image: linear-gradient(to right, rgb(51, 255, 51),
		rgb(230, 245, 16), red);
	z-index: 3;
	width: 92%;
	height: 35px;
	border-radius: 30px;
	margin-left: 3.5%;
	margin-top: 50px;
}

/* 전력사용량_세모침 */
.ruler, .avg_ruler {
	/* left 23% ~ 53% */
	transition: left 0.5s ease;
	position: relative;
	left: 3%;
	width: 2px;
	height: 0;
	border-bottom: 25px solid;
	border-top: 13px solid transparent;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
}

.ruler {
	border-bottom-color: black;
	margin-top: -2px;
}

.avg_ruler {
	border-bottom-color: blue;
	margin-top: -39px; /* 위쪽으로 조절 */
}

/* 원형차트 */
.chart_container {
	margin-left: 25%;
	height: 350px;
	/* width: 380px; */
}

/* 전기요금 */
.elec_bill {
	font-size: 40px;
	font-weight: 800;
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	padding-top: 15px;
	padding-right: 10px;
	text-align: end;
}

/* 전력계산기 */
.eco_container {
	height: 70px;
}

.ele_img, .eco_img, .tree_img {
	margin-left: 30px;
	height: 50px;
}

.ele_usage, .eco_usage, .tree_usage {
	width: 30%;
	margin-left: 30px;
	font-size: 28px;
	font-weight: 700;
	color: white;
	padding-top: 15px;
	text-align: center;
}

.ele_result, .eco_result, .tree_result {
	box-shadow: 5px 5px 5px #131c3b;
	padding-top: 15px;
	text-align: center;
	width: 40%;
	font-size: 30px;
	font-weight: bold;
	background-color: #2F4287;
	color: aliceblue;
}

</style>
</head>


<body>
	<div class="content-container">
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>
		</div>
		<div class="main-contain">
			<div class="top">
				<div class="top-left">
					<h2 class="title">우리집 에너지 사용량</h2>
				</div>
				<!-- <div class="top-center"></div> -->
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
				style="padding: 10px; margin-top: 30px; grid-template-rows: none;">
				<div class="bottom-left-1" style="height: 300px;">
					<div class="bottom_title">오늘의 전력 사용량</div>


					<div class="width_bar">
						<span class="tooltiptext">전력 사용량이 존재하지않습니다.</span>
						<div class="ruler"></div>
						<div class="avg_ruler"></div>
					</div>

					<div class="flex_word"
						style="z-index: 2; color: aliceblue; display: flex; margin-top: 10px; font-size: 14px;">
						<div style="margin-left: 80px;">표준이하</div>
						<div style="margin-left: 180px;">표준</div>
						<div style="margin-left: 180px;">표준이상</div>
					</div>
					<div>
						<div style="height: 30px;"></div>
						<div class="Box_Container" style="display: flex;">
							<div class="Box" style="width: 37%;"></div>
							<div class="result_ele"
								style="z-index: 2; color: aliceblue; font-size: 40px; font-weight: bold;">
							</div>
						</div>
					</div>

				</div>
				<div class="bottom-right-1" style="height: 300px;">
					<div class="bottom_title" style="height: 25%;">이번달 납부 요금</div>
					<div class="bill_container" style="display: flex; height: 30%;">
						<div class="elec_bill"
							style="background-color: #2F4287; color: aliceblue; width: 50%; margin-left: 5%; box-shadow: 5px 5px 5px #131c3b;">
							0원</div>
						<div style="width: 40%; margin-left: 5%">
							<div class="pre_month_bill"
								style="color: aliceblue; font-weight: bold;">전월 대비:
								0원</div>
							<div style="height: 20PX;"></div>
							<div class="pre_year_bill"
								style="color: aliceblue; font-weight: bold;">전년 동월
								대비: 0원</div>
						</div>
					</div>

				</div>
				<div class="bottom-left-2" style="height: 420px;">
					<div class="bottom_title">가전별 전력 사용량 (kWh)</div>

					<div class="chart_container" style="z-index: 2;">
						<canvas id="myChart"
							style="width: 450px; height: 450px; position: relative; bottom: 15%;"></canvas>
					</div>

				</div>
				<div class="bottom-right-2" style="height: 420px;">
					<div class="bottom_title">탄소배출 계산기</div>
					<div style="height: 260px; margin-top: 40px;">
						<!-- 1번 -->
						<div class="eco_container" style="display: flex;">
							<div class="ele_img">
								<img
									src="${pageContext.request.contextPath}/assets/img/cryptocurrency-color_elec.png"
									alt="">
							</div>
							<div class="ele_usage">전기 사용량</div>
							<div class="ele_result" style="margin-left: 10px;">0 kWh</div>
						</div>
						<!-- 2번 -->
						<div class="eco_container"
							style="display: flex; margin-top: 20px;">
							<div class="eco_img">
								<img
									src="${pageContext.request.contextPath}/assets/img/iwwa_co2.png"
									alt="">
							</div>
							<div class="eco_usage">CO2 발생량</div>
							<div class="eco_result">0 KG</div>
						</div>
						<!-- 3번 -->
						<div class="eco_container"
							style="display: flex; margin-top: 20px;">
							<div class="tree_img">
								<img
									src="${pageContext.request.contextPath}/assets/img/typcn_tree.png"
									alt="">
							</div>
							<div class="tree_usage">필요 소나무</div>
							<div class="tree_result">0 그루</div>
						</div>

					</div>
					<div style="height: 30px;"></div>
				</div>
			</div>
		</div>


	</div>
	<script>
	
	 $(document).ready(function() {	 
		 
		// 하루전력량
		function intervalEle(){
		 $.ajax({
	    	    url: '<c:url value="/combineDo" />',
	    	    type: 'POST',
	    	    contentType: 'application/json',  // 데이터 전송 형식 지정
	    	    dataType: 'json',  // 서버에서 받아올 데이터 형식 지정
	    	    data: JSON.stringify({
	    	    	eleUsageVO: {
	    	             memId: '${sessionScope.login.memId}',
	    	             useDt: '2020-09-04'	    	             	    	             
	    	         },
	    	         typeEleVO: {
	    	             memId: '${sessionScope.login.memId}',
	    	             
	    	         }
	    	    }),  // 보낼 데이터를 JSON 문자열로 변환 
	    	    success: function(res) {
	    	    	/* console.log("서버 응답 성공"); 
	    	        console.log(res);  // 성공 시 서버에서 받은 데이터 출력 */	    	        	    	       	    	        	    	        	    	        
	    	        let myEleValue = res.eleUsageVO
	    	        let typeEleVal = res.typeEleVO
	    	       /*  console.log(myEleValue)
	    	        console.log("-------")
	    	        console.log(typeEleVal) */
	    	        
	    	        // 1분간의 전력사용량(kwh)을 와트로 변환
	    	        let myEle = (Number(myEleValue.totalEle)) * 1000;
	    	        let allMinEle = (Number(typeEleVal.minValue)) * 1000;
	    	        let allMaxEle = (Number(typeEleVal.maxValue)) * 1000;
	    	        let allAvgEle = (Number(typeEleVal.averageValue)) * 1000;
	    	        let myPercentege = (myEle - allMinEle) / (allMaxEle - allMinEle) * 100;
	    	        
	    	     // css 동적으로 바뀌게 하기. 최대값은 90%
	    	        
	    	     // 툴팁텍스트 넣기	    	     
	    	      $('.tooltiptext').html(	    	    		  
	    	    		"<div style=\"font-size: 15px; font-weight: 800; color:yellow; margin-top:15px;\">" + '툴팁(클릭시사라짐)' + "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">" + '나의전력량 : 검정 화살표 ' + "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">" + '평균전력량 : 파란 화살표' + "</div>"  +
	    	    		"<div style=\"font-size: 15px; font-weight: 800; color:yellow;\">" + '나의 전력사용량' + "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">"+ "내 전력량: " + myEle + "W"+ "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">"+ "퍼센트: " + Math.round(myPercentege)+ "%" + "</div>"  +	    	    		   
	    	    		"<div style=\"font-size: 15px; font-weight: 800;color:yellow;\">" + '내유형 전력사용량' + "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">"+ "최소전력량: " + allMinEle + "W" + "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">"+ "최대전력량: " + allMaxEle + "W" + "</div>"  +
	    	    		"<div style=\"font-size: 12px; font-weight: 700;\">"+ "평균전력량: " + allAvgEle + "W" + "</div>"					    
					    );
					/* console.log("나의 전력량:" + myEle,
	    	        		",최소전력량:"+allMinEle,
	    	        		",최대전력량:"+allMaxEle,
	    	        		",평균전력량:"+allAvgEle,
	    	        		",퍼센티지:" + myPercentege)	 */    	     	    	       
	    	        let avgPercentage = (allAvgEle - allMinEle) / (allMaxEle - allMinEle) * 100;
	    	        myPercentege = Math.min(myPercentege, 95); // 100%가 되면 화면 깨짐으로 최대값을 95%로 제한
	    	        
	    	        $('.ruler').css('left', myPercentege + '%');
	    	        $('.avg_ruler').css('left', avgPercentage + '%');
	    	        
	    	        
	    	        
	    	        	    	        	    	    	           	    	        	    	        	    	       
	    	    },
	    	    error: function(xhr, status, error) {
	    	        console.error('AJAX 오류: ' + status, error);
	    	    }
	    	});
		 }
		intervalEle();
		setInterval(intervalEle, 30000);
		
		
		//요금컨테이너 코드
				
		 var cBill = ${bill.currentBill};
		 var pmBill = ${bill.preMonthBill};
		 var lyBill = ${bill.lastYearBill};		  
		 var currentDate = new Date();
		 var day = currentDate.getDate(); //오늘날짜
		 
		 // 전력사용량이 0이여도 1030원이 나와서 예외처리.
		 if(cBill < 1030){
				cBill = 0;
			}
		 
		 
		// 이번 달의 마지막 날짜 구하기
		 var lastDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
		 var daysInCurrentMonth = lastDayOfMonth.getDate();

		// 저번 달의 마지막 날짜 구하기
		 var lastDayOfPreviousMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 0);
		 var daysInPreviousMonth = lastDayOfPreviousMonth.getDate();

		// 작년 이번 달의 마지막 날짜 구하기
		 var lastDayOfLastYearMonth = new Date(currentDate.getFullYear() - 1, currentDate.getMonth() + 1, 0);
		 var daysInLastYearMonth = lastDayOfLastYearMonth.getDate();
		 
		 let currentBill = $(".elec_bill");
		 let preMonthBill = $(".pre_month_bill");
		 let preYearBill = $(".pre_year_bill");
		 currentBill.html(cBill + "원")		 		 
		 let cul1 = Math.abs(Math.round(cBill - (pmBill/daysInPreviousMonth)*day)); // 이전달 현재일자까지의 요금
		 let cul2 = Math.abs(Math.round(cBill - (lyBill/daysInLastYearMonth)*day)); // 작년동월의 현재일자까지의 요금
		 
		 let caseBill = '';
		 let case2Bill = '';
		 console.log('123: '+ caseBill)
		 // 전월
		 preMonthBill.html('전월 대비: '+'<span class="pm_month">'
				+ cul1 +"</span>"+ '원')
				
				if(cBill < (pmBill/daysInPreviousMonth)*day){
					caseBill = " <span>절약</span>"						
					$(".pm_month").css("color", "yellow");	
				}else{
					caseBill = " <span>초과</span>"
					$(".pm_month").css("color", "red");
				}				 
		 $(".pre_month_bill").html($(".pre_month_bill").html() + caseBill);
		 	
		 
		 preYearBill.html('전년 동월 대비: '+'<span class="pm_year">'
					+ cul2 +"</span>"+ '원')				
		
					if(cBill < (lyBill/daysInLastYearMonth)*day){
						case2Bill = " <span>절약</span>"
						$(".pm_year").css("color", "yellow");	
					}else{
						case2Bill = " <span>초과</span>"
						$(".pm_year").css("color", "red");
					}	
		 $(".pre_year_bill").html($(".pre_year_bill").html() + case2Bill);		 																		
		//console.log(daysInCurrentMonth , daysInPreviousMonth, daysInLastYearMonth, typeof cBill)
		
		
		
		 
		 
		 
		 
		
		let myChart;
		
		var MyBoolean = true;
		 
		 // 가전전력량
		 function EachInterval(){
		 const ctx = document.getElementById('myChart').getContext('2d');	    	
	    	$.ajax({
	    	    url: '<c:url value="/eachDo" />',
	    	    type: 'POST',
	    	    contentType: 'application/json',  // 데이터 전송 형식 지정
	    	    dataType: 'json',  // 서버에서 받아올 데이터 형식 지정
	    	    data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),  // 보낼 데이터를 JSON 문자열로 변환 
	    	    success: function(res) {	   	    	    		    	    		    	    	
	    	        //console.log("가전별데이터받아오기성공:"+res);  // 성공 시 서버에서 받은 데이터 출력
	    	        let existingChart = Chart.getChart(ctx);
	    	        if (existingChart) {
	    	            existingChart.destroy();
	    	        }
	    	        drawChart(res)    	        	    	    	    	        	    	        	    	        	    	        
	    	    },
	    	    error: function(xhr, status, error) {
	    	    	initializeChart()	    	    	
	    	        console.error('AJAX 오류: ' + status, error);
	    	    	MyBoolean = false;
	    	        
	    	    }
	    	});	
		 }		 
		 EachInterval();
		 if(MyBoolean === true){
			 setInterval(EachInterval, 10000);	 
		 }
	     
	     
	    });
			
	 
	 
	// 차트 초기화 함수
	 function initializeChart() {
	     const ctx = document.getElementById('myChart').getContext('2d');
	     myChart = new Chart(ctx, {
	         type: 'doughnut',
	         data: {
	             labels: ['Loading...'],
	             datasets: [{
	                 data: [1],
	                 backgroundColor: ['#DDDDDD'],
	                 borderWidth: 0.3,
	             }],
	         },
	         options: {
	             responsive: false,
	             plugins: {
	                 legend: {
	                     display: true,
	                     position: 'right',
	                 },
	                 tooltip: {
	                     enabled: true,
	                     callbacks: {
	                         label: function (context) {
	                             return '';
	                         },
	                     },
	                 },
	                 datalabels: {
	                     formatter: () => {
	                         return '';
	                     },
	                     color: 'white',
	                     anchor: 'end',
	                     align: 'start',
	                     offset: 10,
	                     display: 'auto',
	                 },
	             },
	         },
	     });
	 }
	 
	 
	 
	 
	 
	 
	 function drawChart(data) {		 
         const ctx = document.getElementById('myChart').getContext('2d');
         ctx.canvas.width = 450;  // 원하는 너비
         ctx.canvas.height = 450;       
       
         
         let labels = []; // 적절한 데이터 속성으로 수정
         let values = [];
         let entries = Object.entries(data);
         let count = 0;
                  
       // 내림차순으로 정렬
         
         //let OrderEntries = entries.sort((a, b) => parseFloat(b[1]) - parseFloat(a[1]));  
         entries = entries.map(entry => [entry[0], parseFloat(entry[1])]);
         let OrderEntries = entries.slice().sort((a, b) => b[1] - a[1]);
         
         
         for (let i = 2; i < OrderEntries.length; i++) {        	 
        	 if(entries[i][1] === 0 || entries[i].length === 0){
        		 continue;
        	 }
        	 count++;
        	 if(count >= 4){
        		 break;
        	 }
             let [key, value] = entries[i];
             console.log(key + ':' + value);
             
             if(key === 'dt'){
            	 key = 'Computer'
             }
             
             labels.push(key);
             values.push(value);
         }
                                             
         // 데이터가 존재하지않을때 
         if(labels.length === 0 || values.length === 0){
        	 values.push(1);
        	 labels.push('전력이 존재하지 않습니다.');
         }
         
         
         
         
         
         const colors = ['#EE5656', '#3857BC', '#61CE5B', '#F3DA49', '#AE7DF0'];     
         Chart.register(ChartDataLabels);
     
         myChart = new Chart(ctx, {
             type: 'doughnut',
             data: {
                 labels: labels,
                 datasets: [{
                     data: values,
                     backgroundColor: colors,
                     borderWidth: 0.3,  
                 }],
                                   
             },
             options: {                    
                 responsive: false,
                 plugins: {
                     legend: {
                         display: true,
                         position: 'right',                          
                     },
                     tooltip: {
                     	enabled: true,
                         callbacks: {
                             label: function(context) {
                                 const labelIndex = context.dataIndex;
                                 const percentage = ((values[labelIndex] / values.reduce((a, b) => a + b, 0)) * 100).toFixed(2);
                                 console.log(percentage)
                                 console.log(`${labels[labelIndex]}: ${values[labelIndex]} (${percentage}%)`)
                                 return labels[labelIndex]+ ': ' + values[labelIndex] +' ('+ percentage + ' %)'
                             },
                         },
                     },
                     datalabels: {
                         formatter: (value, ctx) => {
                             let sum = 0;
                             let dataArr = ctx.chart.data.datasets[0].data;
                             dataArr.map(data => {
                                 sum += data;
                             });
                             let percentage = ((value / sum) * 100).toFixed(2) + "%";
                             return percentage;
                         },
                         color: 'white',
                         anchor: 'end',
                         align: 'start',
                         offset: 10,
                         display: 'auto',
                     },
                 },
             },
         });  
         
        /*  myChart.data.labels = labels;
         myChart.data.datasets[0].data = values;
         myChart.data.datasets[0].backgroundColor = colors;
         myChart.update() */
         
         

        
       // 탄소계산기  
         let DayEle = 0;
         // 값을 다더해줘서 오늘의 전력량 하단에 맵핑해주는 반복문
         for (let i = 2; i < OrderEntries.length; i++) {        	        	        	 
             let [key, value] = entries[i];
             DayEle += value;
            // console.log(DayEle)
                        	
         }         
         let co2Ele = $(".ele_result");
         let ecoEle = $(".eco_result");
         let treeEle = $(".tree_result");
         co2Ele.html(Math.round(DayEle) + " kWh");
         let ecoEl = Math.round(DayEle * 4.781);
         let treeEl = Math.round(DayEle * 1.157);
         ecoEle.html(ecoEl+" KG")
         treeEle.html(treeEl+" 그루")
         // 절댓값으로 바꾸고 반올림까지해서 소수점을 없애버림
         DayEle = Math.round(Math.abs(DayEle * 1000));
         
         let oneDayEle = $(".result_ele");
         
         if (DayEle < 1) {
             oneDayEle.html("0 W");
         }
         oneDayEle.html(DayEle + " W");
          
         
         
	 }
	 
// 마우스 툴팁 이벤트 코드
	 
	//마우스를 움직일 때 툴팁을 보여줄 영역
     var tooltip = document.getElementsByClassName("width_bar")[0];
     //툴팁 박스 
     var tooltipTxt = document.getElementsByClassName("tooltiptext")[0];

     // 아래 함수는 키보드 중 Esc 클릭시 툴팁이 사라지도록 하기
     document.onkeydown = function(e){
         var isEscape = false;

         if("key" in e){
             console.log("e.key : " + e.key);
             isEscape = (e.key === "Escape" || e.key === "Esc");
         } else {
             isEscape = (e.keyCode === 27);
         }

         if(isEscape){
         	//툴팁 박스를 사라지게
             tooltipTxt.style.display = "none";
         }
     };

     //마우스 move 이벤트가 발생하면 
     tooltip.addEventListener('mousemove', function(e){
         // console.log("e.clientX : "+e.clientX);
         // console.log("e.clientY : "+e.clientY);

         //e.clientX의 값이 현재 위치의 마우스 포인터의 x 좌표 값
         //마우스를 움직이면 tooltipTxt(툴팁 박스)의 왼쪽 좌표를 마우스 포인터의 현재 x좌표로 지정
         tooltipTxt.style.left = (e.clientX - 400 ) + 'px';
         tooltipTxt.style.top = (e.clientY - 255) + 'px';
         //툴팁 박스의 높이를 지정
         tooltipTxt.style.height = "200px";
         tooltipTxt.style.width = "200px";
                  
     });

     //마우스 클릭시마다 툴팁 박스가 보였다 사라졌다 하도록
     tooltip.addEventListener('click', function(e){
         if (tooltipTxt.style.display === 'none'){
             tooltipTxt.style.display = "block";
             console.log('툴팁이 보이지 않는 상태');
         } else {
             tooltipTxt.style.display = "none";
             console.log('툴팁이 보이고 있음~');
         }
     });
     
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
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</html>