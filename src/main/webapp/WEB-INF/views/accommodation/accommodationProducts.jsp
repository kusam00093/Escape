<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escape</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/accommodationProducts.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<%@include file="/WEB-INF/include/header.jsp"%>

<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
	<main class="mainCss">
		<div class="mainCss_div">
			<div class="mainCss_div_div">
				<div class="searchDetails">
				
					<div class="searchDetail" data-section="place">
						<div class="searchDetail_div1">
							<div class="searchDetail_endDiv">
								<span class="endDiv_span1">여행지</span>
								<span class="endDiv_span2">강남</span> <!-- 여기 수정 -->
							</div>
							<button class="endDiv_button">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#848c94" opacity="0.5">
									<path d="M7.725 16.275c.2.2.446.3.738.3.291 0 .537-.1.737-.3l2.8-2.8 2.825 2.825c.2.2.442.296.725.287.283-.008.525-.112.725-.312.2-.2.3-.446.3-.738s-.1-.537-.3-.737l-2.8-2.8L16.3 9.175c.2-.2.296-.442.287-.725a1.031 1.031 0 0 0-.312-.725c-.2-.2-.446-.3-.737-.3-.292 0-.538.1-.738.3l-2.8 2.8L9.175 7.7a.947.947 0 0 0-.725-.288 1.035 1.035 0 0 0-.725.313c-.2.2-.3.445-.3.737s.1.538.3.738l2.8 2.8L7.7 14.825c-.2.2-.296.442-.287.725.008.283.112.525.312.725ZM12 22.2a10 10 0 0 1-3.988-.8 10.246 10.246 0 0 1-3.237-2.175A10.248 10.248 0 0 1 2.6 15.988 9.999 9.999 0 0 1 1.8 12c0-1.417.267-2.746.8-3.988a10.247 10.247 0 0 1 2.175-3.237A10.247 10.247 0 0 1 8.012 2.6 9.999 9.999 0 0 1 12 1.8c1.417 0 2.746.266 3.988.8a10.248 10.248 0 0 1 3.237 2.175A10.246 10.246 0 0 1 21.4 8.012 10 10 0 0 1 22.2 12a10 10 0 0 1-.8 3.988 10.247 10.247 0 0 1-2.175 3.237 10.247 10.247 0 0 1-3.237 2.175 10 10 0 0 1-3.988.8Z">
									</path>
								</svg>
							</button>
						</div>
					</div>
					
					<div class="interval"></div>
					
					<div class="searchDetail" data-section="date">
						<div class="searchDetail_div1">
							<div class="searchDetail_endDiv">
								<span class="endDiv_span1">일정</span>
								<span class="endDiv_span2">06월 18일 (화)~06월 19일 (수)</span> <!-- 여기 수정 -->
							</div>
							<button class="endDiv_button">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#848c94" opacity="0.5">
									<path d="M7.725 16.275c.2.2.446.3.738.3.291 0 .537-.1.737-.3l2.8-2.8 2.825 2.825c.2.2.442.296.725.287.283-.008.525-.112.725-.312.2-.2.3-.446.3-.738s-.1-.537-.3-.737l-2.8-2.8L16.3 9.175c.2-.2.296-.442.287-.725a1.031 1.031 0 0 0-.312-.725c-.2-.2-.446-.3-.737-.3-.292 0-.538.1-.738.3l-2.8 2.8L9.175 7.7a.947.947 0 0 0-.725-.288 1.035 1.035 0 0 0-.725.313c-.2.2-.3.445-.3.737s.1.538.3.738l2.8 2.8L7.7 14.825c-.2.2-.296.442-.287.725.008.283.112.525.312.725ZM12 22.2a10 10 0 0 1-3.988-.8 10.246 10.246 0 0 1-3.237-2.175A10.248 10.248 0 0 1 2.6 15.988 9.999 9.999 0 0 1 1.8 12c0-1.417.267-2.746.8-3.988a10.247 10.247 0 0 1 2.175-3.237A10.247 10.247 0 0 1 8.012 2.6 9.999 9.999 0 0 1 12 1.8c1.417 0 2.746.266 3.988.8a10.248 10.248 0 0 1 3.237 2.175A10.246 10.246 0 0 1 21.4 8.012 10 10 0 0 1 22.2 12a10 10 0 0 1-.8 3.988 10.247 10.247 0 0 1-2.175 3.237 10.247 10.247 0 0 1-3.237 2.175 10 10 0 0 1-3.988.8Z">
									</path>
								</svg>
							</button>
						</div>
					</div>
					
					<div class="interval"></div>
					
					<div class="searchDetail" data-section="guest">
						<div class="searchDetail_div1">
							<div class="searchDetail_endDiv">
								<span class="endDiv_span1">숙박 인원</span>
								<span class="endDiv_span2">성인 5명</span> <!-- 여기 수정 -->
							</div>
						</div>
					</div>
					
					<div class="search">
						<button shape="pill" class="searchBtn">
							<div class="searchBtn_div">
								<span class="searchBtn_span">숙소 검색</span>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="mainBody">
			<div aria-label="검색 조건 영역" class="mainBody_aside">
				<aside class="mainBody_aside_filter">
					<div class="filter_bigBox">
						<div class="filter_bigBox_details1">
							<h4 class="filter_bigBox_details1_h4">가격</h4>
							<p class="filter_bigBox_details1_p">1박 기준 요금</p>
						</div>
						<div role="group" class="filter_bigBox_details2">
							<div class="filter_bigBox_details2_div1">
								<span class="filter_bigBox_details2_div1_span">
									<div class="filter_bigBox_details2_div1_span_1">
										"0"
										"원"
									</div>
									<div class="filter_bigBox_details2_div1_span_1"> - </div>
									<div class="filter_bigBox_details2_div1_span_1">
										"500,000"
										"원"
										"+"
									</div>
								</span>
							</div>
							<div class="css-rbducp" type="normal">
								<div class="rc-slider">
									<div class="rc-slider-rail"></div>
									<div class="rc-slider-track rc-slider-track-1" style="left: 0%;width: 100%;"></div>
									<div class="rc-slider-step"></div>
									<div class="rc-slider-handle rc-slider-handle-1" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="0" aria-disabled="false" aria-orientation="horizontal" style="left: 0%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div>
									<div class="rc-slider-handle rc-slider-handle-2" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="50" aria-disabled="false" aria-orientation="horizontal" style="left: 100%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div>
								</div>
							</div>
							<div class="filter_bigBox_details2_div3">
								<span class="filter_bigBox_details2_div3_span">
									"0"
									"원"
								</span>
								<span class="filter_bigBox_details2_div3_span">
									"500,000"
									"원+"
								</span>
							</div>
						</div>
					</div>
					<hr class="my-half-3 CSS-HR" tpye="LINE_80_10">
					
					<div class="filter_bigBox">
						<div class="filter_bigBox_details1">
							<h4 class="filter_bigBox_details1_h4">가격</h4>
							<p class="filter_bigBox_details1_p">1박 기준 요금</p>
						</div>
						<div role="group" class="filter_bigBox_details2">
							<div class="filter_bigBox_details2_div1">
								<span class="filter_bigBox_details2_div1_span">
									<div class="filter_bigBox_details2_div1_span_1">
										"0"
										"원"
									</div>
									<div class="filter_bigBox_details2_div1_span_1"> - </div>
									<div class="filter_bigBox_details2_div1_span_1">
										"500,000"
										"원"
										"+"
									</div>
								</span>
							</div>
							<div class="css-rbducp" type="normal">
								<div class="rc-slider">
									<div class="rc-slider-rail"></div>
									<div class="rc-slider-track rc-slider-track-1" style="left: 0%;width: 100%;"></div>
									<div class="rc-slider-step"></div>
									<div class="rc-slider-handle rc-slider-handle-1" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="0" aria-disabled="false" aria-orientation="horizontal" style="left: 0%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div>
									<div class="rc-slider-handle rc-slider-handle-2" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="50" aria-disabled="false" aria-orientation="horizontal" style="left: 100%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div>
								</div>
							</div>
							<div class="filter_bigBox_details2_div3">
								<span class="filter_bigBox_details2_div3_span">
									"0"
									"원"
								</span>
								<span class="filter_bigBox_details2_div3_span">
									"500,000"
									"원+"
								</span>
							</div>
						</div>
					</div>
					<hr class="my-half-3 CSS-HR" tpye="LINE_80_10">
					
					<div class="filter_bigBox">
						<div class="filter_bigBox_details1">
							<h4 class="filter_bigBox_details1_h4">가격</h4>
							<p class="filter_bigBox_details1_p">1박 기준 요금</p>
						</div>
						<div role="group" class="filter_bigBox_details2">
							<div class="filter_bigBox_details2_div1">
								<span class="filter_bigBox_details2_div1_span">
									<div class="filter_bigBox_details2_div1_span_1">
										"0"
										"원"
									</div>
									<div class="filter_bigBox_details2_div1_span_1"> - </div>
									<div class="filter_bigBox_details2_div1_span_1">
										"500,000"
										"원"
										"+"
									</div>
								</span>
							</div>
							<div class="css-rbducp" type="normal">
								<div class="rc-slider">
									<div class="rc-slider-rail"></div>
									<div class="rc-slider-track rc-slider-track-1" style="left: 0%;width: 100%;"></div>
									<div class="rc-slider-step"></div>
									<div class="rc-slider-handle rc-slider-handle-1" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="0" aria-disabled="false" aria-orientation="horizontal" style="left: 0%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div>
									<div class="rc-slider-handle rc-slider-handle-2" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="50" aria-disabled="false" aria-orientation="horizontal" style="left: 100%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div>
								</div>
							</div>
							<div class="filter_bigBox_details2_div3">
								<span class="filter_bigBox_details2_div3_span">
									"0"
									"원"
								</span>
								<span class="filter_bigBox_details2_div3_span">
									"500,000"
									"원+"
								</span>
							</div>
						</div>
					</div>
					<hr class="my-half-3 CSS-HR" tpye="LINE_80_10">
					
					<button shape="pill" class=""></button>
				</aside>
			</div>
			<section aria-label="상품 리스트 영역"></section>
		</div>
	</main>
</body>

</html>