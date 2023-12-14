<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 27. 오전 11:42:35
 * 3. 작성자 : LeeHoJe
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 화면정의서의 화면명
 * 6. 설명 : 화면명과 동일하거나 기타 특이사항 기술
 * </pre>
 */
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ecoala</title>
<link href="./css/main.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet" />
<style>
.bottom-inq {
	flex: 3;
	display: grid;
	grid-template-columns: 1fr 1fr;

	/* 기존의 .bottom에서 수정*/
}

body {
	user-select: none;
}

.bottom-right-als {
	z-index: 1;
	box-shadow: 5px 5px 5px gray;
	background-color: #19014b;
	width: 42rem;
	border-radius: 30px/25px;
	margin-left: 0;
	margin-right: 100px;
}

.bottom-left-1, .bottom-right-1, .bottom-left-2, .bottom-right-2 {
	z-index: 1;
	box-shadow: 5px 5px 5px gray;
	background-color: #19014b;
	width: 42rem;
	border-radius: 30px/25px;
	/* margin: 10px;             */
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
/**
       		 전력소비패턴 ~
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; 
            width: 670PX; height:300px;
        } */
.one_chart {
	margin-top: 10px;
	position: relative;
	font-size: 20px;
	color: white;
}

.one_chart-1 {
	float: left;
	width: 140px;
	height: 140px;
	border: 1px solid #19014b;;
	border-top-left-radius: 100%;
	text-align: center;
	background-color: #868e96;
	text-align: center;
	/* line-height: 10px; */
}

.one_chart-2 {
	float: left;
	width: 140px;
	height: 140px;
	border: 1px solid #19014b;;
	border-top-right-radius: 100%;
	text-align: center;
	background-color: #868e96;
	text-align: center;
	/* line-height: 120px; */
	/* padding-top:50px ; */
}

.one_chart-3 {
	float: left;
	margin-right: -1px;
	width: 140px;
	height: 140px;
	border: 1px solid #19014b;;
	border-bottom-left-radius: 100%;
	text-align: center;
	clear: both;
	background-color: #868e96;
	text-align: center;
	/* line-height: 120px; */
}

.one_chart-4 {
	float: left;
	width: 140px;
	height: 140px;
	border: 1px solid #19014b;;
	border-bottom-right-radius: 100%;
	text-align: center;
	background-color: #868e96;
	text-align: center;
	/* line-height: 120px; */
}

.one_chart_one {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	position: absolute;
	margin-top: 20px;
	z-index: 2; /* 다른 차트 위에 표시되도록 설정 */
	color: white;
	background-color: #19014b;
	text-align: center;
	font-size: 20px;
	/* line-height: 120px; */
}
/* ~ 전력소비패턴 */
.weatherTable {
	border: 1px solid #444444;
}
</style>

</head>

<body>

	<div class="content-container" style="height: 900px";>
		<div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp"%>


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
					<!-- bottom -->
				</div>
				<!--전력소비패턴  -->
				<div class="bottom"
					style="padding: 10px; margin-top: 30px; grid-template-rows: none;">
					<div class="bottom-left-1" style="height: 380px;">
						<div class="bottom_title"
							style="position: relative; display: flex; align-items: center;">
							전력 소비 패턴
							<form action="">
								<select name="selectMonth" class="monthSel"
									style="height: auto; padding: 10px; margin-left: 390px;">
									<option value="1">1개월</option>
									<option value="2">2개월</option>
									<option value="3">3개월</option>
								</select>
							</form>
						</div>

						<!--                             <nav style="background-color: #ffffff; position: absolute; top: 0; right: 0;
                             padding: 00px; margin-top: 15px; margin-right: 10px; margin-left: auto; height:auto; width: auto;">

                                <ul style=" list-style: none; color: white; display: flex;">
                                  <li style = "margin-right: 10px;"><a id="oneMon" href="#" style =" text-decoration-line: none; color: black">1개월 |</a></li>
                                  <li style = "margin-right: 10px;"><a id="twoMon" href="#"  style =" text-decoration-line: none; color: black">2개월 |</a></li>
                                  <li><a id="threeMon" href="#"  style =" text-decoration-line: none; color: black">3개월</a></li>
                                </ul>
                              </nav> -->
						<!--원형 차트  -->
						<div class="container"
							style="justify-content: center; align-items: center; height: 100vh; /* 높이를 조절하세요. */ width: 670PX; height: 300px; justify-content: center; align-items: center; height: 100vh; /* 높이를 조절하세요. */ width: 670PX; height: 300px; display: flex;">


							<div class="one_chart">

								<div class="one_chart-1">
									<p style="padding-top: 50px;">심야</p>
									<p id="elenight" style="font-size: 15px"></p>
								</div>
								<div class="one_chart-2">
									<p style="padding-top: 50px;">새벽</p>
									<p id="eledawn" style="font-size: 15px"></p>
								</div>
								<div class="one_chart-3">
									<p style="padding-top: 40px;">오후</p>
									<p id="elepm" style="font-size: 15px"></p>
								</div>
								<div class="one_chart-4">
									<p style="padding-top: 40px;">오전</p>
									<p id="eleam" style="font-size: 15px"></p>
								</div>

							</div>
							<div class="one_chart_one">
								<p style="padding-top: 40px;">하루</p>
								<p id="eleday" style="font-size: 15px"></p>
							</div>
						</div>

					</div>

					<div class="bottom-right-als" style="height: 720px;">
						<div class="bottom-right-als-1"
							style="height: 450px; width: 672px;">
							<div class="bottom_title">날씨전력 예측그래프</div>
							<div class="chart_container"
								style="z-index: 2; background-color: white; width: 620px; height: 350px; margin-top: 10px; margin-bottom: 10px; margin-left: 20px; border-radius: 1%;">
								<canvas id="bar-chart" style="width: 620px; height: 350px;"></canvas>
							</div>
						</div>

						<div class="" style="height: 350px;">
							<div class="bottom_title">최근 날씨</div>

							<div id="my_info"
								style="position: relative; align-items: center; justify-content: center;">
								<table id="table_color1"
									style="text-align: center; border-color: red; background-color: red; border: 1px solid #444444; border-collapse: collapse; position: absolute; width: 620px; margin-left: 20px;">
									<thead>
										<tr>
											<td class="weatherTable">Date</td>
											<td class="weatherTable">온도</td>
											<td class="weatherTable">습도</td>
											<td class="weatherTable">강수량</td>
										</tr>
									</thead>
									<tbody id="weather_list_info"></tbody>
								</table>
							</div>


						</div>


					</div>
					<div class="bottom-left-2"
						style="height: 320px; position: absolute; margin-top: 400px;">
						<div class="bottom_title" style="display: flex;">
							비교 그래프

							<div class="sel"
								style="height: 60px; right: 10px; position: absolute;">
								<form action="" style="">
									<select name="date_sel" class="date_sel"
										style="height: 50px; padding: 10px; margin-left: 400px">
										<option value="day">Day</option>
										<option value="dawn">새벽</option>
										<option value="am">오전</option>
										<option value="pm">오후</option>
										<option value="night">심야</option>
									</select>
								</form>
							</div>
						</div>
						<div class="chart_container" id="chatp"
							style="z-index: 2; background-color: white; width: 620px; height: 230px; margin-top: 10px; margin-bottom: 10px; margin-left: 20px; border-radius: 1%;">

							<canvas id="line-chart" style="width: 620px; height: 230px;"></canvas>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>


<script>

/*1개월치데이터 가져오기 */

 


    // 초기 그래프 생성
    //oneMonthEle();
    
////////////////////////////////////////////////////////////////////////////////////////////////
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["월", "화", "수", "목", "금","토","일"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["blue", "blue","blue","blue","blue","blue","black"],
          data: [2478,5267,734,784,433,1000,4000]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: "날씨 예측",
            display: true,
            fontSize: 25,
            fontColor: "#000000"
            },
            tooltips: {
                enabled: true,
                mode: 'index',
                intersect: false,
                callbacks: {
                    label: function (tooltipItem, data) {
                        var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': ' + tooltipItem.yLabel;
      }
    }}}
});

