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
main {
	width: 80%;
	margin-top: 20px;
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
}

.flight-header {
	display: flex;
	align-items: center;
	width: fit-content;
	border: 1px solid #ccc;
	padding: 5px;
}

.flight-logo, .time-taken {
	text-align: center;
	margin-right: 20px;
}

.flight-logo img, .time-taken img {
	display: block;
	margin: 0 auto;
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
	/* font-size: 20px; */
}

.payBtn {
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

.payBtn:hover {
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

</style>

</head>

<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>

<body>
	<main id="main-container">

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
							<span class="price-info">
							
								<button type="button" class="payBtn">결제</button>
								
								<div>
									<strong>${roundTripPrices[status.index]} KRW</strong>
								</div>
								
								<div class="priceInfo" style="display: none;">
		                        	<div class="priceInfo_wrap">
										<div class="priceInfo_header">
											<h5>요금선택<span class="">성인 1인 요금</span></h5>
										</div>
										<div class="priceInfo_wrap_contents">
											<ul role="">
												<li class="priceInfo_wrap_contents_li">
													<div class="">
														<input type="radio" class="" name="" onclick="" checked="checked">
														<label for="">
															<span class=""></span>
															롯데카드
														</label>
													</div>
													<div class="cardPriceInfo">${roundTripPrices[status.index]} KRW</div>
												</li>
											</ul>
										</div>
									</div>	
		                        </div>
								
							</span>
							<!-- ------------------------------------------------------------------------- -->
						</div>
					</div>
					<hr />	<!-- 왕복 항공편 구분선 -->
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
		                    <span>
		                    
		                        <button type="button" class="payBtn">결제</button>
		                        
		                        <div>
		                            <strong>${oneWayPrices[status.index]} KRW</strong>
		                        </div>
		                        
		                        <div class="priceInfo" style="display: none;">
		                        	<div class="priceInfo_wrap">
										<div class="priceInfo_header">
											<h5>요금선택<span class="">성인 1인 요금</span></h5>
										</div>
										<div class="priceInfo_wrap_contents">
											<ul role="">
												<li class="priceInfo_wrap_contents_li">
													<div class="">
														<input type="radio" class="" name="" onclick="" checked="checked">
														<label for="">
															<span class=""></span>
															롯데카드
														</label>
													</div>
													<div class="cardPriceInfo">${oneWayPrices[status.index]} KRW</div>
												</li>
											</ul>
										</div>
									</div>	
		                        </div>
		                        
		                    </span>
		                    <!-- ------------------------------------------------------------------------- -->
		                </div>
		            </div>
		            <hr/>	<!-- 편도 항공편 구분선 -->
		        </c:forEach>
			</c:otherwise>
		</c:choose>
	</main>

	<%@include file="/WEB-INF/include/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

	const payBtnEls = document.querySelectorAll('.payBtn');
	console.dir(payBtnEls);
	//const payBtnEl = document.querySelector('.payBtn');
	//console.dir(payBtnEl);
	
    payBtnEls.forEach(button => {
        button.addEventListener('click', function() {
            let priceInfo = this.nextElementSibling.nextElementSibling;
            if (priceInfo.style.display === 'none' || priceInfo.style.display === '') {
                priceInfo.style.display = 'block';
            } else {
                priceInfo.style.display = 'none';
            }        
        });
    });


</script>

</body>
</html>