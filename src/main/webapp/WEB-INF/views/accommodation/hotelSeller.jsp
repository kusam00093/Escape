<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escape</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- CSS Stylesheets -->
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/accommodation/hotel.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css" />
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Swiper CSS -->
<link href="https://unpkg.com/swiper/swiper-bundle.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.js"></script>
<style>
  .searchOptionDropdown {
    display: none;
  }
  .searchOptionDropdown.show {
    display: block;
  }
</style>
</head>
<%@include file="/WEB-INF/include/header.jsp"%>

<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
	<main class="e1b5jjmz0 css-2kceou e1pzvah12">
		<div class="css-qhzs5v en76een0">
<!-- 		상단 div -->
			<div class="css-tinny8 e18lo67g0">
<!-- 			여행지/일정/숙박인원 검색 -->
				   <!-- 호텔 등록 폼 -->
<!--             <form id="hotel-registration-form" enctype="multipart/form-data" method="post" action="/AccommodationApi/registerHotel"> -->
<!-- 			숙소 사진                 -->
				<div class="css-79elbk e18lo67g1">
				    <input type="hidden" id="hotelIdx" value="${hotel.hotel_idx}">
				   
				        <input type="file" name="image" accept="image/*" required>
				        <button type="submit" class="css-14fxxv1">사진 업로드</button>
				    
			        <div class="css-1futtae e9nb2z70">
			            <div class="css-l5ala0 e9nb2z71" id="hotel-image-list">
			                <!-- 호텔 사진 리스트 -->
			                <c:forEach var="imagePath" items="${imagePaths}" varStatus="status">
			                    <c:if test="${status.index < 5}">
			                        <img alt="호텔 이미지" src="${pageContext.request.contextPath}/images/hotel/${imagePath}" class="css-j3xuou e9nb2z72">
			                    </c:if>
			                </c:forEach>
			            </div>
			            <button type="button" shape="pill" class="e9nb2z73 css-14fxxv1" data-toggle="modal" data-target="#imageModal">
			                <div class="css-oss1kg">
			                    <span class="css-g354lr">
			                        <span class="css-dnoo08">사진 모두 보기</span>
			                    </span>
			                </div>
			            </button>
			            <!-- Modal -->
			            <div class="modal fade e9nb2z74 css-17nco2d" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
			                <section class="css-ku40o1">
			                    <p class="css-nfpvp8">${hotel.name}</p>
			                </section>
			                <div class="css-1a5bpe6 css-1axgspo modal-body">
			                    <div class="css-1fuarqg">
			                        <div class="swiper-container gallery-top css-1m9bh34 swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
			                            <!-- 호텔 안의 사진 모음 -->
			                            <div class="swiper-wrapper css-en91p7" style="transform: translate3d(0px, 0px, 0px);">
			                                <c:forEach var="imagePath" items="${imagePaths}">
			                                    <div class="swiper-slide" style="width: 744px; margin-right: 10px;">
			                                        <img src="${pageContext.request.contextPath}/images/hotel/${imagePath}" alt="slide">
			                                    </div>
			                                </c:forEach>											
			                            </div>
			                            <!-- Next 버튼 -->
			                            <div class="swiper-button-next css-r1fteo">
			                                <img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_narrowarrowright_xl_white.svg" class="css-s08p0c">											
			                            </div>
			                            <!-- Prev 버튼 -->												
			                            <div class="swiper-button-prev css-r1fteo">
			                                <img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_narrowarrowleft_xl_white.svg" class="css-s08p0c">
			                            </div>
			                        </div>	
			                        <!-- 모달 페이징 -->
			                        <div class="swiper-pagination css-48091o swiper-pagination-fraction">
			                            <span class="swiper-pagination-current">1</span>
			                            /
			                            <span class="swiper-pagination-total">${imagePaths.size()}</span>
			                        </div>
			                        <!-- 전체 사진 -->
			                        <div class="swiper-container gallery-thumbs css-1wbr1y1 swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
			                            <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(292px, 0px, 0px);">
			                                <c:forEach var="imagePath" items="${imagePaths}">
			                                    <div class="swiper-slide css-265z5n swiper-slide-active">
			                                        <img src="${pageContext.request.contextPath}/images/hotel/${imagePath}" alt="thumb">
			                                    </div>
			                                </c:forEach>
			                            </div>
			                        </div>				
			                    </div>
			                </div>
			            </div>
			        </div>
				</div>

