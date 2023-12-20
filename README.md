건물 에너지 빅데이터를 활용한 사용자 맞춤형 전력 소비 예측 시스템 
# 전력량 요금 계산
### 데이터 전처리
[AIHub의 전력신사업을 위한 전라남도 지역 전력소비패턴 데이터](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=71359)
<br> 기존 1시간 단위의 전력량 데이터와 개별 아이디의 가전제품 평균 사용 시간 설문 조사에 따라 주로 사용하는 7개 가전과 기타 생활가전 총 8개의 항목으로 나누어 1분 단위의 전력 소모량을 부여하여 *프로젝트 목적에 맞는 형태로 데이터 전처리*

| MEM_ID | USE_DT | COMPUTER | AIRCON | TV | HEAT | STOVE | BLANKET | AFRY | AHS | OTHER_APPLIANCES |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|회원 ID |날짜|컴퓨터|에어컨|텔레비전|난방기|전기난로|전기장판|에어 프라이어|온냉방기|기타 가전제품|

### 전력량을 전기요금으로 계산함수
[한전 전기공급약관](https://cyber.kepco.co.kr/ckepco/front/jsp/CY/D/C/CYDCHP00401.jsp)
<br>약관에 의거하여 생성한 요금 계산 함수<br>
- 데이터베이스에 저장된 데이터를 빠르게 계산하기 위해 Oracle Function으로 생성
    | 변수명 | 타입 | 의미 |
    |------- | ---- | ---- |
    |electricityConsumption | Number | 소비 전력량(kWh) |
    |targetBill | Number | 요금(원) |
    |houseType| Number | 저압[1 또는 2]/ 고압[3] |
    |p_month| Number | 전력 소비 월 정보 [1 ~ 12] |
    *임의로 저압[단독주택 1,빌라 2], 고압[아파트 3]으로 분류*
<details>
<summary>(✨CODE )전력량을 전기요금으로 계산함수</summary>
<div markdown="1">
    
        create or replace NONEDITIONABLE FUNCTION calcETB(electricityConsumption IN NUMBER, houseType IN NUMBER, p_month IN VARCHAR2) RETURN NUMBER IS
            -- 요금 매개변수 정의
            lowVoltageBasicRates NUMBER_ARRAY := NUMBER_ARRAY(910, 1600, 7300);
            lowVoltageEnergyRates NUMBER_ARRAY := NUMBER_ARRAY(120.0, 214.6, 307.3);
            lowSuperUserRate NUMBER := 736.2;
            highVoltageBasicRates NUMBER_ARRAY := NUMBER_ARRAY(730, 1260, 6060);
            highVoltageEnergyRates NUMBER_ARRAY := NUMBER_ARRAY(105.0, 174.0, 242.3);
            highVoltageSuperUserRate NUMBER := 601.3;

            basicRates NUMBER_ARRAY;
            energyRates NUMBER_ARRAY;
            superUserRate NUMBER;

            basicCharge NUMBER;
            energyCharge NUMBER;
            beEnvironFee NUMBER;
            environFee NUMBER;
            beFuelCost NUMBER;
            fuelCost NUMBER;
            eleCost NUMBER;
            vat NUMBER;
            powerIndustryFund NUMBER;
            resultBill NUMBER;
        BEGIN
            -- 전압 유형에 따라 요금 매개 변수 선택
            IF houseType = 1 OR houseType = 2 THEN
                basicRates := lowVoltageBasicRates;
                energyRates := lowVoltageEnergyRates;
                IF p_month IN ('7', '8', '12', '1', '2') THEN
                    superUserRate := lowSuperUserRate;
                ELSE
                    superUserRate := 0;
                END IF;
            ELSIF houseType = 3 THEN
                basicRates := highVoltageBasicRates;
                energyRates := highVoltageEnergyRates;
                IF p_month IN ('7', '8', '12', '1', '2') THEN
                    superUserRate := highVoltageSuperUserRate;
                ELSE
                    superUserRate := 0;
                END IF;
            ELSE
                RAISE_APPLICATION_ERROR(-20001, 'House type must be 1, 2, or 3');
            END IF;

            -- 전력량 요금 계산
            -- 전력량 요금 계산
            IF p_month IN ('7', '8') THEN
                IF electricityConsumption <= 300 THEN
                    basicCharge := basicRates(1);
                    energyCharge := electricityConsumption * energyRates(1);
                ELSIF electricityConsumption <= 450 THEN
                    basicCharge := basicRates(2);
                    energyCharge := 300 * energyRates(1) + (electricityConsumption - 300) * energyRates(2);
                ELSIF electricityConsumption <= 1000 THEN
                    basicCharge := basicRates(3);
                    energyCharge := 300 * energyRates(1) + 150 * energyRates(2) + (electricityConsumption - 450) * energyRates(3);
                ELSE
                    basicCharge := basicRates(3);
                    energyCharge := 300 * energyRates(1) + 150 * energyRates(2) + 550 * energyRates(3) + (electricityConsumption - 1000) * superUserRate;
                END IF;
            ELSIF p_month IN ('12', '1', '2') THEN
                IF electricityConsumption <= 200 THEN
                    basicCharge := basicRates(1);
                    energyCharge := electricityConsumption * energyRates(1);
                ELSIF electricityConsumption <= 400 THEN
                    basicCharge := basicRates(2);
                    energyCharge := 200 * energyRates(1) + (electricityConsumption - 200) * energyRates(2);
                ELSIF electricityConsumption <= 1000 THEN
                    basicCharge := basicRates(3);
                    energyCharge := 200 * energyRates(1) + 200 * energyRates(2) + (electricityConsumption - 400) * energyRates(3);
                ELSE
                    basicCharge := basicRates(3);
                    energyCharge := 200 * energyRates(1) + 200 * energyRates(2) + 600 * energyRates(3) + (electricityConsumption - 1000) * superUserRate;
                END IF;
            ELSIF p_month IN ('3', '4', '5', '6', '9', '10', '11') THEN
                IF electricityConsumption <= 200 THEN
                    basicCharge := basicRates(1);
                    energyCharge := electricityConsumption * energyRates(1);
                ELSIF electricityConsumption <= 400 THEN
                    basicCharge := basicRates(2);
                    energyCharge := 200 * energyRates(1) + (electricityConsumption - 200) * energyRates(2);
                ELSE
                    basicCharge := basicRates(3);
                    energyCharge := 200 * energyRates(1) + 200 * energyRates(2) + (electricityConsumption - 400) * energyRates(3);
                END IF;
            ELSE
                RAISE_APPLICATION_ERROR(-20002, 'Check the month information');
            END IF;

            -- 기타 요금 계산
            beEnvironFee := electricityConsumption * 9.00;
            environFee := FLOOR(beEnvironFee);
            beFuelCost := electricityConsumption * 5.00;
            fuelCost := FLOOR(beFuelCost);

            -- 전기요금 계산
            eleCost := basicCharge + energyCharge + environFee + fuelCost;

            -- 부가가치세 계산
            vat := ROUND(eleCost * 0.1);

            -- 전력산업기반기금 계산
            powerIndustryFund := ROUND(eleCost * 0.037);
            powerIndustryFund := FLOOR(powerIndustryFund / 10) * 10;

            -- 청구금액 계산
            resultBill := FLOOR((eleCost + vat + powerIndustryFund) / 10) * 10;

            RETURN resultBill;
        END calcETB;
</div>
</details>

<details>
<summary>(✨CODE )전기요금을 예상 전력량으로 계산함수</summary>
<div markdown="1">
    
    create or replace NONEDITIONABLE FUNCTION calcBTE(targetBill IN NUMBER, houseType IN NUMBER, month IN VARCHAR2) RETURN NUMBER IS
        netElectricityBill NUMBER;
        resultEle NUMBER := 0;
        closestBillDifference NUMBER := 1e6; -- Infinity에 해당하는 큰 숫자로 초기화
        calculatedBill NUMBER;
        billDifference NUMBER;
        consumption NUMBER := 0;
    BEGIN
        -- 목표 금액에서 부가가치세와 전력산업기반기금을 제외한 순수 전기 사용 요금 추정
        netElectricityBill := targetBill / 1.147;

        -- 각 요금 구간에 대해 전력 소비량 추정
        LOOP
            EXIT WHEN consumption > 50000; -- 최대 소비량 제한

            calculatedBill := calcETB(consumption, houseType, month);
            billDifference := ABS(calculatedBill - netElectricityBill);

            IF billDifference < closestBillDifference THEN
                closestBillDifference := billDifference;
                resultEle := consumption;
            END IF;

            consumption := consumption + 10; -- 10단위로 증가
        END LOOP;

        -- 결과 전력 소비량에 8% 추가
        resultEle := resultEle + resultEle * 0.08;

        RETURN resultEle;
    END calcBTE;
</div>
</details>

- calcETB 함수를 활용
- _전력 소비량을 추정하는 과정에서 오차 발생, 근사치를 구할수 있음_

### 월 단위의 총 전력량과 요금함수 결과값 테이블 생성
1. 조회 시 함수 계산 로딩 시간을 줄이기 위해 ele_bill 테이블 생성
    | COLUMN | COMMENT | 
    | --- | --- |
    | MEM_ID            |회원 고유 번호           |
    | BILL_MONTH        |요금 납부 월            |
    | CR_TOTAL_ELE      |당월 전력량 총합         |
    | CR_ELE_BILL       |당월 전기요금            |
    | BILL_DIFF_LS_YEAR |작년 대비 요금 증/감 값    |
    | ELE_DIFF_RATIO    |작년 대비 전력량 증/감 비율  |
    <details>
    <summary>(✨CODE )ELE_BILL Create문</summary>
    <div markdown="1">

        CREATE TABLE ele_bill (
            mem_id,
            bill_month,
            cr_total_ele,
            cr_ele_bill,
            bill_diff_ls_year,
            ele_diff_ratio
        ) AS 
            (SELECT  current_month.mem_id                            AS mem_id,
                    TO_CHAR(current_month.bill_month, 'YYYY/MM')    AS bill_month,
                    NVL(current_month.mo_total_ele, 0)              AS cr_total_ele,
                    NVL(current_month.mo_ele_bill, 0)               AS cr_ele_bill,
                    CASE WHEN NVL(last_year_month.mo_ele_bill, 0) = 0 THEN 0
                        ELSE  current_month.mo_ele_bill - last_year_month.mo_ele_bill
                    END AS bill_diff_ls_year,
                    CASE WHEN NVL(last_year_month.mo_total_ele, 0) = 0 THEN 0
                        ELSE ROUND((NVL(current_month.mo_total_ele, 0) - NVL(last_year_month.mo_total_ele, 0)) / NULLIF(NVL(current_month.mo_total_ele, 0), 0) * 100, 3)
                    END AS ele_diff_ratio
            FROM (
                SELECT  a.mem_id AS mem_id,
                        TO_DATE(TO_CHAR(a.use_dt, 'YYYY/MM'), 'YYYY/MM') AS bill_month,
                        ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3) AS mo_total_ele,
                        calcETB(ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3),
                                b.house_type,
                                TO_NUMBER(TO_CHAR(a.use_dt, 'MM')) ) AS mo_ele_bill
                FROM mem_app_ele a, member b
                WHERE a.mem_id = b.mem_id
                AND TO_CHAR(a.use_dt, 'YYYY/MM') = TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'YYYY/MM') -- 현재 시점의 지난 달 데이터 필터링
                GROUP BY    a.mem_id,
                            TO_CHAR(a.use_dt, 'YYYY/MM'),
                            TO_CHAR(a.use_dt, 'MM'),
                            b.house_type
                ) current_month, 
                (
                SELECT  a.mem_id,
                        TO_DATE(TO_CHAR(a.use_dt, 'YYYY/MM'), 'YYYY/MM') AS bill_month,
                        ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3) AS mo_total_ele,
                        calcETB(ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3),
                                b.house_type,
                                TO_NUMBER(TO_CHAR(a.use_dt, 'MM')) ) AS mo_ele_bill
                FROM mem_app_ele a, member b
                WHERE   a.mem_id = b.mem_id
                AND TO_CHAR(a.use_dt, 'YYYY/MM') = TO_CHAR(ADD_MONTHS(SYSDATE, -13), 'YYYY/MM') -- 지난 달의 작년 동월 데이터 필터링
                GROUP BY    a.mem_id,
                            TO_CHAR(a.use_dt, 'YYYY/MM'),
                            TO_CHAR(a.use_dt, 'MM'),
                            b.house_type
                ) last_year_month
            WHERE current_month.mem_id = last_year_month.mem_id (+)
            AND ADD_MONTHS(current_month.bill_month, -12) = last_year_month.bill_month
        );
    </div>
    </details>
