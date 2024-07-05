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

.spanImg {
	border: 1px solid #ccc;
	width: 90px;
	height: 70px;
}

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

#departure-time,
#arrival-time {
    display: none;
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

function confirmPayment(event) {
    // 결제 확인 메시지 표시
    var isConfirmed = confirm("정말 결제하시겠습니까?");
    
    // 사용자가 확인을 클릭한 경우
    if (isConfirmed) {
        // 폼 제출
        document.querySelector('.paymentForm').submit();
    } else {
        // 기본 폼 제출 동작 막기
        event.preventDefault();
    }
}
        
</script>

</head>

<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>

<body>

	<main id="main_container">
	
	  <div class="searchContainer">
	    <div class="sidebar">
	    
	        <div class="filter-group">
			    <h2><a href="#">출발시간</a></h2>
			    <span class="dropdownImg"><img src="/images/dropdown.png" onclick="toggleVisibility('departure-time')" alt="드롭다운"></span>
			    <div id="departure-time">
			        <h2>가는날</h2>
			        <ul>
			            <li data-time="06">
			                <div>
			                    <input type="checkbox" id="ckDep_01" name="departureTimes" value="06" class="time-checkbox" checked="checked">
			                    <label for="ckDep_01"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
			                </div>
			            </li>
			            <li data-time="12">
			                <div>
			                    <input type="checkbox" id="ckDep_02" name="departureTimes" value="12" class="time-checkbox" checked="checked">
			                    <label for="ckDep_02"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
			                </div>
			            </li>
			            <li data-time="18">
			                <div>
			                    <input type="checkbox" id="ckDep_03" name="departureTimes" value="18" class="time-checkbox" checked="checked">
			                    <label for="ckDep_03"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
			                </div>
			            </li>
			            <li data-time="24">
			                <div>
			                    <input type="checkbox" id="ckDep_04" name="departureTimes" value="24" class="time-checkbox" checked="checked">
			                    <label for="ckDep_04"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
			                </div>
			            </li>
			        </ul>
			        <h2>오는날</h2>
			        <ul>
			            <li data-time="06">
			                <div>
			                    <input type="checkbox" id="ckDep_05" name="returnTimes" value="06" class="time-checkbox" checked="checked">
			                    <label for="ckDep_05"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
			                </div>
			            </li>
			            <li data-time="12">
			                <div>
			                    <input type="checkbox" id="ckDep_06" name="returnTimes" value="12" class="time-checkbox" checked="checked">
			                    <label for="ckDep_06"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
			                </div>
			            </li>
			            <li data-time="18">
			                <div>
			                    <input type="checkbox" id="ckDep_07" name="returnTimes" value="18" class="time-checkbox" checked="checked">
			                    <label for="ckDep_07"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
			                </div>
			            </li>
			            <li data-time="24">
			                <div>
			                    <input type="checkbox" id="ckDep_08" name="returnTimes" value="24" class="time-checkbox" checked="checked">
			                    <label for="ckDep_08"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
			                </div>
			            </li>
			        </ul>
			    </div>
			</div>
			
			<hr />
			
			<div class="filter-group">
			    <h2><a href="#">도착시간</a></h2>
			    <span class="dropdownImg"><img src="/images/dropdown.png" onclick="toggleVisibility('arrival-time')" alt="드롭다운"></span>
			    <div id="arrival-time">
			        <h2>가는날</h2>
			        <ul>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_09" name="departureTimes" value="06" class="time-checkbox" checked="checked">
			                    <label for="ckDep_09"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
			                </div>
			            </li>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_10" name="departureTimes" value="12" class="time-checkbox" checked="checked">
			                    <label for="ckDep_10"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
			                </div>
			            </li>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_11" name="departureTimes" value="18" class="time-checkbox" checked="checked">
			                    <label for="ckDep_11"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
			                </div>
			            </li>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_12" name="departureTimes" value="24" class="time-checkbox" checked="checked">
			                    <label for="ckDep_12"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
			                </div>
			            </li>
			        </ul>
			        <h2>오는날</h2>
			        <ul>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_13" name="returnTimes" value="06" class="time-checkbox" checked="checked">
			                    <label for="ckDep_13"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
			                </div>
			            </li>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_14" name="returnTimes" value="12" class="time-checkbox" checked="checked">
			                    <label for="ckDep_14"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
			                </div>
			            </li>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_15" name="returnTimes" value="18" class="time-checkbox" checked="checked">
			                    <label for="ckDep_15"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
			                </div>
			            </li>
			            <li>
			                <div>
			                    <input type="checkbox" id="ckDep_16" name="returnTimes" value="24" class="time-checkbox" checked="checked">
			                    <label for="ckDep_16"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
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
	                            <input type="checkbox" class="airline-checkbox" id="airline_ck01" checked="checked">
	                            <label for="airline_ck01"><span class="airline-label"></span>대한항공</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" id="airline_ck02" checked="checked">
	                            <label for="airline_ck02"><span class="airline-label"></span>아시아나항공</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" id="airline_ck03" checked="checked">
	                            <label for="airline_ck03"><span class="airline-label"></span>에어부산</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="check_wrap">
	                            <input type="checkbox" class="airline-checkbox" id="airline_ck04" checked="checked">
	                            <label for="airline_ck04"><span class="airline-label"></span>제주항공</label>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	        
	        <hr />
	
	        <div class="filter-group">
	            <h2>탑승객조건</h2>
	            <div>
	                <ul>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="passger_1" class="passenger-checkbox" checked="checked" value="성인">
	                            <label for="passger_1"><span class="passenger-label"></span>성인</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="passger_2" class="passenger-checkbox" checked="checked" value="소아">
	                            <label for="passger_2"><span class="passenger-label"></span>소아</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="passger_3" class="passenger-checkbox" checked="checked" value="유아">
	                            <label for="passger_3"><span class="passenger-label"></span>유아</label>
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
		                        <input type="range" id="price-range" name="price-range" min="0" max="300" value="150" class="price-slider">
		                        <input type="hidden" id="price-range-hidden" name="price-range-hidden">
		                    </div>
		                </li>
		            </ul>
		        </div>
		    </div>
		    
		    <button type="submit" id="searchBtn">조건검색</button>

	    </div>
		
	  <!-- ------------------------------------------------------------------------------------------------------------------- -->
	  
	  <div class="content">
	    <c:choose>
	        <c:when test="${not empty flightInfo}">
	            <!-- 가는 날 항공편 리스트 -->
	            <div class="flight-day-wrapper">
	                <h2>가는 날</h2>
	                <c:forEach items="${flightInfo}" var="flight" varStatus="status">
	                    <div class="flight-wrapper" data-time="${flight.startTime1}" data-day="가는날">
	                        <div class="flight-header">
	                            <span class="flight-logo">
	                                <img src="${flight.logo}" class="spanImg" alt="logo">
	                                <em>${flight.name}</em>
	                            </span>
	                            <div class="flight-details-wrapper">
	                                <div class="flight-details">
	                                    <ul>
	                                        <li>
	                                            <div>
	                                                <span class="fontSetting">
	                                                    <span class="locSetting">${flight.startTime1}
	                                                        <em>${flight.depCityCode1}
	                                                            <span>${flight.depCity1}</span>
	                                                        </em>
	                                                    </span>
	                                                </span>
	
	                                                <span class="time-taken">
	                                                    <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                                                    <em>${ flight.durationhour }시간 ${ flight.durationminute }분</em>
	                                                </span>
	                                                <span class="fontSetting">
	                                                    <span class="locSetting">${flight.endTime1}
	                                                        <em>${flight.arrCityCode1}
	                                                            <span>${flight.arrCity1}</span>
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
	                                <input type="hidden" name="orderId" value="${ flight.airplane_time_idx }">
	                                <input type="hidden" name="userId" value="${ sessionScope.login.id }">
	                                <input type="hidden" name="itemName" value="${ flight.name }">
	                                <input type="hidden" name="seatClass" value="${ flight.seatClass }">
	                                <input type="hidden" name="adultCount" value="${ flight.adultCount }">
	                                <input type="hidden" name="childCount" value="${ flight.childCount }">
	                                <input type="hidden" name="infantCount" value="${ flight.infantCount }">
	                                <input type="hidden" name="startdate" value="${ flight.startTime1 }">
	                                <input type="hidden" name="departureloc" value="${ flight.departure_loc }">
	                                <input type="hidden" name="arrivalloc" value="${ flight.arrival_loc }">
	                                <input type="hidden" name="stypeidx" value="${ flight.stype_idx }">
	                                <span class="price-info">
	                                    <button type="submit" class="reservationBtn" 
		                                    data-airplane-time-idx="${ flight.airplane_time_idx }" 
		                                    data-user-id="${ sessionscope.login.id }" 
		                                    data-airplane-name="${ flight.name }" 
		                                    data-seatclass="${ flight.seatClass }" 
		                                    data-adultcount="${ flight.adultCount }" 
		                                    data-childcount="${ flight.childCount }" 
		                                    data-infantcount="${ flight.infantCount }" 
		                                    data-gostarttime="${ flight.startTime1 }" 
		                                    data-goendtime="${ flight.endTime1 }" 
		                                    data-comestarttime="${ flight.startTime2 }" 
		                                    data-comeendtime="${ flight.endTime2 }" 
		                                    data-departureloc="${ flight.departure_loc }" 
		                                    data-arrivalloc="${ flight.arrival_loc }" 
		                                    data-godepCity="${ flight.depCity1 }" 
		                                    data-goarrCity="${ flight.arrCity1 }" 
		                                    data-comedepCity="${ flight.depCity2 }" 
		                                    data-comearrCity="${ flight.arrCity2 }" 
		                                    data-stypeidx="${ flight.stype_idx }" 
		                                    data-ptypeList="${ params.ptypeList }" 
		                                    data-flights="[[ ${ flight.startTime1 } ],[ ${ flight.endTime1 } ]]" 
		                                    onclick="confirmPayment(event)">
	                                    예약</button><div>
	                                        <strong>${flight.totalPrice} KRW</strong>
	                                    </div>
	                                </span>
	                            </form>
	                        </div>
	                    </div>
	                    <hr class="short" />
	                </c:forEach>
	            </div>
	
	            <!-- 오는 날 항공편 리스트 -->
	            <c:if test="${params.initform != 'OW'}">
	                <div class="flight-day-wrapper">
	                    <h2>오는 날</h2>
	                    <c:forEach items="${flightInfo}" var="flight" varStatus="status">
	                        <div class="flight-wrapper" data-time="${flight.startTime2}" data-day="오는날">
	                            <div class="flight-header">
	                                <span class="flight-logo">
	                                    <img src="${flight.logo}" class="spanImg" alt="logo">
	                                    <em>${flight.name}</em>
	                                </span>
	                                <div class="flight-details-wrapper">
	                                    <div class="flight-details">
	                                        <ul>
	                                            <li>
	                                                <div>
	                                                    <span class="fontSetting">
	                                                        <span class="locSetting">${flight.startTime2}
	                                                            <em>${flight.depCityCode2}
	                                                                <span>${flight.depCity2}</span>
	                                                            </em>
	                                                        </span>
	                                                    </span>
	
	                                                    <span class="time-taken">
	                                                        <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                                                        <em>${ flight.durationhour }시간 ${ flight.durationminute }분</em>
	                                                    </span>
	                                                    <span class="fontSetting">
	                                                        <span class="locSetting">${flight.endTime2}
	                                                            <em>${flight.arrCityCode2}
	                                                                <span>${flight.arrCity2}</span>
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
	                                    <input type="hidden" name="orderId" value="${ flight.airplane_time_idx }">
	                                    <input type="hidden" name="userId" value="${ sessionScope.login.id }">
	                                    <input type="hidden" name="itemName" value="${ flight.name }">
	                                    <input type="hidden" name="seatClass" value="${ flight.seatClass }">
	                                    <input type="hidden" name="adultCount" value="${ flight.adultCount }">
	                                    <input type="hidden" name="childCount" value="${ flight.childCount }">
	                                    <input type="hidden" name="infantCount" value="${ flight.infantCount }">
	                                    <input type="hidden" name="startdate" value="${ flight.startTime2 }">
	                                    <input type="hidden" name="departureloc" value="${ flight.departure_loc }">
	                                    <input type="hidden" name="arrivalloc" value="${ flight.arrival_loc }">
	                                    <input type="hidden" name="stypeidx" value="${ flight.stype_idx }">
	                                    <span class="price-info">
	                                        <button type="submit" class="reservationBtn" 
		                                    data-airplane-time-idx="${ flight.airplane_time_idx }" 
		                                    data-user-id="${ sessionscope.login.id }" 
		                                    data-airplane-name="${ flight.name }" 
		                                    data-seatclass="${ flight.seatClass }" 
		                                    data-adultcount="${ flight.adultCount }" 
		                                    data-childcount="${ flight.childCount }" 
		                                    data-infantcount="${ flight.infantCount }" 
		                                    data-gostarttime="${ flight.startTime1 }" 
		                                    data-goendtime="${ flight.endTime1 }" 
		                                    data-comestarttime="${ flight.startTime2 }" 
		                                    data-comeendtime="${ flight.endTime2 }" 
		                                    data-departureloc="${ flight.departure_loc }" 
		                                    data-arrivalloc="${ flight.arrival_loc }" 
		                                    data-godepCity="${ flight.depCity1 }" 
		                                    data-goarrCity="${ flight.arrCity1 }" 
		                                    data-comedepCity="${ flight.depCity2 }" 
		                                    data-comearrCity="${ flight.arrCity2 }" 
		                                    data-stypeidx="${ flight.stype_idx }" 
		                                    data-ptypeList="${ params.ptypeList }" 
		                                    data-flights="[[ ${ flight.startTime1 } ],[ ${ flight.endTime1 } ]]" 
		                                    onclick="confirmPayment(event)">
	                                    예약</button><div>
	                                    	<strong>${flight.totalPrice} KRW</strong>
	                                        </div>
	                                    </span>
	                                </form>
	                            </div>
	                        </div>
	                        <hr class="short" />
	                    </c:forEach>
	                </div>
	            </c:if>
	
	        </c:when>
	        <c:otherwise>
	            <div>
	                <p>검색 결과가 없습니다.</p>
	            </div>
	        </c:otherwise>
	    </c:choose>
	</div>


	  
	</main>
	

	<%@include file="/WEB-INF/include/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 사이드바 토글 js -->