<!-- 				호텔 이름/좋아요/가격/객실 선택 -->
		
				<!-- 초기값 설정 -->
				<c:set var="lowestPrice" value="99999999" />
				<c:set var="lowestDiscountedPrice" value="99999999" />

				<!-- 각 방의 가격과 할인된 가격 계산 -->
				<c:forEach var="room" items="${rooms}">
				    <c:set var="price" value="${room.price}" />
				    <c:set var="discountRate" value="${room.discount_rate}" />
				    <c:set var="discountAmount" value="${room.discount_amount}" />
				    
				    <!-- 할인 가격 계산 -->
				    <c:set var="discountedPrice" value="${price}" />
				    <c:if test="${discountRate > 0}">
				        <c:set var="discountedPrice" value="${price - (price * discountRate / 100)}" />
				    </c:if>
				    <c:if test="${discountAmount > 0}">
				        <c:set var="discountedPrice" value="${price - discountAmount}" />
				    </c:if>
				    
				    <!-- 최저 가격 비교 및 설정 -->
				    <c:if test="${price < lowestPrice}">
				        <c:set var="lowestPrice" value="${price}" />
				        <c:set var="lowestDiscountedPrice" value="${discountedPrice}" />
				    </c:if>
				</c:forEach>
				
				<!-- 포맷된 가격 설정 -->
				<c:set var="formattedLowestPrice">
				    <fmt:formatNumber value="${lowestPrice}" type="number" pattern="#,###"/>
				</c:set>
				<c:set var="formattedLowestDiscountedPrice">
				    <fmt:formatNumber value="${lowestDiscountedPrice}" type="number" pattern="#,###"/>
				</c:set>
								
				<div class="css-yd8sa2 e18lo67g2">
					<div>
						<div class="css-1s91mnt e18lo67g3">
							<div class="css-c9l051 e18lo67g4">
								<div class="css-i3pbo e18lo67g5">
									<div class="css-1mi5cco eyhncde0">
										<div class="css-k008qs eyhncde1">
											 <span class="eyhncde2 css-sfumlt">${hotel.name}</span>
										</div>
									</div>
								</div>
								<div class="css-ayucfr e18lo67g6">
									<div class="css-6g4hta e157n2fq0">
										<div class="origin-price css-1n2mv2k e157n2fq3">
											<span class="css-bgkldf" style="color: rgb(250, 91, 74);">할인가</span>
											<span class="css-12wooir e157n2fq2">${formattedLowestPrice}원/박</span>
										</div>
										<div class="css-1n2mv2k e157n2fq3">
											<span class="mr-half-1 css-1kjy5hl" style="color: rgb(250, 91, 74);">${formattedLowestDiscountedPrice}원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="css-1i27l4i e18lo67g9">
								<button shape="pill" class="e1bx4bg60 css-p2iygf">
									<div class="css-ov1ktg">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons">
											<path fill-rule="evenodd" d="M2.644 9.91C2.644 6.454 5.16 4 8.316 4c2.096 0 3.585 1.47 4.401 2.935a.848.848 0 0 1-.31 1.145.817.817 0 0 1-1.124-.316C10.616 6.568 9.576 5.68 8.316 5.68c-2.24 0-4.022 1.698-4.022 4.23 0 1.473.644 3.01 1.912 4.57 1.267 1.56 3.119 3.088 5.423 4.518.11.069.219.128.31.168.044.019.075.03.093.034.441.018.793.387.793.84 0 .463-.37.84-.825.84-.279 0-.538-.095-.708-.17a4.148 4.148 0 0 1-.522-.278c-2.4-1.49-4.414-3.132-5.835-4.88-1.422-1.748-2.291-3.653-2.291-5.643Zm9.399 9.293h-.002.002Z" clip-rule="evenodd"></path>
											<path fill-rule="evenodd" d="M21.356 9.91c0-3.455-2.517-5.91-5.672-5.91-2.096 0-3.585 1.47-4.401 2.935a.848.848 0 0 0 .31 1.145c.396.229.9.087 1.124-.316.667-1.196 1.707-2.084 2.967-2.084 2.24 0 4.022 1.698 4.022 4.23 0 1.473-.644 3.01-1.912 4.57-1.267 1.56-3.119 3.088-5.423 4.518-.11.069-.219.128-.31.168a.758.758 0 0 1-.093.034.833.833 0 0 0-.793.84c0 .463.37.84.825.84.279 0 .538-.095.708-.17.19-.081.372-.184.522-.278 2.4-1.49 4.414-3.132 5.835-4.88 1.422-1.748 2.291-3.653 2.291-5.643Zm-9.399 9.293h.002-.002Z" clip-rule="evenodd"></path>
										</svg>
									</div>
								</button>
								<div class=" css-2bqhlj e1b0xu6w0">
									<button shape="pill" class="e1b0xu6w2 css-p2iygf">
										<div class="css-ov1ktg">
											<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" viewBox="0 0 24 24">
												<path d="M16.5 20.146a2.552 2.552 0 0 1-1.875-.771 2.552 2.552 0 0 1-.771-1.875c0-.111.007-.215.021-.312.014-.097.035-.202.063-.313L9.208 14a1.873 1.873 0 0 1-.76.49 2.862 2.862 0 0 1-.948.156 2.552 2.552 0 0 1-1.875-.771A2.552 2.552 0 0 1 4.854 12c0-.736.257-1.361.771-1.875A2.552 2.552 0 0 1 7.5 9.354c.32 0 .632.056.938.167.305.111.562.271.77.479l4.73-2.875a3.118 3.118 0 0 1-.063-.312 2.201 2.201 0 0 1-.021-.313c0-.736.257-1.361.771-1.875a2.552 2.552 0 0 1 1.875-.771c.736 0 1.361.257 1.875.771s.771 1.139.771 1.875-.257 1.361-.771 1.875a2.552 2.552 0 0 1-1.875.771A3.04 3.04 0 0 1 15.552 9a1.696 1.696 0 0 1-.76-.5l-4.73 2.875c.028.111.049.216.063.313.014.097.021.2.021.312 0 .111-.007.215-.021.312a3.097 3.097 0 0 1-.063.313l4.73 2.875c.208-.25.461-.42.76-.51.299-.09.615-.136.948-.136.736 0 1.361.257 1.875.771s.771 1.139.771 1.875-.257 1.361-.771 1.875a2.552 2.552 0 0 1-1.875.771Z"></path>
											</svg>									
										</div>
									</button>
									<textarea class="css-1dhg90f e1b0xu6w4" readonly></textarea>
								</div>
								<button class="e18lo67g10 css-1c7t3vv" shape="pill">
									<div class="css-oss1kg">
										<span class="css-1bjjy4l">
											<span class="css-19kftx2">객실 선택</span>
										</span>
									</div>
								</button>
							</div>
						</div>
					</div>
				</div>	
			</div>