<br>

2. 지난달 누적 전력에 대한 행을 insert 하는 프로시저 생성<br>
    *프로시저란 DB 에 대한 일련의 작업을 정리한 절차를 관계형 데이터베이스 관리 시스템에 저장한 것*
    #### 프로시저(Procedure)와 함수(Function)의 차이
    |프로시저(Procedure)|함수(Function)|
    |-----|-----|
    | 특정 작업을 수행 | 특정 계산을 수행 |
    | 리턴값을 가질수도 안가질수도 있음 | 리턴값을 반드시 가짐 |
    | 리턴값을 여러개 가질 수 있음 | 리턴값을 로직 하나만 가질 수 있음 |
    | 서버(DB)단에서 기술 | 화면(Cliendt)단에서 기술 |
    | 수식 내에서 사용 불가 | 수식 내에서만 사용 가능 |
    | 단독으로 문장 구성 가능 | 단독으로 문장 구성 불가 |
    <details>
    <summary>(✨CODE )프로시저 생성</summary>
    <div markdown="1">

        create or replace NONEDITIONABLE PROCEDURE monthly_ele_bill IS
        BEGIN
            -- 여기에 작업 코드 작성
            DBMS_OUTPUT.PUT_LINE('start'); -- 예시 코드, 실제 작업에 맞게 변경하세요.
            INSERT INTO ele_bill (  mem_id,
                                    bill_month,
                                    cr_total_ele,
                                    cr_ele_bill,
                                    bill_diff_ls_year,
                                    ele_diff_ratio
                                )
            SELECT  current_month.mem_id                            AS mem_id,
                    TO_CHAR(current_month.bill_month, 'YYYY/MM')    AS bill_month,
                    NVL(current_month.mo_total_ele, 0)              AS cr_total_ele,
                    NVL(current_month.mo_ele_bill, 0)               AS cr_ele_bill,
                    CASE WHEN NVL(last_year_month.mo_ele_bill, 0) = 0 THEN 0
                        ELSE  current_month.mo_ele_bill - last_year_month.mo_ele_bill
                    END AS bill_diff_ls_year,
                    CASE WHEN NVL(last_year_month.mo_total_ele, 0) = 0 THEN 0
                        ELSE ROUND((NVL(current_month.mo_total_ele, 0) - NVL(last_year_month.mo_total_ele, 0)) / NULLIF(NVL(current_month.mo_total_ele, 0), 0) * 100, 3)
                    END AS ele_diff_ratio
            FROM (
                SELECT  a.mem_id AS mem_id,
                        TO_DATE(TO_CHAR(a.use_dt, 'YYYY/MM'), 'YYYY/MM') AS bill_month,
                        ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3) AS mo_total_ele,
                        calcETB(ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3),
                                b.house_type,
                                TO_NUMBER(TO_CHAR(a.use_dt, 'MM')) ) AS mo_ele_bill
                FROM mem_app_ele a, member b
                WHERE a.mem_id = b.mem_id
                AND TO_CHAR(a.use_dt, 'YYYY/MM') = TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'YYYY/MM') -- 현재 시점의 지난 달 데이터 필터링
                GROUP BY    a.mem_id,
                            TO_CHAR(a.use_dt, 'YYYY/MM'),
                            TO_CHAR(a.use_dt, 'MM'),
                            b.house_type
                ) current_month, 
                (
                SELECT  a.mem_id,
                        TO_DATE(TO_CHAR(a.use_dt, 'YYYY/MM'), 'YYYY/MM') AS bill_month,
                        ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3) AS mo_total_ele,
                        calcETB(ROUND(SUM(a.DT + a.AIRCON + a.TV + a.HEAT + a.STOVE + a.BLANKET + a.AFRY + a.AHS + a.OTHER_APPLIANCES), 3),
                                b.house_type,
                                TO_NUMBER(TO_CHAR(a.use_dt, 'MM')) ) AS mo_ele_bill
                FROM mem_app_ele a, member b
                WHERE   a.mem_id = b.mem_id
                AND TO_CHAR(a.use_dt, 'YYYY/MM') = TO_CHAR(ADD_MONTHS(SYSDATE, -13), 'YYYY/MM') -- 지난 달의 작년 동월 데이터 필터링
                GROUP BY    a.mem_id,
                            TO_CHAR(a.use_dt, 'YYYY/MM'),
                            TO_CHAR(a.use_dt, 'MM'),
                            b.house_type
                ) last_year_month
            WHERE current_month.mem_id = last_year_month.mem_id (+)
            AND ADD_MONTHS(current_month.bill_month, -12) = last_year_month.bill_month;
        END monthly_ele_bill;
    </div>
    </details>
    <br><br>

