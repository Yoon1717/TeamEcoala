<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 27. 오전 11:24:26
 * 3. 작성자 : LeeHoJe
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 화면정의서의 화면명
 * 6. 설명 : 화면명과 동일하거나 기타 특이사항 기술
 * </pre>
 */
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecoala</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" /> 
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

    <style>
        .bottom-inq {
            flex: 3;
            display: grid;
            grid-template-columns: 1fr 1fr;

            /* 기존의 .bottom에서 수정*/
        }


    </style>
</head>

<body>
    <div class="content-container" >
        <div class="additional-div">
			<%@include file="/WEB-INF/inc/left.jsp" %>

            <div class="main-contain">
                <div class="top">
                    <div class="top-left">
                        <h1 class="title">전력량 조회</h1>
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
                                    <img class="img-mypage" src="./assets/img/mypage.png" alt="">
                                </div>
                                <div class="right2-mypage">
                                    <img class="img-logout" src="./assets/img/logout.png" alt="">
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

                </div>
                <!-- 기존의 class = bottom -->
                <div class="sel" style = "height: 60px;  margin-right: 30px; margin-left: 30px; margin-top: 30px; margin-bottom:10px">
                <form action="">
                    <select name="date_sel" class="date_sel" style="height: 50px;">
                        <option value="week">일주일</option>
                        <option value="month">한달</option>
                        <option value="year">일년</option>
                    </select>
                    </form>
                </div>
                <div class="bottom-inq" style=" height: 650px; ">
                    <div class="bottom-inq-bot" style="background-color: #161A45;
                color: #ffffff; margin-right: 30px; margin-left: 30px; border-radius: 50px; height: 650px;  width: 1456px; display: flex;">
                        
                        <!-- 그래프 -->
                        <div class="date-graph" style="background-color: #ffffff; width: 670px; height: 600px;  margin-top:20px; margin-bottom:30px; margin-left:20px;
                         margin-right:20px; border-radius: 30px; padding-top: 0%; padding-right: 10px;">
                            <canvas id="line-chart" style="width: 670px; height: 600px;"> </canvas>
                        </div>
                        <!-- 그래프 -->
                        <div class="app-graph" style="background-color: #ffffff; width: 670px; height: 600px;  margin-top:20px; margin-bottom:30px; margin-left:20px;
                     margin-right:20px; border-radius: 30px; padding-right: 10px; padding-left:5px">
                     <canvas id="bar-chart-horizontal" style="position: relative;  width: 670px; height: 600px; "></canvas>
                  
                     </div>
                </div>
            </div>
            </div>

</body>
<!-- <script src="./script/left.jsp"></script> -->
<script>
    // line-chart
    //초기그래프 데이터셋
    let dateCon = [];
    let eleCon = [];
    
    //주간그래프
    function fn_weekEle(con) {
    	//주간그래프 데이터 셋
    	 let dateWeek = [];
    	 let eleWeek = [];
    	 // 주간그래프데이터
        var weekData = {
            labels:dateWeek,
            datasets: [{
                data: eleWeek,
                label: "WeekEle",
                borderColor: "#3e95cd",
                fill: false
            }]
        }
    	 //아작스로 주간그래프데이터 가져오기
        $.ajax({
            url: '<c:url value="/weekInquiryDo" />',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),
            success: function (res) {
            	console.log("성공");
                console.log(res);
                for (let i = 0; i < res.length; i++) {
                	dateWeek.push(res[i]['dateWeek']);
                	dateCon.push(res[i]['dateWeek']);
                	eleWeek.push(res[i]['eleWeek']);
                	eleCon.push(res[i]['eleWeek']);
                }
                //주간그래프 업데이터
           		console.log(con);
           		console.log(dateWeek);
           		console.log(eleWeek);
           		con.data.labels = dateWeek;
           		con.data.datasets[0].data = eleWeek;
           		lineChart.update();
                
            },
            error: function (xhr, status, error) {
                console.error('AJAX 오류: ' + status, error);
            }
        });
    }
   
    //월 그래프
    function fn_monthEle(con) {
        //월 그래프 데이터셋
    	let dateMonth = [];
        let eleMonth = [];
    	//월 그래프 데이터 
        var monthData = {
    		        labels: dateMonth,
    		        datasets: [{
    		            data:eleMonth,
    		            label: "MonthEle",
    		            borderColor: "#e8c3b9",
    		            fill: false
    		        }]
    		    }
    	//월 그래프 아작스
        $.ajax({
            url: '<c:url value="/monthInquiryDo" />',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),
            success: function (res) {
            	console.log("성공");
                console.log(res);
                for (let i = 0; i < res.length; i++) {
                	dateMonth.push(res[i]['dateMonth']);
                	eleMonth.push(res[i]['eleMonth']);
                }
                //월 그래프 업데이트
           		console.log(con);
           		console.log(dateMonth);
           		console.log(eleMonth);
           		con.data.labels = dateMonth;
           		con.data.datasets[0].data = eleMonth;
           		con.data.datasets[0].label = monthData.datasets[0].label;
           		con.data.datasets[0].borderColor = monthData.datasets[0].borderColor;
           		lineChart.update();
                
            },
            error: function (xhr, status, error) {
                console.error('AJAX 오류: ' + status, error);
            }
        });
    }
   
   // 년 그래프
    function fn_yearEle(con) {
	   //년 그래프 데이터 셋 
    	let dateYear = [];
        let eleYear = [];
        // 년 그래프 데이터
        var yearData = {
            labels: dateYear,
            datasets: [{
                data: eleYear,
                label: "YearEle",
                borderColor: "#3cba9f",
                fill: false
            }]
        }
		//년 그래프 데이터 아작스로 가져오기
        $.ajax({
            url: '<c:url value="/yearInquiryDo" />',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),
            success: function (res) {
                console.log("성공");
                console.log(res);
                for (let i = 0; i < res.length; i++) {
                    dateYear.push(res[i]['dateYear']);
                    eleYear.push(res[i]['eleYear']);
                }
                
                //년 그래프 업데이트
           		console.log(con);
           		console.log(dateYear);
           		console.log(eleYear);
           		con.data.labels = dateYear;
           		con.data.datasets[0].data = eleYear;

           		con.data.datasets[0].label = yearData.datasets[0].label;
           		con.data.datasets[0].borderColor = yearData.datasets[0].borderColor;
           		lineChart.update();
                
            },
            error: function (xhr, status, error) {
                console.error('AJAX 오류: ' + status, error);
            }
        });
    }
   
    //초기데이터
    var configs = {
        type: 'line',
        data: { labels: dateCon,
        datasets: [{
            data: eleCon,
            label: "WeekEle",
            borderColor: "#3e95cd",
            fill: false
        }]},
        options: {
        title: {
            text: "전력량",
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
                }
            }
        }
    }
    
    
    fn_weekEle(configs);
    
    var lineChart = new Chart(document.getElementById("line-chart"), configs); 
