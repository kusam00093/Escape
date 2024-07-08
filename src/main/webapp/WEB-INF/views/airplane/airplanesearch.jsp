<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />

<style>

body {
	font-family: Arial, sans-serif;
}

main {
	margin-top: 20px;
    /* margin: 0; */
    /* padding: 0; */
    /* display: flex; */
    
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    align-items: flex-start; /* 수직 정렬 (위쪽 정렬) */
    width: 80%;
    max-width: 1200px; /* 최대 너비 설정 (필요시 조정) */
    margin: 0 auto; /* 중앙 배치 */
    padding: 20px; /* 내부 여백 (필요시 조정) */
    box-sizing: border-box; /* 패딩과 테두리를 너비에 포함 */
    background-color: #f9f9f9; /* 배경색 (필요시 조정) */
    border: 1px solid #ddd; /* 테두리 (필요시 조정) */
    
}


.go_spanImg {
	border: 1px solid #ccc;
	width: 90px;
	height: 50px;
	margin-bottom:10px;
}
.come_spanImg {
	border: 1px solid #ccc;
	width: 90px;
	height: 50px;
}


/*.flight-logo > img{
	border: 1px solid #ccc;
	width: 90px;
	height: 50px;
}*/

.arrowImg {
	border: none;
	width: 40px;
	height: 20px;
}

.flight-wrapper {
	margin-left: 80px;
	margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    
    width: 750px;
}

.flight-header {
	display: flex;
	align-items: center;
	width: fit-content;
	/* border: 1px solid #ccc; */
	padding: 5px;
	
  	justify-content: space-between;
}

.flight-logo, .time-taken {
	text-align: center;
	margin-right: 20px;
    color: #666;
}

.flight-logo img, .time-taken img {
	display: block;
	margin: 0 auto;
    margin-right: 10px;
}

.flight-logo em, .time-taken em, .locSetting em {
	display: block;
	margin-top: 5px;
}

.flight-details-wrapper {
	flex-grow: 1;
}

.flight-details {
	margin: 10px 0;
}

.flight-details ul {
	list-style-type: none;
	padding: 0;
}

.flight-details li {
	/* border: 1px solid #ccc; */
	padding: 10px;
	margin-bottom: 10px;
}

.flight-details span {
	display: inline-block;
	margin-right: 10px;
}

.flight-details em {
	font-style: normal;
	font-weight: bold;
}

.fontSetting {
	margin-left: 10px;
	font-size: 14px;
    color: #333;
}

.reservationBtn {
	background-color: white;
	border: 1px solid #ccc;
	color: black;
	padding: 15px 32px; /* 여백 설정 */
	text-align: center; /* 텍스트 중앙 정렬 */
	text-decoration: none; /* 밑줄 제거 */
	display: inline-block; /* 버튼을 인라인 블록으로 설정 */
	font-size: 16px; /* 글자 크기 설정 */
	margin: 4px 2px; /* 마진 설정 */
	transition-duration: 0.4s; /* 0.4초 동안의 전환 효과 */
	cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
	border-radius: 12px; /* 둥근 모서리 설정 */
}

.reservationBtn:hover {
	background-color: white; /* 마우스를 올렸을 때 흰색 배경 */
	color: black; /* 마우스를 올렸을 때 검은색 글자 */
	border-width: 4px; /* 마우스 커서가 올라갔을 때 테두리 굵기 */
}

.priceInfo {
	position: absolute; /* fixed를 사용하면 페이지 스크롤 시에도 같은 위치에 고정됨 */
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	border: 1px solid #ccc;
	padding: 20px;
	z-index: 1000; /* 다른 요소들 위에 표시되도록 높은 z-index 설정 */
	display: none; /* 초기에는 숨김 */
	
	width: 400px;
	
}

.priceInfo_wrap {
	position: relative;
}

.priceInfo_wrap_contents_li {
	display: flex;
}

.cardPriceInfo {
	margin-left: 10px;
}

/* 컨테이너 스타일 설정 */
.searchContainer {
  display: flex;
  width: 100%;
}

.locSetting {
  font-weight: bold;
}

/* 사이드바 스타일 설정 */
.sidebar {
  flex: 1;
  background-color: #f8f8f8;
  padding: 20px;
  box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
  
  width: 80px;
  border: 1px solid #ccc;
  
  margin-top: 20px;
}

