<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 12. 5. 오전 9:17:50
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
    <title>요금 상세보기</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/splitMainCss/list.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/splitMainCss/eletric.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/splitMainCss/top.css">

    <style>
        #selCondition {
            width: 200px;
            border: 1px solid #C4C4C4;
            box-sizing: border-box;
            border-radius: 10px;
            padding: 12px 13px;
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
            line-height: 16px;
            margin-left: 30%;
        }

        #selCondition:focus {
            border: 1px solid #9B51E0;
            box-sizing: border-box;
            border-radius: 10px;
            outline: 3px solid #F8E4FF;
            border-radius: 10px;
        }

        #lastMonthBill {
            color: white;
            padding: 3%;
            /* text-align: center; */
            margin: 0 auto;
            max-width: 600px;
        }

        #cfEqCondition {
            /* background-color: skyblue; */
            padding: 3%;
            height: 43%;
        }
    </style>
</head>

<body>
    <div class="content-container">
        <div class="additional-div">

            <%@include file="/WEB-INF/inc/left.jsp" %>

        </div>
        <div class="main-contain">
            <div class="top">
                <div class="top-left">
                    <h1 class="title">요금 상세보기</h1>
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
                                <img class="img-mypage" src="${pageContext.request.contextPath}/assets/img/mypage.png"
                                    alt="" onclick="redirectToMyPage()">

                            </div>
                            <div class="right2-mypage">
                                <img class="img-logout" src="${pageContext.request.contextPath}/assets/img/logout.png"
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
                        <!-- 전월 납부 요금 안내 -->
                        <div id="lastMonthBill">
                            <h1>전 월 납부 요금</h1>
                            <div style="display: flex; height: 100px; align-items: center; justify-content: space-between; font-size: 30px; margin: 7%;">
                                <p id="lastMonth">월 요금</p>

                                <p style="padding: 15px; display: flex; align-items: center; background-color: rgba(0, 255, 255, 0.193);">
                                    ${getLsMonthBill.crEleBill} 원</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-3">
                        <!-- 목표 달성하기 -->
                        <div id="cfEqCondition">
                            <div style="display: flex;">
                                <h1 style="color: white; margin-left: 20px;">동일 조건 비교</h1>
                                <!-- 텍스트로 세부사항 안내 -->
                                <form name="searchCondi" atction="getAvgEqCondiDo" method="post" id=formCondi>
                                    <select name="searchOption" id="selCondition">
                                        <option value="menNo" selected>구성원 수</option>
                                        <option value="jobType">직업 형태</option>
                                        <option value="houseType">주거 형태</option>
                                        <option value="houseArea">주거 면적</option>
                                        <option value="region">지역</option>
                                    </select>
                                </form>
                            </div>
                            <div id="" style="margin-top: 30px; height: 230px; color: white;">
                                <!-- 비교 가로 막대바 그래프 -->
                                <canvas id="eqCondi"></canvas>
                            </div>

                            <div style="display: flex; justify-content: center; font-size:40px; color: white; margin-top: 30px; font-size: 20px;">
                                <p id=compUseEle></p>
                                <!-- (셀렉트박스 선택에 따라 변경) -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-right-1">
                    <div class="point-1">
                        <h1 id="printToday" style="color: white; margin: 20px; align-self: center;">요금  비교 그래프</h1>
                        <div style="height: 300px; margin: 5%; margin-top: 2%; padding: 3%; background-color: white; border-radius: 30px;">
                            <!-- 1~12월의 작년/올해 요금 막대그래프 / 데이터 없는 경우는 0으로 -->
                            <canvas id="eqMonth"></canvas>
                        </div>
                        <div style="height: 300px; overflow-y: auto; margin: 5%; margin-top: 2%; background-color: white;">
                            <!-- 날짜, 요금, 전년 대비 전력량, 전년대비 전기사용 증감률 -->
                            <table id="billRecords" style="border: black; text-align: center;">
                                <colgroup>
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="30%" />
                                    <col width="30%" />
                                </colgroup>
                                <thead style="position: sticky; top: 0; background-color: #f5f5f5; z-index: 100; font-weight: bold;">
                                    <tr>
                                        <td>요금 납부 월</td>
                                        <td>납부 요금</td>
                                        <td>전년대비 요금 변동 폭</td>
                                        <td>전년 대비 전기사용 증감률</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${billDetList}" var="billDet">
                                        <tr>
                                            <td>${billDet.billMonth}</td>
                                            <td>${billDet.crEleBill}원</td>
                                            <td>${billDet.billDiffLsYear}kWh</td>
                                            <td>${billDet.eleDiffRatio}%</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="${pageContext.request.contextPath}/js/bill-Chart.js"></script>
    <script src="${pageContext.request.contextPath}/js/list.js"></script>
    <script>

        $(document).ready(function () {
            /* 전월 납부요금 전월 정보 */
            // 현재 날짜를 가져오기
            var currentDate = new Date();
            // 지난달의 월 계산
            var lastMonth = currentDate.getMonth() - 1;
            if (lastMonth < 0) {
                lastMonth = 11; // 만약 1월인 경우, 12월로 설정
            }
            // 결과를 웹페이지에 출력
            $("#lastMonth").text((lastMonth + 1) + "월 요금");
        });
        
		/* 마이페이지, 로그아웃 */
        function redirectToMyPage() {
            var targetUrl = "${pageContext.request.contextPath}/myPageView";
            window.location.href = targetUrl;
        }
        function redirectTologout() {
            var targetUrl = "${pageContext.request.contextPath}/logoutDo";
            window.location.href = targetUrl;
        }



        /* START : CHART-BAR-DEMO.js */
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';
		
        /* [공통] 차트 설정 함수 */
        function number_format(number, decimals, dec_point, thousands_sep) {
            number = (number + '').replace(',', '').replace(' ', '');
            var n = !isFinite(+number) ? 0 : +number,
                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                s = '',
                toFixedFix = function (n, prec) {
                    var k = Math.pow(10, prec);
                    return '' + Math.round(n * k) / k;
                };
            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
            if (s[0].length > 3) {
                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
            }
            if ((s[1] || '').length < prec) {
                s[1] = s[1] || '';
                s[1] += new Array(prec - s[1].length + 1).join('0');
            }
            return s.join(dec);
        }
		
        /* 검색조건 별 호라이즌 차트 - 셀렉트박스의 요청이 필요해 ajax 통신 사용*/
        let search_form = $("form[name='searchCondi']");
        $(document).ready(function () {
            $('#selCondition').on('change', function () {
                var selectedOption = $("#selCondition").val();
                console.log(selectedOption);
                var memId = '${sessionScope.login.memId}';
                $.ajax({
                    type: 'POST',
                    url: '/getAvgEqCondi',
                    contentType: 'application/json',
                    data: JSON.stringify({ searchOption: selectedOption, memId: memId }),
                    success: function (response) {
                    	
                        var otherAvgBill = response[0].avgEleBill;
                        console.log('동일조건 평균 요금' + otherAvgBill);
                        var myAvgBill = response[1].avgEleBill;
                        console.log('우리집 평균 요금' + myAvgBill);
                        var compAvgBill = 0;
                        compAvgBill = myAvgBill - otherAvgBill;
                        var my = response;
                        console.log(response);

                        var selType = response[0].selNm;
                        console.log('선택한 타입 :' + selType);
                        var selTypeStr = selType + '평균';

                        var myType = response[1].selNm;
                        console.log('유저: ' + myType);

                        $("#compUseEle").text('다른 ' + selType + ' 사용자 대비 요금이 ' + compAvgBill + '원 차이납니다.');

                        // 작년 데이터셋
                        var myDataset = {
                            label: "우리집 평균",
                            backgroundColor: "#1654CF",
                            hoverBackgroundColor: "#5285ec",
                            borderColor: "#4e73df",
                            data: [myAvgBill],
                        };

                        // 올해 데이터셋
                        var otherDataset = {
                            label: selTypeStr,
                            backgroundColor: "#C0FD10",
                            hoverBackgroundColor: "#dbf689",
                            borderColor: "#4e73df",
                            data: [otherAvgBill],
                        };

                        var ctxCondi = document.getElementById("eqCondi");
                        var eqCondiChart = new Chart(ctxCondi, {
                            type: 'horizontalBar',
                            data: {
                                labels: [" "],
                                datasets: [myDataset, otherDataset],
                            },
                            options: {
                                maintainAspectRatio: false,
                                layout: {
                                    padding: {
                                        left: 10,
                                        right: 25,
                                        top: 25,
                                        bottom: 0
                                    }
                                },
                                scales: {
                                    xAxes: [{
                                        ticks: {
                                            min: 0,
                                            max: Math.max(myAvgBill, otherAvgBill), // 최대값을 기준으로 설정
                                            maxTicksLimit: 5,
                                            padding: 10,
                                            callback: function (value, index, values) {
                                                return '$' + number_format(value);
                                            }
                                        },
                                        gridLines: {
                                            color: "rgb(234, 236, 244)",
                                            zeroLineColor: "rgb(234, 236, 244)",
                                            drawBorder: false,
                                            borderDash: [2],
                                            zeroLineBorderDash: [2]
                                        }
                                    }],
                                    yAxes: [{
                                        time: {
                                            unit: 'month'
                                        },
                                        gridLines: {
                                            display: false,
                                            drawBorder: false
                                        },
                                        ticks: {
                                            maxTicksLimit: 6
                                        },
                                        maxBarThickness: 25,
                                    }],
                                },
                                legend: {
                                    display: true, // 범례 표시
                                },
                                // tooltips: {
                                // 	titleMarginBottom: 10,
                                // 	titleFontColor: '#6e707e',
                                // 	titleFontSize: 14,
                                // 	backgroundColor: "rgb(255,255,255)",
                                // 	bodyFontColor: "#858796",
                                // 	borderColor: '#dddfeb',
                                // 	borderWidth: 1,
                                // 	xPadding: 15,
                                // 	yPadding: 15,
                                // 	displayColors: false,
                                // 	caretPadding: 10,
                                // 	callbacks: {
                                // 		label: function (tooltipItem, chart) {
                                // 			var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                // 			return datasetLabel + ': $' + number_format(tooltipItem.xLabel);
                                // 		}
                                // 	}
                                // },
                            }
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error('AJAX request failed: ' + status + ', ' + error);
                    }
                });
            });
        });




        // Bar Chart Example
        // // 1~12월의 작년/올해 요금 막대그래프 / 데이터 없는 경우는 0으로
        var thisYearData = [];
        '<c:forEach items="${getListThisYearBills}" var="bill">';
        thisYearData.push('${bill.crEleBill}');
        '</c:forEach>';
        var lastYearData = [];
        '<c:forEach items="${getListLsYearBills}" var="bill">';
        lastYearData.push('${bill.crEleBill}');
        '</c:forEach>';

        // 데이터를 라벨 및 데이터셋으로 구성
        var labels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];

        // 작년 데이터셋
        var lastYearDataset = {
            label: "작년 요금",
            backgroundColor: "#C0FD10",
            hoverBackgroundColor: "#dbf689",
            borderColor: "#4e73df",
            data: lastYearData,
        };

        // 올해 데이터셋
        var thisYearDataset = {
            label: "올해 요금",
            backgroundColor: "#1654CF",
            hoverBackgroundColor: "#5285ec",
            borderColor: "#4e73df",
            data: thisYearData,
        };

        // 차트 생성
        var ctxMonth = document.getElementById("eqMonth").getContext("2d");
        var eqMonthChart = new Chart(ctxMonth, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [lastYearDataset, thisYearDataset],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'month'
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 6
                        },
                        maxBarThickness: 25,
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: Math.max(...thisYearData, ...lastYearData), // 최대값을 기준으로 설정
                            maxTicksLimit: 5,
                            padding: 10,
                            callback: function (value, index, values) {
                                return '$' + number_format(value);
                            }
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [2],
                            zeroLineBorderDash: [2]
                        }
                    }],
                },
                legend: {
                    display: true, // 범례 표시
                },
                tooltips: {
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function (tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                        }
                    }
                },
            }
        });
        /* END : CHART-BAR-DEMO.js */
    </script>
</body>

</html>