////////////////////////////////////////////////////////////////////////////////////////////////

    // 초기 그래프(주)
    let userConApp = [];
    let allConApp = [];
    //초기데이터
    var configs_bar = {
        type: 'horizontalBar',
        data: {
            labels: ["컴퓨터", "에어컨", "텔레비전", "난방기", "전기난로", "전기장판", "에어프라이어", "온냉방기", "생활가전"],
            datasets: [
                {
                    label: "User",
                    backgroundColor: ["#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000"],
                    data: userConApp
                },
                {
                    label: "AllUser",
                    backgroundColor: ["#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400"],
                    data: allConApp
                }
            ]
        },
        options: {
            title: {
                text: "가전기기별 전력량",
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
                        return datasetLabel + ': ' + tooltipItem.xLabel; // xLabel은 해당 데이터의 값입니다.
                    }
                }
            }
        }
    };
    
    function fn_weekEleApp(con) {
 	   //주그래프 데이터 셋 
         let userAppWeek = [];
         let allAppWeek = [];
         // 주 그래프 데이터
         var weekAppData  =  {
     type: 'horizontalBar',
     data: {
         labels: ["컴퓨터","에어컨","텔레비전","난방기","전기난로","전기장판","에어프라이어","온냉방기","생활가전"],
         datasets: [
             {
                 label: "User",
                 backgroundColor: ["#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000","#ff0000","#ff0000","#ff0000","#ff0000"],
                 data: userAppWeek
             },
             {
                 label: "AllUser",
                 backgroundColor: ["#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400","#ffe400","#ffe400","#ffe400","#ffe400"],
                 data: allAppWeek
             }
         ]
     },
 }
 		//주간 그래프 데이터 아작스로 가져오기
         $.ajax({
             url: '<c:url value="/weekInquiryAppDo" />',
             type: 'POST',
             contentType: 'application/json',
             dataType: 'json',
             data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),
             success: function (res) {
                 console.log("성공");
                 console.log(res);
                 userAppWeek.push(res[0]['userCom']);
                 userAppWeek.push(res[0]['userAircon']);
                 userAppWeek.push(res[0]['userTv']);
                 userAppWeek.push(res[0]['userHeat']);
                 userAppWeek.push(res[0]['userStove']);
                 userAppWeek.push(res[0]['userBlanket']);
                 userAppWeek.push(res[0]['userAfry']);
                 userAppWeek.push(res[0]['userAhs']);
                 userAppWeek.push(res[0]['userOther']);
                 
                 console.log(userAppWeek);
                 console.log(configs_bar.data.datasets[0].data);
                 configs_bar.data.datasets[0].data = userAppWeek;
                 
                 
                 allAppWeek.push(res[0]['allCom']);
                 allAppWeek.push(res[0]['allAircon']);
                 allAppWeek.push(res[0]['allTv']);
                 allAppWeek.push(res[0]['allHeat']);
                 allAppWeek.push(res[0]['allStove']);
                 allAppWeek.push(res[0]['allBlanket']);
                 allAppWeek.push(res[0]['allAfry']);
                 allAppWeek.push(res[0]['allAhs']);
                 allAppWeek.push(res[0]['allOther']);
                 
                 console.log(allAppWeek);
                 console.log(configs_bar.data.datasets[1].data);
                 configs_bar.data.datasets[1].data = allAppWeek;
                 
                 //////////////////////////
                 userConApp.push(res[0]['userCom']);
                 userConApp.push(res[0]['userAircon']);
                 userConApp.push(res[0]['userTv']);
                 userConApp.push(res[0]['userHeat']);
                 userConApp.push(res[0]['userStove']);
                 userConApp.push(res[0]['userBlanket']);
                 userConApp.push(res[0]['userAfry']);
                 userConApp.push(res[0]['userAhs']);
                 userConApp.push(res[0]['userOther']);
                 
                 console.log(userConApp);
                 console.log(configs_bar.data.datasets[0].data);
                 configs_bar.data.datasets[0].data = userConApp;
            
                 allConApp.push(res[0]['allCom']);
                 allConApp.push(res[0]['allAircon']);
                 allConApp.push(res[0]['allTv']);
                 allConApp.push(res[0]['allHeat']);
                 allConApp.push(res[0]['allStove']);
                 allConApp.push(res[0]['allBlanket']);
                 allConApp.push(res[0]['allAfry']);
                 allConApp.push(res[0]['allAhs']);
                 allConApp.push(res[0]['allOther']);
                 
                 console.log(allConApp);
                 console.log(configs_bar.data.datasets[1].data);
                 configs_bar.data.datasets[1].data = allConApp;
                 
                 barChart.update();
                 
                 
             },
             error: function (xhr, status, error) {
                 console.error('AJAX 오류: ' + status, error);
             }
         });
     }
     
     