.filter-group {
    margin-bottom: 20px;
}

.filter-group h2 {
    font-size: 1.2em;
    margin-bottom: 10px;
}

.filter-group ul {
    list-style: none;
    padding: 0;
}

.filter-group li {
    margin-bottom: 10px;
}

.check_wrap {
    display: flex;
    align-items: center;
}

.time-checkbox, .airline-checkbox, .passenger-checkbox {
    margin-right: 10px;
}

.select_all {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.select-button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

.separator {
    margin: 0 10px;
}

.price-slider {
    width: 80%;
}

#price-range-label {
    display: block;
    text-align: right;
    margin-top: 5px;
}

/* styles.css */
.sidebar input[type="checkbox"] {
    width: 20px;
    height: 20px;
    transform: scale(1.5); /* 크기 조절 */
    margin-right: 10px;
    cursor: pointer;
}

/* 선택된 체크박스 스타일 */
.sidebar input[type="checkbox"]:checked {
    background-color: #2196F3;
    border: 2px solid #2196F3;
}

/* 커스텀 체크박스 스타일 */
.sidebar input[type="checkbox"] {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #ccc;
    background-color: #fff;
    cursor: pointer;
}

.sidebar input[type="checkbox"]:checked {
    background-color: #2196F3;
    border-color: #2196F3;
    position: relative;
}

.sidebar input[type="checkbox"]:checked::before {
    content: '';
    position: absolute;
    top: 2px;
    left: 6px;
    width: 6px;
    height: 12px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
}

.label {
    font-size: 14px;
    color: #555;
}

.time-label,
.airline-label,
.passenger-label {
    font-size: 14px;
    color: #555;
}

.content {
    flex: 3;
    padding: 20px;
}


.dropdownImg img {
	width: 20px;
	height: 20px;
}

hr.short {
	width: 80%;
	border-top: 1px solid #000;
	margin-left: 80px;
}

</style>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-latest-version}.js"></script> -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script type="text/javascript">

//예약 버튼 클릭 시 실행될 함수
function confirmPayment(event) {
	
	event.preventDefault(); // 기본 폼 제출 동작 막기
	
    // 결제 확인 메시지 표시
    var isConfirmed = confirm("정말 결제하시겠습니까?");
    
    // 사용자가 확인을 클릭한 경우
    if (isConfirmed) {

        // 필요한 데이터셋 값 가져오기
        const param = '${params}';
        const id = '${id}';
        const depCity1 = '${depCity1}';
        const depCity2 = '${depCity2}';
        const arrCity1 = '${arrCity1}';
        const arrCity2 = '${arrCity2}';
        const depCityCode1 = '${depCityCode1}';
        const depCityCode2 = '${depCityCode2}';
        const arrCityCode1 = '${arrCityCode1}';
        const arrCityCode2 = '${arrCityCode2}';
        const depDate = '${depDate}';
        const arrDate = '${arrDate}';
        const initform = '${initform}';
        const seatClass = '${seatClass}';
        const stype = '${stype}';
        const adultCount = '${adultCount}';
        const childCount = '${childCount}';
        const infantCount = '${infantCount}';
        
        var flightWrapper = event.target.closest('.flight-wrapper');
        var airplaneTimeIdx = flightWrapper.getAttribute('data-airplane-time-idx');
        var bAirplaneTimeIdx = flightWrapper.getAttribute('data-b-airplane-time-idx');
        var name1 = flightWrapper.getAttribute('data-name1');
        var name2 = flightWrapper.getAttribute('data-name2');
        var totalPrice = flightWrapper.querySelector('.price-info strong').innerText.split(' ')[0];
        
        alert(airplaneTimeIdx);
        alert(bAirplaneTimeIdx);
        alert(name1);
        alert(name2);
        alert(totalPrice);
        
     	// 폼 생성
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/Airplane/AirplanePay';
        
        // 동적으로 hidden input 생성 및 폼에 추가
        var params = [
            { name: 'orderId1', value: airplaneTimeIdx },
            { name: 'orderId2', value: bAirplaneTimeIdx },
            { name: 'userId', value: id },
            { name: 'itemName1', value: name1 },
            { name: 'itemName2', value: name2 },
            { name: 'seatClass', value: seatClass },
            { name: 'adultCount', value: adultCount },
            { name: 'childCount', value: childCount },
            { name: 'infantCount', value: infantCount },
            { name: 'totalPrice', value: totalPrice }
        ];

        params.forEach(function(inputData) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = inputData.name;
            input.value = inputData.value;
            form.appendChild(input);
        });

        // 폼을 body에 추가하고 제출
        document.body.appendChild(form);
        form.submit();
    }
}

