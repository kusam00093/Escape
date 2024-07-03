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
				<div class="css-8iskzq e17xa0j30">
					<div class="css-1lmikz8 e5uh5nv0">
						
						<div class="searchDetail css-1ildg2g e5uh5nv2" data-section="place">
							<div class="css-17ujo4z e1gvp92b0">
								<div class="css-f3d94f e1gvp92b1">
									<span class="css-2x3a1r">여행지</span>
									<span class="e1gvp92b3 css-1ft6oz5" id="place"></span>
									<input type="hidden" name="place" id="placeInput">
								</div>
								<button class="e1gvp92b2 css-c6rtju">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#848c94" opacity="0.5">
										<path d="M7.725 16.275c.2.2.446.3.738.3.291 0 .537-.1.737-.3l2.8-2.8 2.825 2.825c.2.2.442.296.725.287.283-.008.525-.112.725-.312.2-.2.3-.446.3-.738s-.1-.537-.3-.737l-2.8-2.8L16.3 9.175c.2-.2.296-.442.287-.725a1.031 1.031 0 0 0-.312-.725c-.2-.2-.446-.3-.737-.3-.292 0-.538.1-.738.3l-2.8 2.8L9.175 7.7a.947.947 0 0 0-.725-.288 1.035 1.035 0 0 0-.725.313c-.2.2-.3.445-.3.737s.1.538.3.738l2.8 2.8L7.7 14.825c-.2.2-.296.442-.287.725.008.283.112.525.312.725ZM12 22.2a10 10 0 0 1-3.988-.8 10.246 10.246 0 0 1-3.237-2.175A10.248 10.248 0 0 1 2.6 15.988 9.999 9.999 0 0 1 1.8 12c0-1.417.267-2.746.8-3.988a10.247 10.247 0 0 1 2.175-3.237A10.247 10.247 0 0 1 8.012 2.6 9.999 9.999 0 0 1 12 1.8c1.417 0 2.746.266 3.988.8a10.248 10.248 0 0 1 3.237 2.175A10.246 10.246 0 0 1 21.4 8.012 10 10 0 0 1 22.2 12a10 10 0 0 1-.8 3.988 10.247 10.247 0 0 1-2.175 3.237 10.247 10.247 0 0 1-3.237 2.175 10 10 0 0 1-3.988.8Z">
										</path>
									</svg>
								</button>
								<div class="searchOptionDropdown place-dropdown css-xtikso e1gvp92b4">
									<div class="css-w4v28n e14x4x9t0">
										<div class="css-1b192ew e14x4x9t1">
											<div class="css-jfnk7e e14x4x9t2">
												<div class="css-16ley3t">
													<div class="css-1kdtagv">
														<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#666d75">
															<path d="m18.875 20.475-5.55-5.55c-.5.383-1.075.692-1.725.925-.65.233-1.342.35-2.075.35-1.85 0-3.417-.646-4.7-1.938C3.542 12.97 2.9 11.4 2.9 9.55c0-1.85.642-3.421 1.925-4.713C6.108 3.546 7.675 2.9 9.525 2.9s3.421.646 4.713 1.937c1.291 1.292 1.937 2.863 1.937 4.713 0 .733-.112 1.425-.337 2.075a5.726 5.726 0 0 1-.913 1.7l5.575 5.6c.2.2.3.454.3.763 0 .308-.108.57-.325.787a1.101 1.101 0 0 1-.812.325c-.325 0-.588-.108-.788-.325ZM9.525 13.9c1.217 0 2.25-.421 3.1-1.263.85-.841 1.275-1.87 1.275-3.087s-.425-2.246-1.275-3.088c-.85-.841-1.883-1.262-3.1-1.262s-2.246.42-3.087 1.262c-.842.842-1.263 1.871-1.263 3.088s.421 2.246 1.263 3.087c.841.842 1.87 1.263 3.087 1.263Z"></path>
														</svg>
													</div>
													<input type="text" placeholder="여행지나 숙소명 검색" font-size="" width="180px" height="100%" color="" maxlength="100" class="searchInput css-l9clvw" value="">
													<input type="text" tabindex="-1" class="css-1gltdgo">
													<button class="css-dvzysq">
														<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#848c94">
															<path d="M7.725 16.275c.2.2.446.3.738.3.291 0 .537-.1.737-.3l2.8-2.8 2.825 2.825c.2.2.442.296.725.287.283-.008.525-.112.725-.312.2-.2.3-.446.3-.738s-.1-.537-.3-.737l-2.8-2.8L16.3 9.175c.2-.2.296-.442.287-.725a1.031 1.031 0 0 0-.312-.725c-.2-.2-.446-.3-.737-.3-.292 0-.538.1-.738.3l-2.8 2.8L9.175 7.7a.947.947 0 0 0-.725-.288 1.035 1.035 0 0 0-.725.313c-.2.2-.3.445-.3.737s.1.538.3.738l2.8 2.8L7.7 14.825c-.2.2-.296.442-.287.725.008.283.112.525.312.725ZM12 22.2a10 10 0 0 1-3.988-.8 10.246 10.246 0 0 1-3.237-2.175A10.248 10.248 0 0 1 2.6 15.988 9.999 9.999 0 0 1 1.8 12c0-1.417.267-2.746.8-3.988a10.247 10.247 0 0 1 2.175-3.237A10.247 10.247 0 0 1 8.012 2.6 9.999 9.999 0 0 1 12 1.8c1.417 0 2.746.266 3.988.8a10.248 10.248 0 0 1 3.237 2.175A10.246 10.246 0 0 1 21.4 8.012 10 10 0 0 1 22.2 12a10 10 0 0 1-.8 3.988 10.247 10.247 0 0 1-2.175 3.237 10.247 10.247 0 0 1-3.237 2.175 10 10 0 0 1-3.988.8Z"></path>
														</svg>
													</button>
												</div>
											</div>
										</div>
										<div class="css-14x8q74 e14x4x9t3"></div>
										<div class="css-1liu35s e14x4x9t4">
											<div>
												<div class="searchHistoryListBox">
													<span style="color: #141719;" class="suggestionsListBox_span">검색 기록</span>
													<ul id="searchHistoryList" class="searchHistoryList"></ul> <!-- 검색 기록 리스트 -->
												</div>
												<div class="suggestionsListBox" style="display: none;">
													<span style="color: #141719;" class="suggestionsListBox_span">지역</span>
													<ul id="suggestionsList" class="suggestionsList"></ul> <!-- 검색 리스트 -->
												</div>
							   				</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="interval"></div>
						
						<div class="searchDetail css-1ildg2g e5uh5nv2" data-section="date">
							<div class="css-17ujo4z e1gvp92b0">
								<div class="css-f3d94f e1gvp92b1">
									<span class="css-2x3a1r">일정</span>
									<span class="e1gvp92b3 css-1ft6oz5" id="date"></span>
									<input type="hidden" name="date" id="dateInput">
								</div>
								<button class="e1gvp92b2 css-c6rtju">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#848c94" opacity="0.5">
									<path d="M7.725 16.275c.2.2.446.3.738.3.291 0 .537-.1.737-.3l2.8-2.8 2.825 2.825c.2.2.442.296.725.287.283-.008.525-.112.725-.312.2-.2.3-.446.3-.738s-.1-.537-.3-.737l-2.8-2.8L16.3 9.175c.2-.2.296-.442.287-.725a1.031 1.031 0 0 0-.312-.725c-.2-.2-.446-.3-.737-.3-.292 0-.538.1-.738.3l-2.8 2.8L9.175 7.7a.947.947 0 0 0-.725-.288 1.035 1.035 0 0 0-.725.313c-.2.2-.3.445-.3.737s.1.538.3.738l2.8 2.8L7.7 14.825c-.2.2-.296.442-.287.725.008.283.112.525.312.725ZM12 22.2a10 10 0 0 1-3.988-.8 10.246 10.246 0 0 1-3.237-2.175A10.248 10.248 0 0 1 2.6 15.988 9.999 9.999 0 0 1 1.8 12c0-1.417.267-2.746.8-3.988a10.247 10.247 0 0 1 2.175-3.237A10.247 10.247 0 0 1 8.012 2.6 9.999 9.999 0 0 1 12 1.8c1.417 0 2.746.266 3.988.8a10.248 10.248 0 0 1 3.237 2.175A10.246 10.246 0 0 1 21.4 8.012 10 10 0 0 1 22.2 12a10 10 0 0 1-.8 3.988 10.247 10.247 0 0 1-2.175 3.237 10.247 10.247 0 0 1-3.237 2.175 10 10 0 0 1-3.988.8Z"></path>
									</svg>
								</button>
							</div>
			                <div class="searchOptionDropdown date-dropdown css-xtikso e1gvp92b4">
			                    <div class="css-106abu8 e1ilf1y50">
			                        <div class="css-1gatni9 ex9pycw0" id="datepicker"></div> <!-- datepicker ID 추가 -->
			                        <footer class="css-1tb9vmd ex9pycw1"></footer>
			                    </div>
			                </div>
			            </div>
						
						<div class="interval"></div>
						
						<div class="searchDetail css-1ildg2g e5uh5nv2" data-section="guest">
							<div class="css-1a2jpja e1gvp92b0">
								<div class="css-f3d94f e1gvp92b1">
									<span class="css-2x3a1r">숙박 인원</span>
									<span class="e1gvp92b3 css-1ft6oz5" id="guest"></span>
									<input type="hidden" name="guest" id="guestInput">							
								</div>
							</div>
							<div class="searchOptionDropdown guest-dropdown css-10xto4m e1gvp92b4">
							    <div class="css-1cqzd04 eu5in2o0">
							    	<div class="css-1gsby4v e1yfxc220">
								        <span class="css-dnoo08">성인</span>
								        <div class="dropdownNumber_choice css-168726t e1m0rpur0">
								            <button class="dropdownNumber_choice_button decrease e1m0rpur3 css-1ggc46y">
								                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#343a40">
								                    <path d="M6 13.15c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 4.85 12c0-.317.113-.587.338-.812.225-.225.495-.338.812-.338h12c.317 0 .587.113.812.338.225.225.338.495.338.812 0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338H6Z"></path>
								                </svg>
								            </button>
								            <div class="dropdownNumber_choice_num css-gbwm4o e1m0rpur1">
								                <span class="dropdownNumber_choice_num_span e1m0rpur2 css-1szxsih">0</span>
								            </div>
								            <button class="dropdownNumber_choice_button increase e1m0rpur3 css-1ggc46y">
								                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#343a40">
								                    <path d="M12 19.15c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 10.85 18v-4.85H6c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 4.85 12c0-.317.113-.587.338-.812.225-.225.495-.338.812-.338h4.85V6c0-.317.113-.588.338-.813.225-.225.495-.337.812-.337.317 0 .587.112.812.337.225.225.338.496.338.813v4.85H18c.317 0 .587.113.812.338.225.225.338.495.338.812 0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338h-4.85V18c0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338Z"></path>
								                </svg>
								            </button>
								        </div>
								     </div>   
							    </div>
							</div>
						</div>
						
						<div class="search css-2jgs3g e5uh5nv1">
							<button shape="pill" class="searchBtn css-ry0chm" disabled>
								<div class="searchBtn_div css-oss1kg">
									<span class="searchBtn_span css-spn791">숙소 검색</span>
								</div>
							</button>
						</div>
												
					</div>
				</div>