//월
// 월그래프
    function fn_monthEleApp(con) {
	   //월그래프 데이터 셋 
        let userAppMonth = [];
        let allAppMonth = [];
        // 월 그래프 데이터
        var monthAppData  =  {
    type: 'horizontalBar',
    data: {
        labels: ["컴퓨터","에어컨","텔레비전","난방기","전기난로","전기장판","에어프라이어","온냉방기","생활가전"],
        datasets: [
            {
                label: "User",
                backgroundColor: ["#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000","#ff0000","#ff0000","#ff0000","#ff0000"],
                data: userAppMonth
            },
            {
                label: "AllUser",
                backgroundColor: ["#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400","#ffe400","#ffe400","#ffe400","#ffe400"],
                data: allAppMonth
            }
        ]
    },
}
		//월 그래프 데이터 아작스로 가져오기
        $.ajax({
            url: '<c:url value="/monthInquiryAppDo" />',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),
            success: function (res) {
                console.log("성공");
                console.log(res);
                userAppMonth.push(res[0]['userCom']);
                userAppMonth.push(res[0]['userAircon']);
                userAppMonth.push(res[0]['userTv']);
                userAppMonth.push(res[0]['userHeat']);
                userAppMonth.push(res[0]['userStove']);
                userAppMonth.push(res[0]['userBlanket']);
                userAppMonth.push(res[0]['userAfry']);
                userAppMonth.push(res[0]['userAhs']);
                userAppMonth.push(res[0]['userOther']);
                
                console.log(userAppMonth);
                console.log(configs_bar.data.datasets[0].data);
                configs_bar.data.datasets[0].data = userAppMonth;
                
                
                allAppMonth.push(res[0]['allCom']);
                allAppMonth.push(res[0]['allAircon']);
                allAppMonth.push(res[0]['allTv']);
                allAppMonth.push(res[0]['allHeat']);
                allAppMonth.push(res[0]['allStove']);
                allAppMonth.push(res[0]['allBlanket']);
                allAppMonth.push(res[0]['allAfry']);
                allAppMonth.push(res[0]['allAhs']);
                allAppMonth.push(res[0]['allOther']);
                
                console.log(allAppMonth);
                console.log(configs_bar.data.datasets[1].data);
                configs_bar.data.datasets[1].data = allAppMonth;
                
                
                barChart.update();
                
            },
            error: function (xhr, status, error) {
                console.error('AJAX 오류: ' + status, error);
            }
        });
    }
    
    