<!-- 		중간 div -->
			<div class="css-jltv26 e2o1h7g0">
<!-- 			결제 혜택 박스 -->
				<div class="ezxjhvf1 css-17t65wn">
					<div class="ezxjhvf0 e1w57zu10 css-yks7hj">
						<div class="css-4mbokm ezxjhvf2">
							<div class="css-z66aix ezxjhvf3">
								<span class="css-1k1esfp">결제 혜택</span>
							</div>
							<div class="css-1f0ub1b ezxjhvf4">
								<div class="css-103ejlk e17nh34u0">
									<img src="https://dffoxz5he03rp.cloudfront.net/icons/ico_credit_card_3x.png" class="css-1vsgj6t e17nh34u1">
									<span class="e17nh34u2 css-qqc2n5">최대 12개월 무이자 할부 가능</span>
									<div class="css-1u9p9ef e17nh34u3">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="css-qugwz3 e17nh34u4">
											<path d="M12 11c.317 0 .587.108.812.325.225.217.338.483.338.8v3.9c0 .317-.113.579-.338.787a1.15 1.15 0 0 1-.812.313c-.317 0-.587-.108-.812-.325a1.066 1.066 0 0 1-.338-.8v-3.9c0-.317.113-.58.338-.788.225-.208.495-.312.812-.312Zm0-4.2c.333 0 .613.113.838.338.225.225.337.504.337.837 0 .333-.112.612-.337.837A1.138 1.138 0 0 1 12 9.15c-.333 0-.612-.113-.837-.338a1.135 1.135 0 0 1-.338-.837c0-.333.113-.612.338-.837.225-.225.504-.338.837-.338Zm0-5a9.999 9.999 0 0 0-3.988.8 10.247 10.247 0 0 0-3.237 2.175A10.247 10.247 0 0 0 2.6 8.012 10 10 0 0 0 1.8 12a10 10 0 0 0 .8 3.988 10.248 10.248 0 0 0 2.175 3.237A10.25 10.25 0 0 0 8.012 21.4a10 10 0 0 0 3.988.8 10 10 0 0 0 3.988-.8 10.248 10.248 0 0 0 3.237-2.175 10.247 10.247 0 0 0 2.175-3.237c.533-1.242.8-2.571.8-3.988a9.998 9.998 0 0 0-.8-3.988 10.246 10.246 0 0 0-2.175-3.237A10.245 10.245 0 0 0 15.988 2.6 9.999 9.999 0 0 0 12 1.8Zm0 2.275c2.2 0 4.071.77 5.613 2.312C19.154 7.929 19.925 9.8 19.925 12c0 2.2-.77 4.071-2.312 5.613-1.542 1.541-3.413 2.312-5.613 2.312-2.2 0-4.07-.77-5.612-2.312C4.846 16.071 4.075 14.2 4.075 12c0-2.2.771-4.071 2.313-5.613C7.93 4.846 9.8 4.075 12 4.075Z">
											</path>
										</svg>
									</div>
								</div>
								<div class="css-103ejlk e17nh34u0">
									<img src="https://dffoxz5he03rp.cloudfront.net/icons/ico_check_3x.png" class="css-1vsgj6t e17nh34u1">
									<span class="e17nh34u2 css-qqc2n5">카카오페이 6월 6% 선착순 즉시할인</span>
									<div class="css-1u9p9ef e17nh34u3">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="css-qugwz3 e17nh34u4">
											<path d="M12 11c.317 0 .587.108.812.325.225.217.338.483.338.8v3.9c0 .317-.113.579-.338.787a1.15 1.15 0 0 1-.812.313c-.317 0-.587-.108-.812-.325a1.066 1.066 0 0 1-.338-.8v-3.9c0-.317.113-.58.338-.788.225-.208.495-.312.812-.312Zm0-4.2c.333 0 .613.113.838.338.225.225.337.504.337.837 0 .333-.112.612-.337.837A1.138 1.138 0 0 1 12 9.15c-.333 0-.612-.113-.837-.338a1.135 1.135 0 0 1-.338-.837c0-.333.113-.612.338-.837.225-.225.504-.338.837-.338Zm0-5a9.999 9.999 0 0 0-3.988.8 10.247 10.247 0 0 0-3.237 2.175A10.247 10.247 0 0 0 2.6 8.012 10 10 0 0 0 1.8 12a10 10 0 0 0 .8 3.988 10.248 10.248 0 0 0 2.175 3.237A10.25 10.25 0 0 0 8.012 21.4a10 10 0 0 0 3.988.8 10 10 0 0 0 3.988-.8 10.248 10.248 0 0 0 3.237-2.175 10.247 10.247 0 0 0 2.175-3.237c.533-1.242.8-2.571.8-3.988a9.998 9.998 0 0 0-.8-3.988 10.246 10.246 0 0 0-2.175-3.237A10.245 10.245 0 0 0 15.988 2.6 9.999 9.999 0 0 0 12 1.8Zm0 2.275c2.2 0 4.071.77 5.613 2.312C19.154 7.929 19.925 9.8 19.925 12c0 2.2-.77 4.071-2.312 5.613-1.542 1.541-3.413 2.312-5.613 2.312-2.2 0-4.07-.77-5.612-2.312C4.846 16.071 4.075 14.2 4.075 12c0-2.2.771-4.071 2.313-5.613C7.93 4.846 9.8 4.075 12 4.075Z">
											</path>
										</svg>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