<!-- 			숙소 사진                 -->
				<div class="css-79elbk e18lo67g1">
					<div class="css-1futtae e9nb2z70">
						<div class="css-l5ala0 e9nb2z71">
<!-- 						호텔  사진 리스트 -->
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
<!-- 					Modal -->
						<div class="modal fade e9nb2z74 css-17nco2d" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
							<section class="css-ku40o1">
								<p class="css-nfpvp8">${hotel.name}</p>
							</section>
							<div class="css-1a5bpe6 css-1axgspo modal-body">
								<div class="css-1fuarqg">
									<div class="swiper-container gallery-top css-1m9bh34 swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
<!-- 									호텔 안의 사진 모음 -->
										<div class="swiper-wrapper css-en91p7" style="transform: translate3d(0px, 0px, 0px);">
				                            <c:forEach var="imagePath" items="${imagePaths}">
				                                <div class="swiper-slide" style="width: 744px; margin-right: 10px;">
				                                    <img src="${pageContext.request.contextPath}/images/hotel/${imagePath}" alt="slide">
				                                </div>
				                            </c:forEach>											
										</div>
<!-- 									Next 버튼 -->
										<div class="swiper-button-next css-r1fteo">
											<img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_narrowarrowright_xl_white.svg" class="css-s08p0c">											
										</div>
