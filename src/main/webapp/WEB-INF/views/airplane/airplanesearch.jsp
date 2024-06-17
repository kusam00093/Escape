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
    margin: 0;
    padding: 0;
    display: flex;
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
	margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.flight-header {
	display: flex;
	align-items: center;
	width: fit-content;
	border: 1px solid #ccc;
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

/* 사이드바 스타일 설정 */
.sidebar {
  flex: 1;
  background-color: #f8f8f8;
  padding: 20px;
  box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
  
  width: 300px;
  border: 1px solid #ccc;
  
}

.locSetting {
  font-weight: bold;
}

/* --------------------------------------------- */
/* --------------------------------------------- */
/* --------------------------------------------- */
/* --------------------------------------------- */
/* --------------------------------------------- */

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
    width: 100%;
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

.main_container {
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

.content {
    flex: 3;
    padding: 20px;
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
	            <h2><a href="#" onclick="">출발시간</a></h2>
	            <div>
	                <h2>가는날</h2>
	                <ul>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_01" value="06" class="time-checkbox" checked="checked">
	                            <label for="ckDep_01"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_02" value="12" class="time-checkbox" checked="checked">
	                            <label for="ckDep_02"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_03" value="18" class="time-checkbox" checked="checked">
	                            <label for="ckDep_03"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_04" value="24" class="time-checkbox" checked="checked">
	                            <label for="ckDep_04"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
	                        </div>
	                    </li>
	                </ul>
	                <h2>오는날</h2>
	                <ul>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_05" value="06" class="time-checkbox" checked="checked">
	                            <label for="ckDep_05"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_06" value="12" class="time-checkbox" checked="checked">
	                            <label for="ckDep_06"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_07" value="18" class="time-checkbox" checked="checked">
	                            <label for="ckDep_07"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_08" value="24" class="time-checkbox" checked="checked">
	                            <label for="ckDep_08"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	
			<hr />
	
	        <div class="filter-group">
	            <h2><a href="#" onclick="">도착시간</a></h2>
	            <div>
	                <h2>가는날</h2>
	                <ul>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_09" value="06" class="time-checkbox" checked="checked">
	                            <label for="ckDep_09"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_10" value="12" class="time-checkbox" checked="checked">
	                            <label for="ckDep_10"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_11" value="18" class="time-checkbox" checked="checked">
	                            <label for="ckDep_11"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_12" value="24" class="time-checkbox" checked="checked">
	                            <label for="ckDep_12"><span class="time-label"></span>야간 18:00 ~ 24:00</label>
	                        </div>
	                    </li>
	                </ul>
	                <h2>오는날</h2>
	                <ul>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_13" value="06" class="time-checkbox" checked="checked">
	                            <label for="ckDep_13"><span class="time-label"></span>새벽 00:00 ~ 06:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_14" value="12" class="time-checkbox" checked="checked">
	                            <label for="ckDep_14"><span class="time-label"></span>오전 06:00 ~ 12:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_15" value="18" class="time-checkbox" checked="checked">
	                            <label for="ckDep_15"><span class="time-label"></span>오후 12:00 ~ 18:00</label>
	                        </div>
	                    </li>
	                    <li>
	                        <div>
	                            <input type="checkbox" id="ckDep_16" value="24" class="time-checkbox" checked="checked">
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
	                            <input type="checkbox" id="passger_2" class="passenger-checkbox" checked="checked" value="학생">
	                            <label for="passger_2"><span class="passenger-label"></span>학생</label>
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
	                    <li>635,000원 미만</li>
	                    <li>
	                        <div>
	                            <input type="range" id="price-range" min="0" max="100" value="50" class="price-slider">
	                            <span id="price-range-label"></span>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>


	
	  <div class="content">
	    <c:choose>
	      <c:when test="${not empty roundTripFlights}">
	        <c:forEach items="${roundTripFlights}" var="roundTrip" varStatus="status">
	          <div class="flight-wrapper">
	            <div class="flight-header">
	              <span class="flight-logo">
	                <img src="${ roundTrip[0].LOGO }" class="spanImg" alt="logo">
	                <em>${ roundTrip[0].AIRLINE_NAME }</em>
	              </span>
	              <div class="flight-details-wrapper">
	                <c:forEach items="${roundTrip}" var="flight">
	                  <div class="flight-details">
	                    <ul>
	                      <li>
	                        <div>
	                          <span class="fontSetting">
	                            <span class="locSetting">${ flight.START_TIME }
	                              <em>${ flight.DEPCITY_ENAME }
	                                <span>${ flight.DEPCITY_NAME }</span>
	                              </em>
	                            </span>
	                          </span>
	
	                          <span class="time-taken">
	                            <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                            <em>${ flight.DURATIONHOUR }시간 ${ flight.DURATIONMINUTE }분</em>
	                          </span>
	
	                          <span class="fontSetting">
	                            <span class="locSetting">${ flight.END_TIME }
	                              <em>${ flight.ARRCITY_ENAME }
	                                <span>${ flight.ARRCITY_NAME }</span>
	                              </em>
	                            </span>
	                          </span>
	
	                          <span>직항</span>
	                        </div>
	                      </li>
	                    </ul>
	                  </div>
	                </c:forEach>
	              </div>
	              <!-- ------------------------------------------------------------------------- -->
	              <!-- <form action="/Airplane/AirplanePay" method="POST"> -->
	              <form class="paymentForm" action="/Airplane/AirplanePay" method="POST">
					<input type="hidden" name="orderId" value="${ roundTrip[0].AIRPLANE_TIME_IDX }">
					<input type="hidden" name="userId" value="${ sessionScope.login.id }">
					<input type="hidden" name="itemName" value="${ roundTrip[0].AIRLINE_NAME }">
					<input type="hidden" name="seatClass" value="${ seatClass }">
					<input type="hidden" name="adultCount" value="${ adultCount }">
					<input type="hidden" name="childCount" value="${ childCount }">
					<input type="hidden" name="infantCount" value="${ infantCount }">
					<input type="hidden" name="adultPrice" value="${ roundTrip[0].ADULT_PRICE }">
					<input type="hidden" name="childPrice" value="${ roundTrip[0].CHILD_PRICE }">
					<input type="hidden" name="infantPrice" value="${ roundTrip[0].INFANT_PRICE }">
					<input type="hidden" name="totalPrice" value="${ roundTripPrices[status.index] }">
		              <span class="price-info">
		                <button type="submit" class="reservationBtn"
				            data-airplane-time-idx="${ roundTrip[0].AIRPLANE_TIME_IDX }" 
				            data-user-id="${ sessionScope.login.id }"
				            data-airplane-name="${ roundTrip[0].AIRLINE_NAME }"
				            data-seatClass="${ seatClass }"
				            data-adultCount="${ adultCount }"
				            data-childCount="${ childCount }"
				            data-infantCount="${ infantCount }"
				            data-totalPrice="${ roundTripPrices[status.index] }"
				            onclick="confirmPayment(event)"
				        >예약</button>
		                <div>
		                  <strong>${roundTripPrices[status.index]} KRW</strong>
		                </div>
		                
		                <!-- <script src="https://cdn.iamport.kr/vl/iamport.js"></script> -->
		                <!-- <script src="/js/main.js"></script> -->
		                
		              </span>
		            </form>
	              <!-- ------------------------------------------------------------------------- -->
	            </div>
	          </div>
	          <hr /> <!-- 왕복 항공편 구분선 -->
	        </c:forEach>
	      </c:when>
	      <c:otherwise>
	        <c:forEach items="${oneWayFlights}" var="oneWay" varStatus="status">
	          <div class="flight-wrapper">
	            <div class="flight-header">
	              <span class="flight-logo">
	                <img src="${ oneWay[0].LOGO }" class="spanImg" alt="logo">
	                <em>${ oneWay[0].AIRLINE_NAME }</em>
	              </span>
	              <div class="flight-details-wrapper">
	                <div class="flight-details">
	                  <ul>
	                    <li>
	                      <div>
	                        <span class="fontSetting">
	                          <span class="locSetting">${ oneWay[0].START_TIME }
	                            <em>${ oneWay[0].DEPCITY_ENAME }
	                              <span>${ oneWay[0].DEPCITY_NAME }</span>
	                            </em>
	                          </span>
	                        </span>
	
	                        <span class="time-taken">
	                          <img src="/images/arrow.jpg" class="arrowImg" alt="arrow">
	                          <em>${ oneWay[0].DURATIONHOUR }시간 ${ oneWay[0].DURATIONMINUTE }분</em>
	                        </span>
	
	                        <span class="fontSetting">
	                          <span class="locSetting">${ oneWay[0].END_TIME }
	                            <em>${ oneWay[0].ARRCITY_ENAME }
	                              <span>${ oneWay[0].ARRCITY_NAME }</span>
	                            </em>
	                          </span>
	                        </span>
	
	                        <span>직항</span>
	                      </div>
	                    </li>
	                  </ul>
	                </div>
	              </div>
	              <!-- ------------------------------------------------------------------------- -->
	              <!-- <form action="/Airplane/AirplanePay" method="POST"> -->
	              <form class="paymentForm" action="/Airplane/AirplanePay" method="POST">
					<input type="hidden" name="orderId" value="${ oneWay[0].AIRPLANE_TIME_IDX }">
					<input type="hidden" name="userId" value="${ sessionScope.login.id }">
					<input type="hidden" name="itemName" value="${ oneWay[0].AIRLINE_NAME }">
					<input type="hidden" name="seatClass" value="${ seatClass }">
					<input type="hidden" name="adultCount" value="${ adultCount }">
					<input type="hidden" name="childCount" value="${ childCount }">
					<input type="hidden" name="infantCount" value="${ infantCount }">
					<input type="hidden" name="totalPrice" value="${ oneWayPrices[status.index] }">
		              <span>
		                <button type="submit" class="reservationBtn"
				            data-airplane-time-idx="${ oneWay[0].AIRPLANE_TIME_IDX }" 
				            data-user-id="${ sessionScope.login.id }"
				            data-airplane-name="${ oneWay[0].AIRLINE_NAME }"
				            data-seat-class="${ seatClass }"
				            data-adult-count="${ adultCount }"
				            data-child-count="${ childCount }"
				            data-infant-count="${ infantCount }"
				            data-totalPrice="${ oneWayPrices[status.index] }"
				            onclick="confirmPayment(event)"
				        >결제</button>
		                <div>
		                  <strong>${oneWayPrices[status.index]} KRW</strong>
		                </div>
		                
		                <!-- <script src="https://cdn.iamport.kr/vl/iamport.js"></script> -->
		                <!-- <script src="/js/main.js"></script> -->
		                
		              </span>
		            </form>
	              <!-- ------------------------------------------------------------------------- -->
	            </div>
	          </div>
	          <hr /> <!-- 편도 항공편 구분선 -->
	        </c:forEach>
	      </c:otherwise>
	    </c:choose>
	  </div>
	</div>

	</main>
	

	<%@include file="/WEB-INF/include/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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

</body>
</html>