<!-- 			숙소 디테일 박스 -->
				<div class="css-1o5ne0g e2o1h7g1">
<!-- 				숙소 위치 -->
					<div class="css-134hp10 eolp4hw0">
						<div class="css-1j63yba e1x9ci4w0">
							<div class="css-1mnf8qz e1x9ci4w1">
								<span class="css-1k1esfp">숙소 위치</span>
							</div>
							<div class="css-an8a4a e1x9ci4w2">
								<div class="css-0 e1x9ci4w3">
									<div class="css-1iigiwp ewh8pwb0">
										<img alt="Google Map" src="https://maps.googleapis.com/maps/api/staticmap?zoom=14&amp;scale=2&amp;size=400x200&amp;center=33.542823791503906,126.66446685791016&amp;key=AIzaSyBAoo822AgkqBDrPE5nr4w_ZRIAF1lISEQ&amp;signature=EXIo8MKkn37Z8F9uJjiJU03Wxbs%3D" class="css-1drnufd ewh8pwb1">
										<img alt="33.542823791503906,126.66446685791016" loading="lazy" width="46" height="53" decoding="async" data-nimg="1" class="css-17ctwle" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_location_138x162_filled_gray_1000.png">
									</div>
								</div>
								<div class="css-k008qs e1x9ci4w4">
									<span class="e1x9ci4w5 css-b2uum8">${hotel.zip_code}, ${hotel.address2}, ${hotel.address1}</span>
									<button shape="pill" class="e1x9ci4w6 css-at6m64">
										<div class="css-oss1kg">
											<span class="css-1bjjy4l">주소복사</span>
										</div>
									</button>
								</div>
							</div>
						</div>
					</div>