<!-- 									Prev 버튼 -->												
										<div class="swiper-button-prev css-r1fteo">
											<img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_narrowarrowleft_xl_white.svg" class="css-s08p0c">
										</div>
									</div>	
									
<!-- 								모달 페이징	 -->
									<div class="swiper-pagination css-48091o swiper-pagination-fraction">
										<span class="swiper-pagination-current">1</span>
										 / 
										<span class="swiper-pagination-total">${imagePaths.size()}</span>
									</div>
<!-- 								전체 사진 -->
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
		
				<c:set var="hotelInfo" value="${hotelPriceMap[hotel.hotel_idx]}" />
				<c:set var="lowestPrice" value="${hotelInfo.LOWEST_PRICE}" />
				<c:set var="discountRate" value="${hotelInfo.DISCOUNT_RATE}" />
				<c:set var="discountAmount" value="${hotelInfo.DISCOUNT_AMOUNT}" />
				
				<c:choose>
				    <c:when test="${discountRate > 0}">
				        <c:set var="discountedPrice" value="${lowestPrice - (lowestPrice * discountRate / 100)}" />
				    </c:when>
				    <c:otherwise>
				        <c:set var="discountedPrice" value="${lowestPrice - discountAmount}" />
				    </c:otherwise>
				</c:choose>
				
				<c:set var="formattedLowestPrice">
				    <fmt:formatNumber value="${lowestPrice}" type="number" pattern="#,###"/>
				</c:set>
				<c:set var="formattedDiscountedPrice">
				    <fmt:formatNumber value="${discountedPrice}" type="number" pattern="#,###"/>
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
											<span class="mr-half-1 css-1kjy5hl" style="color: rgb(250, 91, 74);">${formattedDiscountedPrice}원</span>
										
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
								
								<c:set var="hotelInfo" value="${hotelPriceMap[hotel.hotel_idx]}" />
								<c:set var="lowestPrice" value="${hotelInfo.LOWEST_PRICE}" />
								<c:set var="discountRate" value="${hotelInfo.DISCOUNT_RATE}" />
								<c:set var="discountAmount" value="${hotelInfo.DISCOUNT_AMOUNT}" />
								<c:set var="price" value="${room.price}" />
								
								<c:choose>
								    <c:when test="${discountRate > 0}">
								        <c:set var="discountedPrice" value="${price - (price * discountRate / 100)}" />
								    </c:when>
								    <c:otherwise>
								        <c:set var="discountedPrice" value="${lowestPrice - discountAmount}" />
								    </c:otherwise>
								</c:choose>
								
								<c:set var="formattedLowestPrice">
								    <fmt:formatNumber value="${lowestPrice}" type="number" pattern="#,###"/>
								</c:set>
								<c:set var="formattedDiscountedPrice">
								    <fmt:formatNumber value="${discountedPrice}" type="number" pattern="#,###"/>
								</c:set>
								<c:set var="formattedPrice">
								    <fmt:formatNumber value="${price}" type="number" pattern="#,###"/>
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
<!-- 													<div class="css-0 e10uix0a0"> -->
<!-- 														<button class="e10uix0a1 css-19kbtvr"> -->
<!-- 															<span class="css-17cznx6">객실 정보 더보기</span> -->
<!-- 														</button> -->
<!-- 													</div> -->
												</div>
											</div>
										</div>
										<div class="css-e6t236 ekdnpbz4">
											<div class="css-1xdhyk6">
												<div class="css-1txr52u e1q9d9300">
													<div class="css-1ni1io2 e1q9d9301">
														<div class="css-j7qwjs e17p53lv0">
															<div class="css-i7tjzy e17p53lv2">