// 


// 주, 월, 년 클릭 이벤트 리스너 추가
	let resNight= '';
	let resDawn ='';
	let resPm ='';
	let resAm ='';
	let resDay ='';
var selectedValue = '1';
var dateSelValue = 'day';
var lineChart = null;

var abc = null;

oneMonthEle();
comparisonEle();
weatherList()
//개월수 변경 및 실행
document.querySelector('.monthSel').addEventListener('change', function () {
	
    selectedValue = this.value;
    oneMonthEle();
    comparisonEle();
    
});

//소비패턴 시간선택 및 실행
document.querySelector('.date_sel').addEventListener('change', function () {
	dateSelValue = this.value;
    comparisonEle();
});

//전력소비패턴 
    function oneMonthEle() {
    	console.log(selectedValue);
    	$.ajax({
    	    url: '<c:url value="/oneMonthEleDo" />',
    	    type: 'POST',
    	    contentType: 'application/json',
    	    dataType: 'json',
    	    data: JSON.stringify({ memId: '${sessionScope.login.memId}' ,
    	    	selectMonth: selectedValue
    	    	}),
    	    success: function (res) {
    	    	console.log("성공");
    	        console.log(res);
    	        resNight =res[0].eleNight;
    	        resDawn =res[0].eleDawn;
    	        resPm =res[0].elePm;
    	        resAm =res[0].eleAm;
    	        resDay =res[0].eleDay;
    	        
    	        document.getElementById('elenight').innerText = resNight+ 'kWh';
    	        document.getElementById('eledawn').innerText = resDawn+ 'kWh';
    	        document.getElementById('elepm').innerText = resPm+ 'kWh';
    	        document.getElementById('eleam').innerText = resAm+ 'kWh';
    	        document.getElementById('eleday').innerText = resDay+ 'kWh';
    	    },
    	    error: function (xhr, status, error) {
    	        console.error('AJAX 오류: ' + status, error);
    	    }
    	});
    	}