<!-- 				편의 시설 -->
					<div class="css-134hp10 eolp4hw1">
						<div class="css-1j63yba e3wtogt0">
							<div class="css-0 e3wtogt1">
								<span class="css-1k1esfp">편의 시설</span>
							</div>
					        <div class="css-mvwyst e3wtogt2">
					            <c:forEach var="facility" items="${hotelFacilities}">
					                <div class="css-13kthdy e1bb8btr0">
					                    <div class="css-k008qs e1bb8btr2">
					                        <img alt="${facility.NAME}" src="https://dffoxz5he03rp.cloudfront.net/icons/local_parking_FILL1_wght500_GRAD0_opsz24+1_2x.png" class="css-si2b82 e1bb8btr1">
					                    </div>
					                    <div class="css-k008qs e1bb8btr2">
					                        <span class="css-1iauht1 css-dnoo08">${facility.NAME}</span>
					                    </div>
					                </div>
					            </c:forEach>
					        </div>
						</div>
					</div>
<!-- 				숙소 정보 -->
					<div class="css-1n9s2yp eolp4hw3">
<!-- 					숙소 소개 -->
						<div class="css-1iv0hau e16i52u90">
							<div class="css-7pf6at e16i52u91">
								<span class="e16i52u92 css-1h9zsg">숙소 정보</span>
							</div>
							<div class="css-ha97c2 e16i52u93">
								<div height="100%" class="css-i43npt e16i52u95">
									<div class="css-4fdrxc eamtuzr0">
										<div>
											<span class="eamtuzr1 css-1n4qrt">숙소 소개</span>
										</div>
										<div>
											<span class="eamtuzr2 css-suo9h5">${hotel.detail1}</span>
										</div>
									</div>
									<div class="css-4fdrxc eamtuzr0">
										<div>
											<span class="eamtuzr1 css-1n4qrt">숙소 소개2</span>
										</div>
										<div>
											<span class="eamtuzr2 css-suo9h5">${hotel.detail2}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
<!-- 					숙소 정책 박스 -->
						<div class="css-1iv0hau e16i52u90">
<!-- 						숙소 정책 -->
							<div class="css-7pf6at e16i52u91">
								<span class="e16i52u92 css-1h9zsg">숙소 정책</span>
							</div>
<!-- 						체크인/체크아웃/알아두실 사항 -->
							<div class="css-msd5x3 e16i52u93">
								<div height="100%" class="css-i43npt e16i52u95">
									<div class="css-4fdrxc eamtuzr0">