// 예약 버튼에 이벤트 리스너 추가
document.querySelectorAll('.reservationBtn').forEach(function(button) {
    button.addEventListener('click', confirmPayment);
});
        
</script>

</head>

<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>

<body>

	<main id="main_container">
	
	  <div class="searchContainer">
	    <div class="sidebar">
	    
	        <div class="filter-group">
	            <div id="departure-time">
	                <h2>가는날</h2>
	                <ul>
	                    <li data-time="06">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_01" name="departureTimes" value="06" class="time-checkbox" checked="checked">
	                            <label for="ckDep_01"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
	                        </div>
	                    </li>
	                    <li data-time="12">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_02" name="departureTimes" value="12" class="time-checkbox" checked="checked">
	                            <label for="ckDep_02"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
	                        </div>
	                    </li>
	                    <li data-time="18">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_03" name="departureTimes" value="18" class="time-checkbox" checked="checked">
	                            <label for="ckDep_03"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
	                        </div>
	                    </li>
	                    <li data-time="24">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_04" name="departureTimes" value="24" class="time-checkbox" checked="checked">
	                            <label for="ckDep_04"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
	                        </div>
	                    </li>
	                </ul>
	                <h2>오는날</h2>
	                <ul>
	                    <li data-time="06">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_05" name="returnTimes" value="06" class="time-checkbox" checked="checked">
	                            <label for="ckDep_05"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
	                        </div>
	                    </li>
	                    <li data-time="12">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_06" name="returnTimes" value="12" class="time-checkbox" checked="checked">
	                            <label for="ckDep_06"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
	                        </div>
	                    </li>
	                    <li data-time="18">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_07" name="returnTimes" value="18" class="time-checkbox" checked="checked">
	                            <label for="ckDep_07"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
	                        </div>
	                    </li>
	                    <li data-time="24">
	                        <div class="filter-section">
	                            <input type="checkbox" id="ckDep_08" name="returnTimes" value="24" class="time-checkbox" checked="checked">
	                            <label for="ckDep_08"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>

			<hr />
	
	        <div class="filter-group">
	            <h2><a href="#" onclick="">항공사</a></h2>
	            <div>
	                <ul class="select_all">
	                    <li>
	                        <button type="button" id="airAllCheck" title="모두선택" class="select-button">모두 선택</button>
	                    </li>
	                    <li class="separator">|</li>
	                    <li>
	                        <button type="button" id="airNoneCheck" title="모두해제" class="select-button">모두 해제</button>
	                    </li>
	                </ul>
	                <ul role="airlineChkBox">
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" name="airlineName" id="airline_ck01" checked="checked">
	                            <label for="airline_ck01"><span class="airline-label"></span>대한항공</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" name="airlineName" id="airline_ck02" checked="checked">
	                            <label for="airline_ck02"><span class="airline-label"></span>아시아나항공</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" name="airlineName" id="airline_ck03" checked="checked">
	                            <label for="airline_ck03"><span class="airline-label"></span>에어부산</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" name="airlineName" id="airline_ck04" checked="checked">
	                            <label for="airline_ck04"><span class="airline-label"></span>제주항공</label>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	        
	        <hr />
	
	        <div class="filter-group">
		        <h2><a href="#" class="" onclick="">가격대</a></h2>
		        <div>
		            <ul>
		                <li id="price-range-text">1,500,000원 미만</li>
		                <li>
		                    <div>
		                        <input type="range" id="price-range" name="price-range" min="0" max="3000000" value="1500000" class="price-slider" step="100000">
		                        <input type="hidden" id="price-range-hidden" name="price-range-hidden" value="1500000">
		                    </div>
		                </li>
		            </ul>
		        </div>
		    </div>
		
		    <button type="submit" id="search-button">조건검색</button>

	    </div>
		
	  <!-- side bar End -->
	  
	  <div class="content"></div>
	  
	</main>
	

	<%@include file="/WEB-INF/include/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 사이드바 항공사체크 js -->