<script>
function toggleVisibility(elementId) {
    var element = document.getElementById(elementId);
    if (element.style.display === "none" || element.style.display === "") {
        element.style.display = "block";
    } else {
        element.style.display = "none";
    }
}
</script>

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
	const price = value * 10000; // 슬라이더 값에 따라 가격 계산
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

<!-- 필터링 js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {

    const params = '${ params }';
    console.log('params:', params);

    const id = '${ id }';
    const depCity1 = '${ depCity1 }';
    const depCity2 = '${ depCity2 }';
    const arrCity1 = '${ arrCity1 }';
    const arrCity2 = '${ arrCity2 }';
    const depCityCode1 = '${ depCityCode1 }';
    const depCityCode2 = '${ depCityCode2 }';
    const arrCityCode1 = '${ arrCityCode1 }';
    const arrCityCode2 = '${ arrCityCode2 }';
    const depDate = '${ depDate }';
    const arrDate = '${ arrDate }';
    const initform = '${ initform }';
    const seatClass = '${ seatClass }';
    const stype = '${ stype }';
    const adultCount = '${ adultCount }';
    const childCount = '${ childCount }';
    const infantCount = '${ infantCount }';

    // Function to get checked time ranges
    function getCheckedTimeRanges() {
        const checkboxes = document.querySelectorAll('[id^="ckDep_"]');
        let timeRanges = [];
        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                timeRanges.push(checkbox.value);
            }
        });
        return timeRanges;
    }

    // Function to update flight information on the page
    function updateFlightInfo(data) {
	    const flightInfo = data.flightInfo;
	    const params = data.params;
	    const contentDiv = document.querySelector('.content');
	    contentDiv.innerHTML = '';
	
	    if (flightInfo && flightInfo.length > 0) {
	        const goingDayWrapper = document.createElement('div');
	        goingDayWrapper.className = 'flight-day-wrapper';
	        goingDayWrapper.innerHTML = '<h2>가는 날</h2>';
	        flightInfo.forEach(flight => {
	            const flightWrapper = document.createElement('div');
	            flightWrapper.className = 'flight-wrapper';
	            flightWrapper.setAttribute('data-time', flight.startTime1);
	            flightWrapper.setAttribute('data-day', '가는날');
	
	            flightWrapper.innerHTML = `
	                        <div class="flight-header">
	                            <span class="flight-logo">
	                                <img src="\${flight.logo}" class="spanImg" alt="logo">
	                                <em>\${flight.name}</em>
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
	                                                    <em>\${flight.durationhour}시간 ${flight.durationminute}분</em>
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
	            goingDayWrapper.appendChild(flightWrapper);
	            goingDayWrapper.appendChild(document.createElement('hr')).className = 'short';
	        });
	        contentDiv.appendChild(goingDayWrapper);
	
	        if (params.initform !== 'OW') {
	            const comingDayWrapper = document.createElement('div');
	            comingDayWrapper.className = 'flight-day-wrapper';
	            comingDayWrapper.innerHTML = '<h2>오는 날</h2>';
	            flightInfo.forEach(flight => {
	                const flightWrapper = document.createElement('div');
	                flightWrapper.className = 'flight-wrapper';
	                flightWrapper.setAttribute('data-time', flight.startTime2);
	                flightWrapper.setAttribute('data-day', '오는날');
	
	                flightWrapper.innerHTML = `
	                            <div class="flight-header">
	                                <span class="flight-logo">
	                                    <img src="\${flight.logo}" class="spanImg" alt="logo">
	                                    <em>\${flight.name}</em>
	                                </span>
	                                <div class="flight-details-wrapper">
	                                    <div class="flight-details">
	                                        <ul>
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
	                comingDayWrapper.appendChild(flightWrapper);
	                comingDayWrapper.appendChild(document.createElement('hr')).className = 'short';
	            });
	            contentDiv.appendChild(comingDayWrapper);
	        }
	    } else {
	        const noResultDiv = document.createElement('div');
	        noResultDiv.innerHTML = '<p>검색 결과가 없습니다.</p>';
	        contentDiv.appendChild(noResultDiv);
	    }
	}

    // Initial AJAX request
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
            timeRanges: getCheckedTimeRanges() // Pass the time ranges
        },
        success: function(data) {
            console.log(data);
            updateFlightInfo(data);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });

    // Checkbox change event listener
    const checkboxes = document.querySelectorAll('[id^="ckDep_"]');
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            console.log(`Checkbox \${checkbox.id} - Checked: \${this.checked}, Value: \${this.value}`);
            $.ajax({
                type: 'POST',
                url: '/Airline/Filter',
                data: {
                    checkboxId: checkbox.id,
                    isChecked: this.checked,
                    checkboxValue: this.value,
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
                    infantCount: '${infantCount}',
                    timeRanges: getCheckedTimeRanges() // Pass the time ranges
                },
                success: function(data) {
                    console.log(data);
                    updateFlightInfo(data);
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });
    });

});

</script>

</body>
</html>