<!-- 										<div> -->
<!-- 											<span class="eamtuzr1 css-1n4qrt">체크인/체크아웃</span> -->
<!-- 										</div> -->
<!-- 										<div> -->
<!-- 											<span class="eamtuzr2 css-suo9h5">체크인 : 16:00 부터 <br/> 체크아웃 : 11:00 까지</span> -->
<!-- 										</div> -->
									</div>
									<div class="css-4fdrxc eamtuzr0">
										<div>
											<span class="eamtuzr1 css-1n4qrt">알아두실 사항</span>
										</div>
										<div>
											<span class="eamtuzr2 css-suo9h5">${hotel.detail3}</span>
										</div>
									</div>
								</div>
							</div>
<!-- 						더보기 -->
<!-- 							<div> -->
<!-- 								<button shape="pill" class="e16i52u96 css-2zdhhu"> -->
<!-- 									<div class="css-oss1kg"> -->
<!-- 										<span class="css-1bjjy4l">더보기</span> -->
<!-- 									</div> -->
<!-- 								</button> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
<!-- 			객실 선택	박스		 -->
				<div class="css-17mib1z e16f95a0">
<!-- 				객실 선택, 일정변경 -->
					<div class="css-1n3cjvb e16f95a1">
						<div class="css-o73ezp e16f95a2">
							<span class="css-1k1esfp">객실 선택</span>
							<div class="css-cjn8he e1rupbwk0">
								<div class="mrt-detail-room-schedule css-1usqcss e1rupbwk2"></div>
								<div class="css-1scuu9k e1rupbwk1">
									 <span class="css-jfzxc5">${date}</span>
								</div>
								<button shape="pill" class="css-i19t4t" id="changeDateButton" class="changeDate-dropdown">
									<div class="css-oss1kg">
										<span class="css-g354lr">
											<span class="css-dnoo08">일정 변경</span>
										</span>
									</div>
								</button>
						        <div class="searchOptionDropdown changeDate-dropdown css-xtikso e1gvp92b4" style="display: none;">
						            <div class="css-106abu8 e1ilf1y50">
						                <div class="css-1gatni9 ex9pycw0" id="datepicker2"></div>
						                <footer class="css-1tb9vmd ex9pycw1"></footer>
						            </div>
						        </div>								
							</div>
						</div>