<!-- 																<div class="css-159hdns e61jlzk0"> -->
<!-- 																	<div class="css-v71nea e61jlzk1"> -->
<!-- 																		<img alt="예약 무료 취소 가능 (2024년 7월 4일 00:00까지)" loading="lazy" width="14" height="14" decoding="async" data-nimg="1" style="color:transparent" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_verified_option_attribute_3x.png"> -->
<!-- 																	</div> -->
<!-- 																	<div class="css-70qvj9 e61jlzk2"> -->
<!-- 																		<span style="color:#1C9674" class="css-bgkldf">예약 무료 취소 가능 (2024년 7월 4일 00:00까지)</span> -->
<!-- 																	</div> -->
<!-- 																</div> -->
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
																<div class="css-fjt9ki e16iha2r1">
																	<span class="css-pglvi5 e16iha2r3">할인가</span>
																	<span class="css-1e8aui5 e16iha2r4">${formattedPrice}원/박</span>
																</div>
																<div class="css-114g9yd e16iha2r5">
																	<div class="css-12dy4dz e16iha2r2">
																		<span class="css-1bg0z7j e16iha2r6">${formattedDiscountedPrice}원/박</span>
<!-- 																		<img height="13" src="https://dffoxz5he03rp.cloudfront.net/icons/zero_margin_3x.png" alt="뱃지"> -->
																	</div>
																</div>
																<div class="css-12dy4dz e16iha2r2">
																	<div class="css-w9c0d8 e16iha2r7">
																		<span class="css-1njnize e16iha2r8">세금 및 수수료 포함</span>
																	</div>
																</div>