//연
    // 년 그래프
    function fn_yearEleApp(con) {
	   //년 그래프 데이터 셋 
        let userAppYear = [];
        let allAppYear = [];
        // 년 그래프 데이터
        var yearAppData  =  {
    type: 'horizontalBar',
    data: {
        labels: ["컴퓨터","에어컨","텔레비전","난방기","전기난로","전기장판","에어프라이어","온냉방기","생활가전"],
        datasets: [
            {
                label: "User",
                backgroundColor: ["#ff0000", "#ff0000", "#ff0000", "#ff0000", "#ff0000","#ff0000","#ff0000","#ff0000","#ff0000"],
                data: userAppYear
            },
            {
                label: "AllUser",
                backgroundColor: ["#ffe400", "#ffe400", "#ffe400", "#ffe400", "#ffe400","#ffe400","#ffe400","#ffe400","#ffe400"],
                data: allAppYear
            }
        ]
    },
}
		//년 그래프 데이터 아작스로 가져오기
        $.ajax({
            url: '<c:url value="/yearInquiryAppDo" />',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ memId: '${sessionScope.login.memId}' }),
            success: function (res) {
                console.log("성공");
                console.log(res);
                userAppYear.push(res[0]['userCom']);
                userAppYear.push(res[0]['userAircon']);
                userAppYear.push(res[0]['userTv']);
                userAppYear.push(res[0]['userHeat']);
                userAppYear.push(res[0]['userStove']);
                userAppYear.push(res[0]['userBlanket']);
                userAppYear.push(res[0]['userAfry']);
                userAppYear.push(res[0]['userAhs']);
                userAppYear.push(res[0]['userOther']);
                
                console.log(userAppYear);
                console.log(configs_bar.data.datasets[0].data);
                configs_bar.data.datasets[0].data = userAppYear;
                
                
                allAppYear.push(res[0]['allCom']);
                allAppYear.push(res[0]['allAircon']);
                allAppYear.push(res[0]['allTv']);
                allAppYear.push(res[0]['allHeat']);
                allAppYear.push(res[0]['allStove']);
                allAppYear.push(res[0]['allBlanket']);
                allAppYear.push(res[0]['allAfry']);
                allAppYear.push(res[0]['allAhs']);
                allAppYear.push(res[0]['allOther']);
                
                console.log(allAppYear);
                console.log(configs_bar.data.datasets[1].data);
                configs_bar.data.datasets[1].data = allAppYear;
                
                
                barChart.update();
                
            },
            error: function (xhr, status, error) {
                console.error('AJAX 오류: ' + status, error);
            }
        });
    }
    
fn_weekEleApp(configs_bar);
var barChart = new Chart(document.getElementById("bar-chart-horizontal"),configs_bar);
// 주, 월, 년 클릭 이벤트 리스너 추가
document.querySelector('.date_sel').addEventListener('change', function () {
    var selectedValue = this.value;

    if (selectedValue === 'week') {
        // 주간 데이터로 업데이트
        fn_weekEle(configs);
        fn_weekEleApp(configs_bar);
      /*   configs.data.labels = weekData.labels;
        configs.data.datasets[0].data = weekData.datasets[0].data;
        configs.data.datasets[0].label = weekData.datasets[0].label;
        configs.data.datasets[0].borderColor = weekData.datasets[0].borderColor;
        
        configs_bar.data.labels = weekAppData.data.labels;
        configs_bar.data.datasets[0] = weekAppData.data.datasets[0];
        configs_bar.data.datasets[1] = weekAppData.data.datasets[1]; */
    } else if (selectedValue === 'month') {
        // 월간 데이터로 업데이트
        fn_monthEle(configs);
        fn_monthEleApp(configs_bar);
       /*  configs.data.labels = monthData.labels;
        configs.data.datasets[0].data = monthData.datasets[0].data;
        configs.data.datasets[0].label = monthData.datasets[0].label;
        configs.data.datasets[0].borderColor = monthData.datasets[0].borderColor;

        configs_bar.data.labels = monthAppData.data.labels;
        configs_bar.data.datasets[0] = monthAppData.data.datasets[0];
        configs_bar.data.datasets[1] = monthAppData.data.datasets[1]; */
    } else if (selectedValue === 'year') {
        // 연간 데이터로 업데이트
      	fn_yearEle(configs);
      	fn_yearEleApp(configs_bar);
//         configs.data.labels = yearData.labels;
//         configs.data.datasets[0].data = yearData.datasets[0].data;
//         configs.data.datasets[0].label = yearData.datasets[0].label;
//         configs.data.datasets[0].borderColor = yearData.datasets[0].borderColor;

//         configs_bar.data.labels = yearAppData.data.labels;
//         configs_bar.data.datasets[0] = yearAppData.data.datasets[0];
//         configs_bar.data.datasets[1] = yearAppData.data.datasets[1];
        
    }

    // 차트 업데이트
   /*  lineChart.update();
    barChart.update(); */
});
    
  




</script>

</html>