<!-- 					객실 List -->
						<div class="css-51dg7o e16f95a3">
							<c:forEach var="room" items="${rooms}">
								
						        <c:set var="price" value="${room.price}" />
						        <c:set var="discountRate" value="${room.discount_rate}" />
						        <c:set var="discountAmount" value="${room.discount_amount}" />
								
					        	<!-- 할인 가격 계산 -->
						        <c:set var="discountedPrice" value="${price}" />
						        <c:if test="${discountRate > 0}">
						            <c:set var="discountedPrice" value="${price - (price * discountRate / 100)}" />
						        </c:if>
						        <c:if test="${discountAmount > 0}">
						            <c:set var="discountedPrice" value="${price - discountAmount}" />
						        </c:if>
								
						        <c:set var="formattedPrice">
						            <fmt:formatNumber value="${price}" type="number" pattern="#,###"/>
						        </c:set>
						        <c:set var="formattedDiscountedPrice">
						            <fmt:formatNumber value="${discountedPrice}" type="number" pattern="#,###"/>
						        </c:set>					
									
								<div class="css-10c7qg5 ekdnpbz0">
									<div class="css-0 ekdnpbz1">
										<span class="css-1kjy5hl">${room.title} (오후 ${room.check_in_time} ~ 오전 ${room.check_out_time} 까지)</span>
									</div>
									<div class="css-1vp6ypr ekdnpbz2">
										<div class="css-hhs1ap ekdnpbz3">
											<div class="css-f3dihc e1ct4i2q0">
												<div class="css-1glyzy2 e1ct4i2q1">
													<img src="https://pix8.agoda.net/hotelImages/32784632/532142722/f4d40fb33ef5f11ff060623b4e588fb3.jpg?ce=0&amp;s=1000x" alt="Room 503 (Cooking available)" class="css-1572upo e1ct4i2q2">
													<div class="css-bqfzl4 e1ct4i2q3">
														<span>2+</span>
													</div>
												</div>
												<div class="css-1jqfg0 e1s82hlt0">
													<div class="css-mgekkz e1s82hlt1">
														<div class="css-1dacjl9 e1s82hlt3">
															<div class="css-1sdqwnv e61jlzk0">
																<div class="css-v71nea e61jlzk1">
																	<img alt="성인 5명" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_person_room_3x.png">
																</div>
																<div class="css-70qvj9 e61jlzk2">
																	<span class="css-bgkldf">성인 ${room.max_person}명</span>
																</div>
															</div>
															<div class="css-1sdqwnv e61jlzk0">
																<div class="css-v71nea e61jlzk1">
																	<img alt="객실 크기(㎡) - 66" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_size_room_3x.png">
																</div>
																<div class="css-70qvj9 e61jlzk2">
																	<span class="css-bgkldf">객실 크기(㎡) - 66</span>
																</div>
															</div>
															<div class="css-1sdqwnv e61jlzk0">
																<div class="css-v71nea e61jlzk1">
																	<img alt="TV" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_bed_room_3x.png">
																</div>
																<div class="css-70qvj9 e61jlzk2">
																	<span class="css-bgkldf">TV</span>
																</div>
															</div>
															<div class="css-1sdqwnv e61jlzk0">
																<div class="css-v71nea e61jlzk1">
																	<img alt="헤어드라이어" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_bathtub_room_3x.png">
																</div>
																<div class="css-70qvj9 e61jlzk2">
																	<span class="css-bgkldf">헤어드라이어</span>
																</div>
															</div>
															<div class="css-1sdqwnv e61jlzk0">
																<div class="css-v71nea e61jlzk1">
																	<img alt="에어컨" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_aircondition_room_3x.png">
																</div>
																<div class="css-70qvj9 e61jlzk2">
																	<span class="css-bgkldf">에어컨</span>
																</div>
															</div>
															<div class="css-1sdqwnv e61jlzk0">
																<div class="css-v71nea e61jlzk1">
																	<img alt="전자레인지" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_restaurant_room_3x.png">
																</div>
																<div class="css-70qvj9 e61jlzk2">
																	<span class="css-bgkldf">전자레인지</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="css-e6t236 ekdnpbz4">
											<div class="css-1xdhyk6">
												<div class="css-1txr52u e1q9d9300">
													<div class="css-1ni1io2 e1q9d9301">
														<div class="css-j7qwjs e17p53lv0">
															<div class="css-i7tjzy e17p53lv2">
																<div class="css-159hdns e61jlzk0">
																	<div class="css-v71nea e61jlzk1">
																		<img alt="추가 침대 불가" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_checked_option_attribute_3x.png">
																	</div>
																	<div class="css-70qvj9 e61jlzk2">
																		<span class="css-bgkldf">추가 침대 불가</span>
																	</div>
																</div>
																<div class="css-159hdns e61jlzk0">
																	<div class="css-v71nea e61jlzk1">
																		<img alt="무료 Wi-Fi" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_checked_option_attribute_3x.png">
																	</div>
																	<div class="css-70qvj9 e61jlzk2">
																		<span class="css-bgkldf">무료 Wi-Fi</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="css-1g90fsm e1q9d9302">
														<div class="css-1jqfg0 e1q9d9303">
								                           <div class="css-16fffon e16iha2r0">
								                                <c:if test="${discountRate > 0 or discountAmount > 0}">
								                                    <div class="css-fjt9ki e16iha2r1">
								                                        <span class="css-pglvi5 e16iha2r3">할인가</span>
								                                        <span class="css-1e8aui5 e16iha2r4">${formattedPrice}원/박</span>
								                                    </div>
									                                <div class="css-114g9yd e16iha2r5">
									                                    <div class="css-12dy4dz e16iha2r2">
									                                        <span class="css-1bg0z7j e16iha2r6">${formattedDiscountedPrice}원/박</span>
									                                    </div>
									                                </div>
								                                </c:if>
								                                <c:if test="${discountRate == 0 and discountAmount == 0}">
								                                    <div class="css-114g9yd e16iha2r5">
								                                        <div class="css-12dy4dz e16iha2r2">
								                                            <span class="css-1bg0z7j e16iha2r6">${formattedPrice}원/박</span>
								                                        </div>
								                                    </div>
								                                </c:if>
								                                <div class="css-12dy4dz e16iha2r2">
								                                    <div class="css-w9c0d8 e16iha2r7">
								                                        <span class="css-1njnize e16iha2r8">세금 및 수수료 포함</span>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
														
														<div class="css-me3ito e1q9d9304">
															<input type="hidden" name="hotel_idx" value="${hotel.hotel_idx}" class="hotel-idx">
															<a href="/Accommodation/RoomOrder/${room.room_idx}" class="roomBtn e14snjrl0 css-m0pn6q reserve-btn" data-room-id="${room.room_idx}">
																<div class="css-pszfx5">
																	<span class="css-1bjjy4l">예약하기</span>
																</div>
															</a>
														</div>
														
														<div class="css-8z217v e1q9d9305">
															<div class="e1q9d9306 css-k14pv3 e61jlzk0">
																<div class="css-v71nea e61jlzk1"></div>
																<div class="css-70qvj9 e61jlzk2">
																	<span style="color:#FA5B4A" class="css-bgkldf">객실이 ${room.available_rooms}개 남았어요</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
