/* 
함수명 : clacETB
함수설명 : 전력량, 고압/저압 분류, 계절(하계, 슈퍼유저요금)에 따른 전기요금 계산
변수 설명
- electricityConsumption : 계산할 총 전력량
- houseType : 집 유형 (1:단독주택, 2:빌라, 3:아파트 || 임의로 1,2 는 저압 / 3은 고압으로 설정)
            : 구간별 기본/전력량 책정 요금이 다름
- month : 달 정보 
        : 7, 8, 12, 1, 2 월 : 슈퍼유저요금 책정 : 1000kWh 넘는 양에 대한 전력량요금 기준 변경
        : 7, 8 : 하계요금 책정 : 전력량요금의 구간 변경
결과값 : resultBill : 최종 요금
*/
function clacETB(electricityConsumption, houseType, month) {
  // 요금 매개변수 정의
  var lowVoltageBasicRates = [910, 1600, 7300];
  var lowVoltageEnergyRates = [120.0, 214.6, 307.3];
  var lowSuperUserRate = 736.2;
  var highVoltageBasicRates = [730, 1260, 6060];
  var highVoltageEnergyRates = [105.0, 174.0, 242.3];
  var highVoltageSuperUserRate = 601.3;

  // 전압 유형에 따라 요금 매개 변수 선택
  var basicRates, energyRates, superUserRate;
  if (houseType == 1 || houseType == 2) {
    basicRates = lowVoltageBasicRates;
    energyRates = lowVoltageEnergyRates;
    superUserRate = (month === '7' || month === '8' || month === '12' || month === '1' || month === '2') ? lowSuperUserRate : 0;
  } else if (houseType == 3) {
    basicRates = highVoltageBasicRates;
    energyRates = highVoltageEnergyRates;
    superUserRate = (month === '7' || month === '8' || month === '12' || month === '1' || month === '2') ? highVoltageSuperUserRate : 0;
  } else {
    alert("1, 2, 3 중 하나의 값이어야 합니다.");
    throw new Error("1, 2, 3 중 하나의 값이어야 합니다.");

  }

  // 전력량 요금 계산
  var basicCharge, energyCharge;
  if (month === '7' || month === '8') {
    if (electricityConsumption <= 300) {
      basicCharge = basicRates[0];
      energyCharge = electricityConsumption * energyRates[0];
    } else if (electricityConsumption <= 450) {
      basicCharge = basicRates[1];
      energyCharge = 300 * energyRates[0] + (electricityConsumption - 300) * energyRates[1];
    } else if (electricityConsumption <= 1000) {
      basicCharge = basicRates[2];
      energyCharge = 300 * energyRates[0] + 150 * energyRates[1] + (electricityConsumption - 450) * energyRates[2];
    } else {
      basicCharge = basicRates[2];
      energyCharge = 300 * energyRates[0] + 150 * energyRates[1] + 550 * energyRates[2] + (electricityConsumption - 1000) * superUserRate;
    }
  } else if (month === '12' || month === '1' || month === '2') {
    if (electricityConsumption <= 200) {
      basicCharge = basicRates[0];
      energyCharge = electricityConsumption * energyRates[0];
    } else if (electricityConsumption <= 400) {
      basicCharge = basicRates[1];
      energyCharge = 200 * energyRates[0] + (electricityConsumption - 200) * energyRates[1];
    } else if (electricityConsumption <= 1000) {
      basicCharge = basicRates[2];
      energyCharge = 200 * energyRates[0] + 200 * energyRates[1] + (electricityConsumption - 400) * energyRates[2];
    } else {
      basicCharge = basicRates[2];
      energyCharge = 200 * energyRates[0] + 200 * energyRates[1] + 600 * energyRates[2] + (electricityConsumption - 1000) * superUserRate;
    }
  } else if (month === '3' || month === '4' || month === '5' || month === '6' || month === '9' || month === '10' || month === '11') {
    if (electricityConsumption <= 200) {
      basicCharge = basicRates[0];
      energyCharge = electricityConsumption * energyRates[0];
    } else if (electricityConsumption <= 400) {
      basicCharge = basicRates[1];
      energyCharge = 200 * energyRates[0] + (electricityConsumption - 200) * energyRates[1];
    } else if (electricityConsumption > 400) {
      basicCharge = basicRates[2];
      energyCharge = 200 * energyRates[0] + 200 * energyRates[1] + (electricityConsumption - 400) * energyRates[2];
    }
  } else {
    alert("월 정보를 확인해주세요.");
    throw new Error("월 정보를 확인해주세요.");
  }

  // 기타 요금 계산
  var beEnvironFee = electricityConsumption * 9.00;
  var environFee = Math.floor(beEnvironFee);
  var beFuelCost = electricityConsumption * 5.00;
  var fuelCost = Math.floor(beFuelCost);

  // 전기요금 계산
  var eleCost = basicCharge + energyCharge + environFee + fuelCost;

  // 부가가치세 계산
  var vat = Math.round(eleCost * 0.1);

  // 전력산업기반기금 계산
  var powerIndustryFund = Math.round(eleCost * 0.037);
  powerIndustryFund = Math.floor(powerIndustryFund / 10) * 10;

  // 청구금액 계산
  var resultBill = Math.floor((eleCost + vat + powerIndustryFund) / 10) * 10;

  // 결과 출력
  // $("#resultBill").text(resultBill);
  // console.log(electricityConsumption, houseType, month);
  // return resultBill;
  // 결과를 콜백 함수를 통해 전달
  callback(resultBill);
  console.log(electricityConsumption, houseType, month);

  // return 구문이 있어도 되고 없어도 됩니다.
  return resultBill;
}