3. 한달 전력량이 모두 누적된 매월 1일 오전 3시 스케쥴러 생성<br>
    *특정 작업이나 프로세스가 자동으로 실행되도록 예약하는 프로세스*
    <details>
    <summary>(✨CODE )스케쥴러 실행문</summary>
    <div markdown="1">

        BEGIN
            DBMS_SCHEDULER.CREATE_JOB (
                job_name        => 'job_monthly_ele_bill',
                job_type        => 'PLSQL_BLOCK',
                job_action      => 'BEGIN monthly_ele_bill; END;',
                start_date      => TO_TIMESTAMP_TZ('2023-01-01 03:00:00 Asia/Seoul', 'YYYY-MM-DD HH24:MI:SS TZR'),
                repeat_interval => 'FREQ=MONTHLY; BYMONTHDAY=1; BYHOUR=3; BYMINUTE=0', -- 매월 1일 03:00에 실행
                enabled         => TRUE
            );
        END;
    </div>
    </details>
    <br>

# 요금 계획하기 페이지
![계산기 입력 전](https://github.com/Yoon1717/TeamEcoala/assets/142978097/f8f90ee3-4b18-474e-8672-664c61703e7f)
![요금 계획하기](https://github.com/Yoon1717/TeamEcoala/assets/142978097/a9474b6e-5486-41db-8afb-9e35e618a1ce)
### 이번 달 요금 계획 계산기
사용자의 입력 요금에 대한 사용 가능한 전력량과 실제 사용량을 비교하여 잔여 전력량을 직관적으로 시각화

    1. 사용자에게 목표금액 입력, 버튼 클릭
    2. 사용자 ID, 거주유형, 내달의 총 전력량을 서버에서 조회해오는 컨트롤러에 비동기통신요청
    3. 사용자의 입력에 대한 요금과 실제 사용에 대한 요금을 계산
    4. 결과값 초과, 동일, 미만인 각각의 상황에 대한 화면 출력



### 이번 달 요금 예상 차트
이번 달의 실제 사용량과 예측 사용량을 차트로 보여주며, 예상 요금을 안내
*하루씩 예측하고 예측치를 포함해 다음일자를 예측하는 방식을 선택*

    1. 화면에서 로그인된 유저의 아이디를 비동기통신을 통해 flask 서버에 전송
    2. 해당 유저의 오늘을 제외한 60일의 일별 전력량과 현재 날짜부터 해당 월의 마지말 날짜까지의 날짜를 조회
    3.  남은 일자만큼 모델로 예측, 예측한 값을 다시 화면으로 전송
    4. JSON 형식으로 전달된 데이터 파싱 후 일별 예측 전력량 데이터를 변수에 담기
    5. 하이차트 라이브러리 활용해 화면에 그래프 출력
        
<br>







# 요금 상세보기 페이지
![billDetView 요금 상세보기](https://github.com/Yoon1717/TeamEcoala/assets/142978097/bc8eecd8-51fd-4404-9acb-ae5066242f92)

1. 전 월 납부 요금 / 작년과 올해 동월 전기요금 비교 그래프 / 월별 전기요금과 세부사항 표

        1. 컨트롤러를 해당 URL에 맵핑하여 사이드 메뉴의 '요금 상세보기' 요소를 누르면 실행
        2. 컨트롤러는 사용자의 세션에서 로그인 정보를 가져와 해당 회원의 전월 납부 요금, 올해 및 작년 요금 그래프, 그리고 월별 요금 비교에 필요한 데이터를 데이터베이스에서 조회하여 모델에 담아 해당 뷰로 전달
        3. 이후, "user/billDet/billDetView" 뷰 페이지로 이동
        4. Expression Language(${...})과 JSP Standard Tag Library(<c:forEach>)를 활용해 서버에서 조회한 값을 화면에 출력 

2. 동일 조건 비교

        1. 사용자가 회원가입 시 선택하는 5개의 주거조건에 대한 셀렉트박스
        2. 사용자 선택과 회원ID를 form태그와 비동기 통신을 활용해 컨트롤러에 전송
        3. mybatis의 동적 SQL을 활용해 사용자의 요금평균, 동일 조건의 사용자들 요금 평균을 UNION 쿼리로 조회
        4. ResponseEntity 를 활용해 조회한 값을 화면으로 리턴
        5. 리턴된 값 chart.js 라이브러리를 활용해 조건별 출력

    <br>_일반적인 Controller에서는 HTTP 응답을 제어할수 없기 때문에 더 세밀한 제어를 위해 ResponseEntity를 사용해 적절한 상태코드와 응답 헤더 및 응답 본문을 사용해 클라이언트에 전달이 가능_

    <details>
    <summary>(✨CODE )사용자/동일조건사용자 평균 조회 쿼리</summary>
    <div markdown="1">

        <select id="getAvgEqCondi" resultType="BillDetVO" parameterType="BillDetVO">
            SELECT 'user' as division
                , ROUND(AVG (a.cr_ele_bill), 0) as avg_ele_bill
                , ROUND(AVG (a.cr_total_ele), 0) as avg_ele
                , '선택한 조건' as sel_nm
            FROM ele_bill a, member b
            WHERE a.mem_id = b.mem_id
            AND a.mem_id = #{memId}
            <include refid="groupByTYPE"></include>
            UNION
            SELECT 'other' as division
                , ROUND(AVG (a.cr_ele_bill), 0) as avg_ele_bill
                , ROUND(AVG (a.cr_total_ele), 0) as avg_ele
                <include refid="selectSelNM"></include>
            FROM ele_bill a,  member b
            WHERE a.mem_id = b.mem_id
            <if test="@org.apache.commons.lang3.StringUtils@isNotBlank(searchOption)">
                <choose>
                    <when test='searchOption=="houseType"'>
                        AND  b.house_type = (SELECT HOUSE_TYPE 
                                FROM member
                                WHERE mem_id = #{memId}
                                )
                    </when>
                    <when test='searchOption=="menNo"'>
                        AND  b.MEM_NO = (SELECT  MEM_NO
                                FROM member
                                WHERE mem_id = #{memId}
                                )
                    </when>
                    <when test='searchOption=="houseArea"'>
                        AND  b.HOUSE_AREA = (SELECT HOUSE_AREA 
                                FROM member
                                WHERE mem_id = #{memId}
                                )
                    </when>
                    <when test='searchOption=="region"'>
                        AND  b.REGION = (SELECT REGION 
                                FROM member
                                WHERE mem_id = #{memId}
                                )
                    </when>
                    <when test='searchOption=="jobType"'>
                        AND  b.JOB_TYPE = (SELECT JOB_TYPE 
                                FROM member
                                WHERE mem_id = #{memId}
                                )
                    </when>
                </choose>
            </if>
            <include refid="groupByTYPE"></include>
        </select>    
    </div>
    </details>
    <br>    



# 게시판(사용자)
![BoardView 게시판 리스트](https://github.com/Yoon1717/TeamEcoala/assets/142978097/12f77cf1-c7de-4f6a-b675-8578bf4e167f)
![BoardView 검색](https://github.com/Yoon1717/TeamEcoala/assets/142978097/6d6496dd-606c-40fb-8dda-2be47af3e5bc)

        1. 게시글 조회
        2. 검색
        3. 페이징 처리
        4. textarea의 개행 문자 HTML 줄바꿈 태그로 대체
        5. 좋아요 (등록과 취소)
        6. 글 작성자와 로그인한 아이디가 같다면 게시글 수정/삭제 가능
        

        
![BoardDetView 게시판 상세보기](https://github.com/Yoon1717/TeamEcoala/assets/142978097/3ece9bd3-de52-4ba5-8004-3ffe9c118fb8)


        조회수 증가
        textarea 개행 문자 HTML 줄바꿈 태그로 대체
``` String contentWithBr = board.getBoardContent().replace("\n", "<br>");```
- 좋아요 (등록/취소)
- 글 작성자인 경우 수정/삭제 기능
![BoardWriteView 게시글 작성](https://github.com/Yoon1717/TeamEcoala/assets/142978097/300310d5-622e-403a-8ca4-bb18e16fab21)





# 게시판(관리자)
![mngrBoardView 관리자 게시판리스트](https://github.com/Yoon1717/TeamEcoala/assets/142978097/36152b60-8744-410b-8446-e96599da11fa)
- 데이터베이스 타입 분류로 상단에 고정되는 공지글 작성