// 비교그래프
    function comparisonEle() {
    	console.log(dateSelValue);
    	let dateUserDay = [];
    	let dateOtherDay = [];
       
    	$.ajax({
    	    url: '<c:url value="/comparisonEleDo" />',
    	    type: 'POST',
    	    contentType: 'application/json',
    	    dataType: 'json',
    	    data: JSON.stringify({ memId: '${sessionScope.login.memId}' ,
    	    	selectMonth: selectedValue
    	    	}),
    	    success: function (res) {
    	    	console.log("성공2");
    	    	let timelabels =[];
    	    	console.log(timelabels);
                     if (dateSelValue=='day'){
                    	 for (let i = 0; i < res.length; i++) {
                    	 console.log("하루");
                    	 dateUserDay.push(res[i]['userEleDay']);
                         dateOtherDay.push(res[i]['otherEleDay']);
                         timelabels.push(i);
                         
                        
                    	 }
                    }if (dateSelValue=='dawn'){
                    	for (let i = 0; i < 6; i++) {
    	        		console.log("새벽");
    	        		dateUserDay.push(res[i]['userEleDay']);
                        dateOtherDay.push(res[i]['otherEleDay']);
                        timelabels.push(i);
                        
                    	}
	    	        }if (dateSelValue=='am'){
	    	        	for (let i = 6; i < 12; i++) {
			        	console.log("오전");
			        	dateUserDay.push(res[i]['userEleDay']);
                        dateOtherDay.push(res[i]['otherEleDay']);
                        timelabels.push(i);
                        
                    	}
			        }if (dateSelValue=='pm'){
			        	for (let i = 12; i < 18; i++) {
			        	console.log("오후");
			        	dateUserDay.push(res[i]['userEleDay']);
                        dateOtherDay.push(res[i]['otherEleDay']);
                        timelabels.push(i);
                        
                    	}
			        }if (dateSelValue=='night'){
			        	for (let i = 18; i < 24; i++) {
				    	console.log("심야");
				    	dateUserDay.push(res[i]['userEleDay']);
                        dateOtherDay.push(res[i]['otherEleDay']);
                        timelabels.push(i);
                        
                    	}
				    }
                    console.log(dateUserDay);
                    console.log(dateOtherDay);
                    console.log(timelabels);

                    
                    //그래프 그리기
                  configs = {
                        type: 'line',
                        data: { labels: timelabels,
                        datasets: [{
                            data: dateUserDay,
                            label: "me",
                            borderColor: "blue",
                            fill: false
                        },
                        {
                                data: dateOtherDay,
                                label: "all",
                                borderColor: "red",
                                fill: false
                            }]},
                        options: {
                        	 canvasStyle: {
                                 width: '610px',
                                 height: '230px'
                             },
                        title: {
                            text: "시간별 사용자 전력량 비교",
                            display: true,
                            fontSize: 15,
                            fontColor: "#000000"
                            },
                            tooltips: {
                                enabled: true,
                                mode: 'index',
                                intersect: false,
                                callbacks: {
                                    label: function (tooltipItem, data) {
                                        var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                                        return datasetLabel + ': ' + tooltipItem.yLabel;
                                    }
          	                      }
                            }
                        }
                    }
                  
               var  ctx = document.getElementById("line-chart").getContext("2d");
               abc = $("#line-chart").clone();
               if (lineChart) {
                   lineChart.destroy();
                   $("#chatp").empty();
               }
               	   $("#chatp").append($(abc));
               	   ctx = document.getElementById("line-chart").getContext("2d");
            	   lineChart = new Chart(ctx, configs);
               
                 
    	    },
    	    error: function (xhr, status, error) {
    	        console.error('AJAX 오류: ' + status, error);
    	    }
    	    
    	});
    }
    //날씨그래프 가져오기
     function weatherList() {
    	 weatherDate =[];
    	 weatherTEM =[];
    	 weatherPRCE =[];
    	 weatherHUM =[];
       
    	$.ajax({
    	    url: '<c:url value="/weatherListDo" />',
    	    type: 'POST',
    	    contentType: 'application/json',
    	    dataType: 'json',
    	    data: JSON.stringify({ memId: '${sessionScope.login.memId}' ,
    	    	}),
    	    success: function (res) {
    	    	console.log("성공2");
    	    	console.log(res);
    	    	let str = '';
                for (let i = 0; i < res.length; i++) {
                    str += '<tr>';
                    //str += '<tr>';
                    str += '<td>' + res[i]['weatherDate'] + '</td>';
                    str += '<td>' + res[i]['weatherTEM'] +  '</td>';
                    str += '<td>' + res[i]['weatherPRCE'] + '</td>';
                    str += '<td>' + res[i]['weatherHUM'] + '</td>';
                    str += '</tr>';         
                }
                document.getElementById('weather_list_info').innerHTML += str;
    	}
    	});
    }



</script>

</html>