<!-- 																<button type="button" class="e16iha2r9 css-xekm6i"> -->
<!-- 																	<span class="css-17cznx6">할인 상세 보기</span> -->
<!-- 																</button> -->
															</div>
														</div>
														
														<div class="css-me3ito e1q9d9304">
															<input type="hidden" name="hotel_idx" value="${hotel.hotel_idx}" class="hotel-idx">
															<a href="/Accommodation/RoomOrder/${room.room_idx}?id=1" class="roomBtn e14snjrl0 css-m0pn6q reserve-btn" data-room-id="${room.room_idx}">
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
		// 주소창에서 값 넘어왔을 때
		const params = new URLSearchParams(window.location.search);
		const place = params.get('place');
		const date = params.get('date');
		const guest = params.get('guest');
		
		// URL에서 hotel_idx 추출
	    const pathArray = window.location.pathname.split('/');
	    const hotel_idx = pathArray[pathArray.length - 1]; // URL 마지막 부분이 hotel_idx
		
		// dropdown 활성화
		const placeDropdown = document.querySelector('.place-dropdown');
		const dateDropdown = document.querySelector('.date-dropdown');
		const guestDropdown = document.querySelector('.guest-dropdown');
	    const changeDateButton = document.getElementById('changeDateButton');
	    const changeDateDropdown = document.querySelector('.changeDate-dropdown');
		
		// place 관련 함수
		const searchInput = document.querySelector('.searchInput');
		const searchHistoryListBox = document.querySelector('.searchHistoryListBox');
		const searchHistoryList = document.getElementById('searchHistoryList');
		const suggestionsListBox = document.querySelector('.suggestionsListBox');
		const suggestionsList = document.getElementById('suggestionsList');

		// date 관련 함수
		const dateDetails = document.querySelector('[data-section="date"] #date');
		const dateDetailsChange = document.querySelector('.css-jfzxc5');
		let checkInSelected = false;
		let checkInDate = null;
		let checkOutDate = null;
		
		//guest 관련 함수
		const guestSpan = document.querySelector('#guest'); 
		const decreaseButton = document.querySelector('.dropdownNumber_choice_button.decrease');
		const increaseButton = document.querySelector('.dropdownNumber_choice_button.increase');
		const numSpan = document.querySelector('.dropdownNumber_choice_num_span');
		
		// 숙소 검색 관련 함수
		const searchButton = document.querySelector('.searchBtn');
		const placeInput = document.getElementById('placeInput');
		const dateInput = document.getElementById('dateInput');
		const guestInput = document.getElementById('guestInput');
		
		// dropdown 관련
		const placeElements = document.querySelectorAll('.e1gvp92b0')
		
		function setValuesFromParams() {
			if (place) {
				document.getElementById('place').textContent = place;
				placeInput.value = place;
			}
	
			if (date) {
				document.getElementById('date').textContent = date;
				dateInput.value = date;
				dateDetailsChange.textContent = date;
			}
	
			if (guest) {
				document.getElementById('guest').textContent = '성인 ' + guest + '명';
				guestInput.value = guest;
			}
	
			checkAllInputs();
		}
		
		// 페이지 로드 시 URL 파라미터 값 설정
		setValuesFromParams();
		
		// URL 파라미터를 유지한 채로 페이지 로드 시 값을 채워줌
		window.addEventListener('popstate', setValuesFromParams);
		
		function checkAllInputs() {
			const placeText = document.querySelector('[data-section="place"] #place').textContent.trim();
			const dateText = document.querySelector('[data-section="date"] #date').textContent.trim();
			const guestText = document.querySelector('[data-section="guest"] #guest').textContent.trim();

			if (placeText !== "여행지나 숙소명 검색" && dateText !== "언제 떠나시나요?" && guestText !== "성인 0명") {
				searchButton.disabled = false;
				searchButton.style.backgroundColor = 'black'; // 배경색을 검은색으로 변경
				searchButton.style.color = 'white'; // 배경색을 검은색으로 변경
			} else {
				searchButton.disabled = true;
				searchButton.style.backgroundColor = ''; // 기본 배경색으로 변경
			}
		}		
		
		// 드롭다운 토글 설정
		document.querySelector('[data-section="place"] .e1gvp92b1').addEventListener('click', function() {  
			if (!placeDropdown.classList.contains('show')) {
				dateDropdown.classList.remove('show');
				guestDropdown.classList.remove('show');
			}
			placeDropdown.classList.toggle('show');
		});	

		document.querySelector('[data-section="date"] .e1gvp92b1').addEventListener('click', function() {
			if (!dateDropdown.classList.contains('show')) {
				placeDropdown.classList.remove('show');
				guestDropdown.classList.remove('show');
			}
			dateDropdown.classList.toggle('show');
		});

		document.querySelector('[data-section="guest"] .e1gvp92b1').addEventListener('click', function() {
			if (!guestDropdown.classList.contains('show')) {
				placeDropdown.classList.remove('show');
				dateDropdown.classList.remove('show');
			}
			guestDropdown.classList.toggle('show');
		});
		
	    changeDateButton.addEventListener('click', function() {
	        changeDateDropdown.style.display = changeDateDropdown.style.display === 'none' ? 'block' : 'none';
	    });
		
		// place 관련 로직
		loadSearchHistory();
		
		searchInput.addEventListener('focus', function() {
			placeDropdown.classList.add('show');
			searchHistoryListBox.style.display = 'block';
			suggestionsListBox.style.display = 'none';
		});
		
		searchInput.addEventListener('input', function() {
			const query = searchInput.value;
			if (query.length > 0) {
				// 검색 기록 숨기기
				searchHistoryListBox.style.display = 'none';
				// 검색 제안 표시
				suggestionsListBox.style.display = 'block';

				fetch('/AccommodationApi/Search', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify({ query: query })
				})
					.then(response => {
						if (!response.ok) {
							throw new Error('Network response was not ok ' + response.statusText);
						}
						return response.json();
					})
					.then(data => {
						console.log('Fetched Data:', data); // 데이터 확인을 위한 콘솔 로그
						suggestionsList.innerHTML = '';
						data.forEach(item => {
						const li = document.createElement('li');
						let innerHTML = '<div class="suggestion-item">' +
						'<span class="suggestion-item-text">' + item.name + '</span>';

						if (item.address1) {
							innerHTML += '<span class="suggestion-item-text">' + item.address1 + '</span>';
						}
					
						if (item.address2) {
							innerHTML += '<span class="suggestion-item-text">' + item.address2 + '</span>';
						}
					
						innerHTML += '</div>';
						li.innerHTML = innerHTML;
						
						li.querySelector('.suggestion-item-text').addEventListener('click', function() {
							const selectedElement = document.querySelector('[data-section="place"] #place');
							
							if (selectedElement) {
								selectedElement.textContent = item.name;
								placeInput.value = item.name;
							}
							
							// 검색 기록에 추가
							addSearchHistory(item.name);
							// suggestionsList 비우기
							suggestionsList.innerHTML = '';
							// 검색 제안 숨기기
							suggestionsListBox.style.display = 'none';
							// 검색 기록 표시
							searchHistoryListBox.style.display = 'block';
							
							checkAllInputs();
						});    
						suggestionsList.appendChild(li);
					});
				})
				.catch(error => {
					console.log('Error: ', error);
				});
			} else {
				suggestionsList.innerHTML = '';
				// 검색 제안 숨기기
				suggestionsListBox.style.display = 'none';
				// 검색 기록 표시
				searchHistoryListBox.style.display = 'block';
			}
		});
		
		function loadSearchHistory() {
			const history = JSON.parse(localStorage.getItem('searchHistory')) || [];
			searchHistoryList.innerHTML = '';
			history.forEach(query => {
				const li = document.createElement('li');
				li.innerHTML = 
					'<div class="search-history-item">' +
					'<span class="search-history-item-text">' + query + '</span>' +
					'<span class="search-history-item-delete">삭제</span>' +
					'</div>';
				li.querySelector('.search-history-item-text').addEventListener('click', function() {
					 searchInput.value = query;
					 const parentDetails = searchInput.closest('.searchDetail');
					 const selectedElement = parentDetails.querySelector('#place');
					 if (selectedElement) {
						 selectedElement.textContent = query;
						 placeInput.value = query;
					 }
					 checkAllInputs();
				});
				
				li.querySelector('.search-history-item-delete').addEventListener('click', function() {
					removeSearchHistory(query);
				});
				searchHistoryList.appendChild(li);
			});
			
			// 검색 기록이 비어 있지 않으면 표시
			if (history.length > 0) {
				searchHistoryListBox.style.display = 'block';
			} else {
				searchHistoryListBox.style.display = 'none';
			}
		}
		
		function addSearchHistory(query) {
			let history = JSON.parse(localStorage.getItem('searchHistory')) || [];
			history = history.filter(item => item !== query); // 중복 제거
			history.unshift(query); // 최신 검색어를 맨 앞에 추가
			if (history.length > 20) { // 검색기록 20개 제한
				history.pop();
			}
			localStorage.setItem('searchHistory', JSON.stringify(history));
			loadSearchHistory();
		}

		function removeSearchHistory(query) {
			let history = JSON.parse(localStorage.getItem('searchHistory')) || [];
			history = history.filter(item => item !== query);
			localStorage.setItem('searchHistory', JSON.stringify(history));
			loadSearchHistory();
		}

		function loadSearchHistory() {
			const history = JSON.parse(localStorage.getItem('searchHistory')) || [];
			searchHistoryList.innerHTML = '';
			history.forEach(query => {
				const li = document.createElement('li');
				li.innerHTML = 
					'<div class="search-history-item">' +
					'<span class="search-history-item-text">' + query + '</span>' +
					'<span class="search-history-item-delete">삭제</span>' +
					'</div>';
				li.querySelector('.search-history-item-text').addEventListener('click', function() {
					 searchInput.value = query;
					 const parentDetails = searchInput.closest('.searchDetail');
					 const selectedElement = parentDetails.querySelector('#place');
					 if (selectedElement) {
						 selectedElement.textContent = query;
						 placeInput.value = query;
					 }
					 checkAllInputs();
				});
				
				li.querySelector('.search-history-item-delete').addEventListener('click', function() {
					removeSearchHistory(query);
				});
				searchHistoryList.appendChild(li);
			});
			
			// 검색 기록이 비어 있지 않으면 표시
			if (history.length > 0) {
				searchHistoryListBox.style.display = 'block';
			} else {
				searchHistoryListBox.style.display = 'none';
			}
		}
		
		function addSearchHistory(query) {
			let history = JSON.parse(localStorage.getItem('searchHistory')) || [];
			history = history.filter(item => item !== query); // 중복 제거
			history.unshift(query); // 최신 검색어를 맨 앞에 추가
			if (history.length > 20) { // 검색기록 20개 제한
				history.pop();
			}
			localStorage.setItem('searchHistory', JSON.stringify(history));
			loadSearchHistory();
		}

		function removeSearchHistory(query) {
			let history = JSON.parse(localStorage.getItem('searchHistory')) || [];
			history = history.filter(item => item !== query);
			localStorage.setItem('searchHistory', JSON.stringify(history));
			loadSearchHistory();
		}
		
		// date 관련 스크립트
		const datepicker = $("#datepicker");
	    const datepicker2 = $("#datepicker2");
	    
		function formatDateString(dateStr) {
			const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
			const dateObj = new Date(dateStr);
			const month = dateObj.getMonth() + 1;
			const day = dateObj.getDate();
			const dayOfWeek = daysOfWeek[dateObj.getDay()];
			return month + "월 " + day + "일(" + dayOfWeek + ")";
		}
		
	    function synchronizeDateDetails(dateStr) {
	        const formattedDate = formatDateString(dateStr);
	        if (!checkInSelected) {
	            dateDetails.textContent = "입실: " + formattedDate;
	            dateDetailsChange.textContent = "입실: " + formattedDate;
	        } else {
	            const formattedCheckInDate = formatDateString(checkInDate);
	            dateDetails.textContent = formattedCheckInDate + "~" + formattedDate;
	            dateDetailsChange.textContent = formattedCheckInDate + "~" + formattedDate;
	        }
	    }
		
	    function initializeDatepicker(datepicker, dateDetailsElement) {
	        datepicker.datepicker({
	            onSelect: function(dateText) {
	                if (!checkInSelected) {
	                    checkInDate = dateText;
	                    synchronizeDateDetails(checkInDate);
	                    checkInSelected = true;
	                    datepicker.datepicker('option', 'minDate', dateText);
	                } else {
	                    checkOutDate = dateText;
	                    synchronizeDateDetails(checkOutDate);
	                    checkInSelected = false;
	                    datepicker.datepicker('option', 'minDate', null);
	                    
	                    // 확인 창 표시
	                    if (confirm("변경하시겠습니까?")) {
	                        changeDateDropdown.style.display = 'none';
	                        // 방을 다시 검색하는 로직 추가
// 	                        searchRooms();
	                    } else {
	                        // 취소 시 초기화
	                        checkInDate = null;
	                        checkOutDate = null;
	                        dateDetailsElement.textContent = "언제 떠나시나요?";
	                        dateDetailsChange.textContent = "언제 떠나시나요?";
	                        dateInput.value = "";
	                    }
	                }
	                dateInput.value = dateDetailsElement.textContent;
	                checkAllInputs();
	            },
	            dateFormat: "yy-mm-dd"
	        });
	    }

	    initializeDatepicker(datepicker, dateDetails);
	    initializeDatepicker(datepicker2, dateDetailsChange);
	    
		// "인원" 항목 클릭 이벤트

		// guest 값 설정
		if (guest) {
			const guestSpan = document.querySelector('.dropdownNumber_choice_num_span');
			guestSpan.textContent = guest;
		}
		
		function updatePersonnelCount(newCount) {
			numSpan.textContent = newCount;
			guestSpan.textContent = '성인 ' + newCount + '명';
			guestInput.value = newCount;
			checkAllInputs();
		}
		
		decreaseButton.addEventListener('click', function(){
			event.preventDefault();  // 기본 동작 방지
			let currentValue = parseInt(numSpan.textContent);
			if (currentValue > 0) { // 최소값 설정
				updatePersonnelCount(currentValue - 1);
			}
		});
		
		increaseButton.addEventListener('click', function () {
			event.preventDefault();  // 기본 동작 방지
			let currentValue = parseInt(numSpan.textContent);
			updatePersonnelCount(currentValue + 1);
		});
		
		// "숙소 검색" 항목 클릭 이벤트
		searchButton.addEventListener('click', function () {
			if (!searchButton.disabled) {
				const place = placeInput.value;
				const date = dateInput ? dateInput.value : ''; // Date input이 없을 경우 빈 문자열
				const guest = guestInput ? guestInput.value : ''; // Guest input이 없을 경우 빈 문자열
				const queryString = '?place=' + encodeURIComponent(place) + 
									'&date=' + encodeURIComponent(date) + 
									'&guest=' + encodeURIComponent(guest);
				window.location.href = '/Accommodation/Products' + queryString; // '/nextPage'를 실제 이동할 URL로 변경
			}
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