<!-- 		끝 div -->
			<div></div>
		</div>
	</main>
<!-- Bootstrap JavaScript and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', () => {

		document.getElementById('upload-form').addEventListener('submit', function(event) {
		    event.preventDefault();
		    var formData = new FormData(this);

		    fetch('/Accommodation/uploadHotelImage', {
		        method: 'POST',
		        body: formData
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            var imageList = document.getElementById('hotel-image-list');
		            var newImage = document.createElement('img');
		            newImage.src = data.filePath;
		            newImage.alt = '호텔 이미지';
		            newImage.classList.add('css-j3xuou', 'e9nb2z72');
		            imageList.appendChild(newImage);
		        } else {
		            alert('이미지 업로드에 실패했습니다.');
		        }
		    })
		    .catch(error => console.error('Error:', error));
		});
		
		//호텔 이미지 모달
	    $('#imageModal').on('show.bs.modal', function (e) {
	        setTimeout(function(){
	            var galleryThumbs = new Swiper('.gallery-thumbs', {
	                spaceBetween: 10,
	                slidesPerView: 4,
	                centeredSlides: true,
	                freeMode: true,
	                watchSlidesVisibility: true,
	                watchSlidesProgress: true,
	                slideToClickedSlide: true,
	                initialSlide: 0
	            });

	            var galleryTop = new Swiper('.gallery-top', {
	                loop: true,
	                spaceBetween: 10,
	                centeredSlides: true,
	                slidesPerView: 1,
	                navigation: {
	                    nextEl: '.swiper-button-next',
	                    prevEl: '.swiper-button-prev',
	                },
	                pagination: {
	                    el: '.swiper-pagination',
	                    type: 'fraction',
	                },
	                thumbs: {
	                    swiper: galleryThumbs
	                },
	                initialSlide: 0
	            });
	        }, 500);  // Delay to allow modal to open completely
	    });
		
	 // "객실 클릭" 항목 클릭 이벤트
	    const roomLinks = document.querySelectorAll(".roomBtn");

	    roomLinks.forEach(function(link) {
	        link.addEventListener("click", function(event) {
	            event.preventDefault();

	            const place = placeInput.value;
	            const date = dateInput ? dateInput.value : '';
	            const guest = guestInput ? guestInput.value : '';
	            const hotel_idx = link.closest('.css-me3ito').querySelector('.hotel-idx').value;

	            const queryString = '?place=' + encodeURIComponent(place) + 
	                                '&date=' + encodeURIComponent(date) + 
	                                '&guest=' + encodeURIComponent(guest);

	            // 동적으로 폼을 생성하고 hidden input 필드로 값을 전송
	            const form = document.createElement('form');
	            form.method = 'POST';
	            form.action = link.href.split('?')[0] + queryString;
	            
	            const hotelInput = document.createElement('input');
	            hotelInput.type = 'hidden';
	            hotelInput.name = 'hotel_idx';
	            hotelInput.value = hotel_idx;
	            
	            form.appendChild(hotelInput);
	            
	            document.body.appendChild(form);
	            form.submit();
	        });
	    });
	})
</script>	 
</body>

</html>
