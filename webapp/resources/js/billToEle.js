/* 
함수명 : clacBTE
함수설명 : 전기요금을 집유형, 달정보에 기반한 대략적인 전력량으로 계산
변수 설명
- targetBill : 계산할 요금
- houseType : 집 유형 (1:단독주택, 2:빌라, 3:아파트 || 임의로 1,2 는 저압 / 3은 고압으로 설정)
            : 구간별 기본/전력량 책정 요금이 다름
- month : 달 정보 
        : 7, 8, 12, 1, 2 월 : 슈퍼유저요금 책정 : 1000kWh 넘는 양에 대한 전력량요금 기준 변경
        : 7, 8 : 하계요금 책정 : 전력량요금의 구간 변경
결과값 : resultEle : 예상 전력량
*/
function clacBTE(targetBill, houseType, month) {

    // 목표 금액에서 부가가치세와 전력산업기반기금을 제외한 순수 전기 사용 요금 추정
    var netElectricityBill = targetBill / 1.147; // 대략적인 역산 공식

    // 전력 소비량 추정을 위한 변수 초기화
    var resultEle = 0;
    var closestBillDifference = Infinity;

    // 각 요금 구간에 대해 전력 소비량 추정
    for (var consumption = 0; consumption <= 20000; consumption += 10) { // 예시로 2000까지, 10단위로 증가
        var calculatedBill = clacETB(consumption, houseType, month);

        var billDifference = Math.abs(calculatedBill - netElectricityBill);
        if (billDifference < closestBillDifference) {
            closestBillDifference = billDifference;
            resultEle = consumption;
        }
    }
    // $("#resultEle").text(resultEle);
    // console.log(targetBill, houseType, month);
    // return resultEle;

    // 결과를 콜백 함수를 통해 전달
    callback(resultEle);
    console.log(targetBill, houseType, month);

    // return 구문이 있어도 되고 없어도 됩니다.
    return resultEle;
}

// // 예시 사용법
// var resultEle = clacBTE(50000, 2, '12');
// console.log("추정 전력 소비량: " + resultEle + " kWh");