<script>
	document.getElementById('airAllCheck').addEventListener('click', function() {
	    let checkboxes = document.querySelectorAll('.airline-checkbox');
	    checkboxes.forEach((checkbox) => {
	        checkbox.checked = true;
	    });
	});
	
	document.getElementById('airNoneCheck').addEventListener('click', function() {
	    let checkboxes = document.querySelectorAll('.airline-checkbox');
	    checkboxes.forEach((checkbox) => {
	        checkbox.checked = false;
	    });
	});
</script>

<!-- 가격 슬라이드 js -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
	const priceRange = document.getElementById('price-range');
	const priceRangeText = document.getElementById('price-range-text');

	function updatePriceRange() {
	const value = priceRange.value;
	const price = value; // 슬라이더 값에 따라 가격 계산
	const formattedPrice = price.toLocaleString() + '원 이하';

	// 텍스트 업데이트
	priceRangeText.textContent = formattedPrice;
	}

	// 초기 값 설정
	updatePriceRange();

	// 슬라이더 값 변경 시 업데이트
	priceRange.addEventListener('input', updatePriceRange);
});
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {

        const params = '${params}';
        console.log('params:', params);

        const id = '${id}';
        const depCity1 = '${depCity1}';
        const depCity2 = '${depCity2}';
        const arrCity1 = '${arrCity1}';
        const arrCity2 = '${arrCity2}';
        const depCityCode1 = '${depCityCode1}';
        const depCityCode2 = '${depCityCode2}';
        const arrCityCode1 = '${arrCityCode1}';
        const arrCityCode2 = '${arrCityCode2}';
        const depDate = '${depDate}';
        const arrDate = '${arrDate}';
        const initform = '${initform}';
        const seatClass = '${seatClass}';
        const stype = '${stype}';
        const adultCount = '${adultCount}';
        const childCount = '${childCount}';
        const infantCount = '${infantCount}';
        
     	// 사이드바-시간대-가는날
        function getCheckedTimeRanges1() {
            const checkboxes = document.querySelectorAll('[id^="ckDep_"][name="departureTimes"]');
            let timeRanges1 = [];
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    let timeRange1 = null;
                    switch (checkbox.id) {
                        case 'ckDep_01':
                            timeRange1 = {
                                startTime1: '00:00',
                                startTime2: '06:00'
                            };
                            break;
                        case 'ckDep_02':
                            timeRange1 = {
                                startTime1: '06:00',
                                startTime2: '12:00'
                            };
                            break;
                        case 'ckDep_03':
                            timeRange1 = {
                                startTime1: '12:00',
                                startTime2: '18:00'
                            };
                            break;
                        case 'ckDep_04':
                            timeRange1 = {
                                startTime1: '18:00',
                                startTime2: '24:00'
                            };
                            break;
                    }
                    timeRanges1.push(timeRange1);
                }
            });
            console.log('Filter/timeRanges1: ', timeRanges1);
            return timeRanges1;
        }
     	
     	// 사이드바-시간대-오는날
        function getCheckedTimeRanges2() {
            const checkboxes = document.querySelectorAll('[id^="ckDep_"][name="returnTimes"]');
            let timeRanges2 = [];
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    let timeRange2 = null;
                    switch (checkbox.id) {
                        case 'ckDep_05':
                            timeRange2 = {
                                startTime1: '00:00',
                                startTime2: '06:00'
                            };
                            break;
                        case 'ckDep_06':
                            timeRange2 = {
                                startTime1: '06:00',
                                startTime2: '12:00'
                            };
                            break;
                        case 'ckDep_07':
                            timeRange2 = {
                                startTime1: '12:00',
                                startTime2: '18:00'
                            };
                            break;
                        case 'ckDep_08':
                            timeRange2 = {
                                startTime1: '18:00',
                                startTime2: '24:00'
                            };
                            break;
                    }
                    timeRanges2.push(timeRange2);
                }
            });
            console.log('Filter/timeRanges2: ', timeRanges2);
            return timeRanges2;
        }

        // div="content" 업데이트 부분
        function updateFlightInfo(data) {
            const flightInfo = data.flightInfo;
            const params = data.params;
            const contentDiv = document.querySelector('.content');
            contentDiv.innerHTML = '';

            if (params.initform == 'RT') {
                const goingDayWrapper = document.createElement('div');
                goingDayWrapper.className = 'flight-day-wrapper';
                goingDayWrapper.innerHTML = '<h2>가는 날</h2>';
                flightInfo.forEach(flight => {
                    const flightWrapper = document.createElement('div');
                    flightWrapper.className = 'flight-wrapper';
                    flightWrapper.setAttribute('data-time', flight.startTime1);
                    flightWrapper.setAttribute('data-day', '가는날');
                    flightWrapper.setAttribute('data-airplane-time-idx', flight.airplane_time_idx);
                    flightWrapper.setAttribute('data-b-airplane-time-idx', flight.b_airplane_time_idx);
                    flightWrapper.setAttribute('data-name1', flight.name1);
                    flightWrapper.setAttribute('data-name2', flight.name2);

                    flightWrapper.innerHTML = `
	                        <div class="flight-header">
	                            <span class="flight-logo">
	                                <img src="\${flight.logo1}" class="go_spanImg" alt="logo">
	                                <em>\${flight.name1}</em>
	                                <img src="\${flight.logo2}" class="come_spanImg" alt="logo">
	                                <em>\${flight.name2}</em>
	                            </span>
	                            <div class="flight-details-wrapper">
	                                <div class="flight-details">
	                                    <ul>
	                                    
	                                        <li>
	                                            <div>
	                                                <span class="fontSetting">
	                                                    <span class="locSetting">\${flight.startTime1}
	                                                        <em>\${flight.depCityCode1}
	                                                            <span>\${flight.depCity1}</span>
	                                                        </em>
	                                                    </span>
	                                                </span>
	                                                <span class="time-taken">
	                                                    <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                                                    <em>\${flight.durationhour}시간 \${flight.durationminute}분</em>
	                                                </span>
	                                                <span class="fontSetting">
	                                                    <span class="locSetting">\${flight.endTime1}
	                                                        <em>\${flight.arrCityCode1}
	                                                            <span>\${flight.arrCity1}</span>
	                                                        </em>
	                                                    </span>
	                                                </span>
	                                                <br>
	                                            </div>
	                                        </li>
	                                        
	                                        <li>
	                                            <div>
	                                                <span class="fontSetting">
	                                                    <span class="locSetting">\${flight.startTime2}
	                                                        <em>\${flight.depCityCode2}
	                                                            <span>\${flight.depCity2}</span>
	                                                        </em>
	                                                    </span>
	                                                </span>
	                                                <span class="time-taken">
	                                                    <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                                                    <em>\${flight.durationhour}시간 \${flight.durationminute}분</em>
	                                                </span>
	                                                <span class="fontSetting">
	                                                    <span class="locSetting">\${flight.endTime2}
	                                                        <em>\${flight.arrCityCode2}
	                                                            <span>\${flight.arrCity2}</span>
	                                                        </em>
	                                                    </span>
	                                                </span>
	                                                <br>
	                                            </div>
	                                        </li>
	                                        
	                                    </ul>
	                                </div>
	                            </div>
	                            <form class="paymentForm" action="/Airplane/AirplanePay" method="POST">
	                                <span class="price-info">
	                                    <button type="submit" class="reservationBtn" onclick="confirmPayment(event)">예약</button>
	                                    <div>
	                                        <strong>\${flight.totalPrice} KRW</strong>
	                                    </div>
	                                </span>
	                            </form>
	                        </div>
	                    `;
                    goingDayWrapper.appendChild(flightWrapper);
                    goingDayWrapper.appendChild(document.createElement('hr')).className = 'short';
                });
                contentDiv.appendChild(goingDayWrapper);

            } else {

                if (params.initform == 'OW') {
                    const comingDayWrapper = document.createElement('div');
                    comingDayWrapper.className = 'flight-day-wrapper';
                    comingDayWrapper.innerHTML = '<h2>가는 날</h2>';
                    flightInfo.forEach(flight => {
                        const flightWrapper = document.createElement('div');
                        flightWrapper.className = 'flight-wrapper';
                        flightWrapper.setAttribute('data-time', flight.startTime1);
                        flightWrapper.setAttribute('data-day', '가는날');
                        flightWrapper.setAttribute('data-airplane-time-idx', flight.airplane_time_idx);
                        flightWrapper.setAttribute('data-name1', flight.name1);

                        flightWrapper.innerHTML = `
	                            <div class="flight-header">
	                                <span class="flight-logo">
	                                    <img src="\${flight.logo1}" class="go_spanImg" alt="logo">
	                                    <em>\${flight.name1}</em>
	                                </span>
	                                <div class="flight-details-wrapper">
	                                    <div class="flight-details">
	                                        <ul>
	                                            <li>
	                                                <div>
	                                                    <span class="fontSetting">
	                                                        <span class="locSetting">\${flight.startTime1}
	                                                            <em>\${flight.depCityCode1}
	                                                                <span>\${flight.depCity1}</span>
	                                                            </em>
	                                                        </span>
	                                                    </span>
	                                                    <span class="time-taken">
	                                                        <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                                                        <em>\${flight.durationhour}시간 \${flight.durationminute}분</em>
	                                                    </span>
	                                                    <span class="fontSetting">
	                                                        <span class="locSetting">\${flight.endTime1}
	                                                            <em>\${flight.arrCityCode1}
	                                                                <span>\${flight.arrCity1}</span>
	                                                            </em>
	                                                        </span>
	                                                    </span>
	                                                    <br>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <form class="paymentForm" action="/Airplane/AirplanePay" method="POST">
	                                    <span class="price-info">
	                                        <button type="submit" class="reservationBtn" onclick="confirmPayment(event)">예약</button>
	                                        <div>
	                                            <strong>\${flight.totalPrice} KRW</strong>
	                                        </div>
	                                    </span>
	                                </form>
	                            </div>
	                        `;
                        comingDayWrapper.appendChild(flightWrapper);
                        comingDayWrapper.appendChild(document.createElement('hr')).className = 'short';
                    });
                    contentDiv.appendChild(comingDayWrapper);
                } else {
                    const noResultDiv = document.createElement('div');
                    noResultDiv.innerHTML = '<p>검색 결과가 없습니다.</p>';
                    contentDiv.appendChild(noResultDiv);
                }
            }
        }

        // 화면 업로드 시 content 데이터 불러오기 - /Airline/Search
        $.ajax({
            type: 'POST',
            url: '/Airline/Search',
            data: {
                id: id,
                depCity1: depCity1,
                arrCity1: arrCity1,
                depCity2: depCity2,
                arrCity2: arrCity2,
                depCityCode1: depCityCode1,
                depCityCode2: depCityCode2,
                arrCityCode1: arrCityCode1,
                arrCityCode2: arrCityCode2,
                depDate: depDate,
                arrDate: arrDate,
                initform: initform,
                seatClass: seatClass,
                stype: stype,
                adultCount: adultCount,
                childCount: childCount,
                infantCount: infantCount,
                timeRanges1: getCheckedTimeRanges1(),
                timeRanges2: getCheckedTimeRanges2()
            },
            success: function(data) {
                console.log('AJAX_Search_data:', data);
                updateFlightInfo(data);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
        
     	// 사이드바 필터링
        function handleCheckboxClick(event) {
            // Apply filters whenever a checkbox is clicked
            applyFilters();
        }

        // 사이드바 필터링 AJAX 요청 - /Airline/Filter
        function applyFilters() {
        	
            const filters = {
            	checkboxId: getCheckedIds(),
                isChecked: getCheckedStatus(),
                checkboxValue: getCheckedValues(),
                timeRanges1: JSON.stringify(getCheckedTimeRanges1()),
                timeRanges2: JSON.stringify(getCheckedTimeRanges2()),
                airlineId: getCheckedAirlineIds(),
                airlineNames: getCheckedAirlineNames(),
                priceRange: document.getElementById('price-range-hidden').value,
                id: '${id}',
                depCity1: '${depCity1}',
                depCity2: '${depCity2}',
                arrCity1: '${arrCity1}',
                arrCity2: '${arrCity2}',
                depCityCode1: '${depCityCode1}',
                depCityCode2: '${depCityCode2}',
                arrCityCode1: '${arrCityCode1}',
                arrCityCode2: '${arrCityCode2}',
                depDate: '${depDate}',
                arrDate: '${arrDate}',
                initform: '${initform}',
                seatClass: '${seatClass}',
                stype: '${stype}',
                adultCount: '${adultCount}',
                childCount: '${childCount}',
                infantCount: '${infantCount}'
            };
       
            $.ajax({
                type: 'POST',
                url: '/Airline/Filter',
                data: filters,
                success: function(data) {
                	alert('성공');
                    console.log('AJAX_Filter_data:', data);
                    updateFlightInfo(data);
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }
        
     	// Add event listeners to checkboxes
        const checkboxes = document.querySelectorAll('[id^="ckDep_"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', handleCheckboxClick);
        });
        
     	// Helper function to get all checked checkboxes' IDs
        function getCheckedIds() {
            const checkboxes = document.querySelectorAll('.filter-section input[type="checkbox"]:checked');
            console.log('AJAX_Filter_checkboxes: ', checkboxes);
            return Array.from(checkboxes).map(cb => cb.id);
        }

        // Helper function to get checked status of checkboxes
        function getCheckedStatus() {
            const checkboxes = document.querySelectorAll('.filter-section input[type="checkbox"]');
            return Array.from(checkboxes).reduce((acc, cb) => {
                acc[cb.id] = cb.checked;
                return acc;
            }, {});
        }
        
     	// Helper function to get the checkbox values based on IDs
        function getCheckedValues() {
            const checkedIds = getCheckedIds();
            const checkboxValues = [];
            checkedIds.forEach(id => {
                switch (id) {
                    case 'ckDep_01':
                    case 'ckDep_05':
                        checkboxValues.push(6);
                        break;
                    case 'ckDep_02':
                    case 'ckDep_06':
                        checkboxValues.push(12);
                        break;
                    case 'ckDep_03':
                    case 'ckDep_07':
                        checkboxValues.push(18);
                        break;
                    case 'ckDep_04':
                    case 'ckDep_08':
                        checkboxValues.push(24);
                        break;
                    default:
                        break;
                }
            });
            return checkboxValues;
        }
     	
     	//------------------ 사이드바 시간대 End ---------------------
     	
     	// Add event listeners to checkboxes
        const acheckboxes = document.querySelectorAll('[id^="airline_ck"]');
     	console.log('AJAX_Filter_acheckboxes: ', acheckboxes);
        acheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', handleCheckboxClick);
        });
        
     	// 사이드바-항공사 ID
     	function getCheckedAirlineIds() {
     		const airlineIdEls = document.querySelectorAll('.check_wrap input[type="checkbox"]:checked');
     		console.log('AJAX_Filter_getCheckedAirlineIds: ', airlineIdEls);
     		return Array.from(airlineIdEls).map(ac => ac.id);
     	}
     	
     	// 사이드바-항공사 이름
     	function getCheckedAirlineNames() {
    		const acheckboxes = document.querySelectorAll('[id^="airline_ck"][name="airlineName"]');
    		console.log('AJAX_Filter_getCheckedAirlineNames: ', acheckboxes);
    		
		    let airlineNames = [];
		    acheckboxes.forEach(checkbox => {
		        if (checkbox.checked) {
		            let airlineName = null;
		            switch (checkbox.id) {
		                case 'airline_ck01':
		                    airlineName = '대한항공';
		                    break;
		                case 'airline_ck02':
		                    airlineName = '아시아나항공';
		                    break;
		                case 'airline_ck03':
		                    airlineName = '에어부산';
		                    break;
		                case 'airline_ck04':
		                    airlineName = '제주항공';
		                    break;
		            }
		            airlineNames.push(airlineName);
		        }
		    });
		    console.log('Filter/airlineNames: ', airlineNames);
		    return airlineNames;
		}
     	
     	//------------------ 사이드바 항공사이름 End ---------------------
     	
     	// 가격 범위 슬라이더 값 업데이트
        document.getElementById('price-range').addEventListener('input', function() {
            const priceText = this.value.toLocaleString() + '원 미만';
            document.getElementById('price-range-text').innerText = priceText;
            document.getElementById('price-range-hidden').value = this.value;
        });

        // 조건 검색 버튼 클릭 시 필터 적용
        document.getElementById('search-button').addEventListener('click', function() {
            applyFilters();
        });
        
    });
</script>


</body>
</html>