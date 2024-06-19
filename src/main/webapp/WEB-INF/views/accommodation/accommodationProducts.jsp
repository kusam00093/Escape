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
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/accommodationProducts.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css" />
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
	<main class="mainCss">
		<div class="mainCss_div">
			<div class="mainCss_div_div">
				<div class="searchDetails">
				
					<div class="searchDetail" data-section="place">
						<div class="searchDetail_div1">
							<div class="searchDetail_endDiv">
								<span class="endDiv_span1">여행지</span>
								<span class="endDiv_span2" id="place"></span>
								<input type="hidden" name="place" id="placeInput">
							</div>
							<button class="endDiv_button">
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
					
					<div class="searchDetail date-dropdown_top" data-section="date">
						<div class="searchDetail_div1">
							<div class="searchDetail_endDiv">
								<div class="searchDetail_endDiv_endDiv">
									<span class="endDiv_span1">일정</span>
									<span class="endDiv_span2" id="date"></span>
									<input type="hidden" name="date" id="dateInput">
								</div>
							</div>
						</div>
		                <div class="searchOptionDropdown date-dropdown css-xtikso e1gvp92b4">
		                    <div class="dropdownDate_div1">
		                        <div class="dropdownDate_div1_div1" id="datepicker"></div> <!-- datepicker ID 추가 -->
		                        <footer class="dropdownDate_div1_footer1"></footer>
		                    </div>
		                </div>
		            </div>
					
					<div class="interval"></div>
					
					<div class="searchDetail guest-dropdown_top" data-section="guest">
						<div class="searchDetail_div1">
							<div class="searchDetail_endDiv">
								<span class="endDiv_span1">숙박 인원</span>
								<span class="endDiv_span2" id="guest"></span>
								<input type="hidden" name="guest" id="guestInput">							
							</div>
						</div>
						<div class="searchOptionDropdown guest-dropdown css-xtikso e1gvp92b4">
						    <div class="dropdownNumber_div2_adult">
						        <span class="dropdownNumber_div2_adult_text">성인</span>
						        <div class="dropdownNumber_choice">
						            <button class="dropdownNumber_choice_button decrease">
						                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#343a40">
						                    <path d="M6 13.15c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 4.85 12c0-.317.113-.587.338-.812.225-.225.495-.338.812-.338h12c.317 0 .587.113.812.338.225.225.338.495.338.812 0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338H6Z"></path>
						                </svg>
						            </button>
						            <div class="dropdownNumber_choice_num">
						                <span class="dropdownNumber_choice_num_span">0</span>
						            </div>
						            <button class="dropdownNumber_choice_button increase">
						                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#343a40">
						                    <path d="M12 19.15c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 10.85 18v-4.85H6c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 4.85 12c0-.317.113-.587.338-.812.225-.225.495-.338.812-.338h4.85V6c0-.317.113-.588.338-.813.225-.225.495-.337.812-.337.317 0 .587.112.812.337.225.225.338.496.338.813v4.85H18c.317 0 .587.113.812.338.225.225.338.495.338.812 0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338h-4.85V18c0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338Z"></path>
						                </svg>
						            </button>
						        </div>
						    </div>
						</div>
					</div>
					
					<div class="search">
						<button shape="pill" class="searchBtn" disabled>
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
				
<!-- 					첫번째 사이드 -->
					<div class="css-j7qwjs e1kcc1jp0">
						<div class="css-v8ozzb e1kcc1jp1">
							<h4 class="css-1bjjy4l">가격</h4>
							<p class="e1kcc1jp2 css-j950kd">1박 기준 요금</p>
						</div>
						<div role="group" class="css-j7qwjs e13b3vlo1">
							<div class="css-z7rvuf e13b3vlo2">
								<span class="e13b3vlo3 css-sh29wd">
									<div id="min-amount" class=" css-nlfzjl e13b3vlo0">0원</div>
									<div class="css-nlfzjl e13b3vlo0"> - </div>
									<div id="max-amount" class="css-nlfzjl e13b3vlo0">500,000원+</div>
								</span>
								<span class="e13b3vlo4 css-vozulf">1박 기준 요금</span>
							</div>
							<div type="normal" width="100%" class="css-rbducp">
								<div id="slider" class="rc-slider css-1m75xr0 e13b3vlo7 rc-slider-horizontal">
<!-- 									<div class="rc-slider-rail"></div> -->
<!-- 									<div class="rc-slider-track rc-slider-track-1" style="left: 0%; width: 100%;"></div> -->
<!-- 									<div class="rc-slider-step"></div> -->
<!-- 									<div class="rc-slider-handle rc-slider-handle-1" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="0" aria-disabled="false" aria-orientation="horizontal" style="left: 0%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div> -->
<!-- 									<div class="rc-slider-handle rc-slider-handle-2" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="50" aria-disabled="false" aria-orientation="horizontal" style="left: 100%; transform: translate(-50%, -50%); top: 50%; bottom: 0px; margin-top: 0px;"></div> -->
								</div>
							</div>
							<div class="css-1747m2c e13b3vlo5">
								<span class="e13b3vlo6 css-s1r6nn">0원</span>
								<span class="e13b3vlo6 css-s1r6nn">500,000원+</span>
							</div>
						</div>
					</div>
					<hr class="my-half-3 CSS-HR" tpye="LINE_80_10">
					
<!-- 					두번째 사이드 -->
					<div class="filter_bigBox">
						<div class="filter_bigBox_details1">
							<h4 class="css-1bjjy4l">호텔 성급</h4>
							<p class="e1kcc1jp2 css-j950kd"></p>
						</div>
						<div role="checkbox" class="css-ls5l09 e1iur2ag0">
						
							<label class="css-1dkg27r css-19bfog6" for="1성급 이하">
								<div class="css-1ert3cq">
									<div class="css-1xxrznb">
										<input id="1성급 이하" type="checkbox" multiple="" name="radio" class="css-12a4kog" value="onestar">
										<div class="css-l0jxtc"></div>
										<div class="css-lhyz7t">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#FFFFFF">
												<path d="m10 13.4 5.8-5.8c.217-.217.483-.325.8-.325.317 0 .583.108.8.325.217.217.325.483.325.8 0 .317-.108.583-.325.8l-6.6 6.6c-.233.233-.5.35-.8.35-.3 0-.567-.117-.8-.35l-2.6-2.6a1.087 1.087 0 0 1-.325-.8c0-.317.108-.583.325-.8.217-.217.483-.325.8-.325.317 0 .583.108.8.325l1.8 1.8Z"></path>
											</svg>
										</div>
									</div>
								</div>
								<div color="" class="css-6mvyws">
									<span class="e1iur2ag1 css-gnwfui">1성급 이하</span>
								</div>
						   </label>
						   
						   <label class="css-1dkg27r css-19bfog6" for="2성급">
								<div class="css-1ert3cq">
									<div class="css-1xxrznb">
										<input id="2성급" type="checkbox" multiple="" name="radio" class="css-12a4kog" value="twostar">
										<div class="css-l0jxtc"></div>
										<div class="css-lhyz7t">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#FFFFFF">
												<path d="m10 13.4 5.8-5.8c.217-.217.483-.325.8-.325.317 0 .583.108.8.325.217.217.325.483.325.8 0 .317-.108.583-.325.8l-6.6 6.6c-.233.233-.5.35-.8.35-.3 0-.567-.117-.8-.35l-2.6-2.6a1.087 1.087 0 0 1-.325-.8c0-.317.108-.583.325-.8.217-.217.483-.325.8-.325.317 0 .583.108.8.325l1.8 1.8Z"></path>
											</svg>
										</div>
									</div>
								</div>
								<div color="" class="css-6mvyws">
									<span class="e1iur2ag1 css-gnwfui">2성급</span>
								</div>
						   </label>
						   
						   <label class="css-1dkg27r css-19bfog6" for="3성급">
								<div class="css-1ert3cq">
									<div class="css-1xxrznb">
										<input id="3성급" type="checkbox" multiple="" name="radio" class="css-12a4kog" value="threestar">
										<div class="css-l0jxtc"></div>
										<div class="css-lhyz7t">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#FFFFFF">
												<path d="m10 13.4 5.8-5.8c.217-.217.483-.325.8-.325.317 0 .583.108.8.325.217.217.325.483.325.8 0 .317-.108.583-.325.8l-6.6 6.6c-.233.233-.5.35-.8.35-.3 0-.567-.117-.8-.35l-2.6-2.6a1.087 1.087 0 0 1-.325-.8c0-.317.108-.583.325-.8.217-.217.483-.325.8-.325.317 0 .583.108.8.325l1.8 1.8Z"></path>
											</svg>
										</div>
									</div>
								</div>
								<div color="" class="css-6mvyws">
									<span class="e1iur2ag1 css-gnwfui">3성급</span>
								</div>
						   </label>
						   
						   <label class="css-1dkg27r css-19bfog6" for="4성급">
								<div class="css-1ert3cq">
									<div class="css-1xxrznb">
										<input id="4성급" type="checkbox" multiple="" name="radio" class="css-12a4kog" value="fourstar">
										<div class="css-l0jxtc"></div>
										<div class="css-lhyz7t">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#FFFFFF">
												<path d="m10 13.4 5.8-5.8c.217-.217.483-.325.8-.325.317 0 .583.108.8.325.217.217.325.483.325.8 0 .317-.108.583-.325.8l-6.6 6.6c-.233.233-.5.35-.8.35-.3 0-.567-.117-.8-.35l-2.6-2.6a1.087 1.087 0 0 1-.325-.8c0-.317.108-.583.325-.8.217-.217.483-.325.8-.325.317 0 .583.108.8.325l1.8 1.8Z"></path>
											</svg>
										</div>
									</div>
								</div>
								<div color="" class="css-6mvyws">
									<span class="e1iur2ag1 css-gnwfui">4성급</span>
								</div>
						   </label>
						   
						   <label class="css-1dkg27r css-19bfog6" for="5성급 이상">
								<div class="css-1ert3cq">
									<div class="css-1xxrznb">
										<input id="5성급 이상" type="checkbox" multiple="" name="radio" class="css-12a4kog" value="fivestar">
										<div class="css-l0jxtc"></div>
										<div class="css-lhyz7t">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#FFFFFF">
												<path d="m10 13.4 5.8-5.8c.217-.217.483-.325.8-.325.317 0 .583.108.8.325.217.217.325.483.325.8 0 .317-.108.583-.325.8l-6.6 6.6c-.233.233-.5.35-.8.35-.3 0-.567-.117-.8-.35l-2.6-2.6a1.087 1.087 0 0 1-.325-.8c0-.317.108-.583.325-.8.217-.217.483-.325.8-.325.317 0 .583.108.8.325l1.8 1.8Z"></path>
											</svg>
										</div>
									</div>
								</div>
								<div color="" class="css-6mvyws">
									<span class="e1iur2ag1 css-gnwfui">5성급 이상</span>
								</div>
						   </label>
						</div>
					</div>
					<hr class="my-half-3 CSS-HR" tpye="LINE_80_10">
					
<!-- 					세번째 사이드 -->					
					<div class="css-j7qwjs e1kcc1jp0">
						<div class="css-v8ozzb e1kcc1jp1">
							<h4 class="css-1bjjy4l">정렬</h4>
							<p class="e1kcc1jp2 css-j950kd"></p>
						</div>
						<div role="radiogroup" class="css-ls5l09 e1iur2ag0">
						
							<label class="css-1dkg27r css-19bfog6" for="추천순">
								<div class="css-1ert3cq">
									<div class="css-75qw4d">
										<input id="추천순" type="radio" name="checkbox" class="css-12a4kog" value="order:recommended" checked="">
										<div class="css-3wrzi8"></div>
										<div class="css-1dxdjkp"></div>
									</div>
								</div>
								<div class="css-6mvyws">
									<span class="e1iur2ag1 css-gnwfui">추천순</span>
								</div>
							</label>
							
							<label class="css-1dkg27r css-19bfog6" for="낮은 가격순">
								<div class="css-1ert3cq">
									<div class="css-75qw4d">
										<input id="낮은 가격순" type="radio" name="checkbox" class="css-12a4kog" value="order:price_asc">
										<div class="css-3wrzi8"></div>
										<div class="css-1dxdjkp"></div>
									</div>
								</div>
							    <div color="" class="css-6mvyws">
							    	<span class="e1iur2ag1 css-gnwfui">낮은 가격순</span>
							    </div>
							 </label>
							 
							<label class="css-1dkg27r css-19bfog6" for="높은 가격순">
							 	<div class="css-1ert3cq">
							 		<div class="css-75qw4d">
							 			<input id="높은 가격순" type="radio" name="checkbox" class="css-12a4kog" value="order:price_desc">
							 			<div class="css-3wrzi8"></div>
							 			<div class="css-1dxdjkp"></div>
							 		</div>
							 	</div>
							 	<div color="" class="css-6mvyws">
							 		<span class="e1iur2ag1 css-gnwfui">높은 가격순</span>
							 	</div>
							 </label>
							 
							<label class="css-1dkg27r css-19bfog6" for="할인 높은순">
							 	<div class="css-1ert3cq">
							 		<div class="css-75qw4d">
							 			<input id="할인 높은순" type="radio" name="checkbox" class="css-12a4kog" value="order:discount_rate_desc">
							 			<div class="css-3wrzi8"></div>
							 			<div class="css-1dxdjkp"></div>
							 		</div>
							 	</div>
							 	<div color="" class="css-6mvyws">
							 		<span class="e1iur2ag1 css-gnwfui">할인 높은순</span>
							 	</div>
							 </label>
						</div>
					</div>
					<hr class="my-half-3 CSS-HR" tpye="LINE_80_10">
					
					<button shape="pill" class="css-y8aj3r css-d006cr" style="position: absolute; width: 120px; margin-top: 10px;">
						<div class="css-ov1ktg">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
								<path d="M11.979 3.98c-1.205 0-2.343.25-3.411.752-.906.425-1.7 1-2.382 1.724v-.491c0-.304-.103-.569-.313-.779a1.065 1.065 0 0 0-.78-.314c-.304 0-.568.104-.778.314-.21.21-.314.475-.314.779v3.357c0 .332.11.618.335.843.225.225.511.335.843.335h3.378c.294 0 .553-.106.766-.31.218-.21.327-.476.327-.783 0-.306-.11-.572-.327-.781a1.076 1.076 0 0 0-.766-.311h-.893a6.039 6.039 0 0 1 1.772-1.386 5.454 5.454 0 0 1 2.543-.615c1.591 0 2.932.55 4.034 1.651 1.102 1.103 1.652 2.444 1.652 4.035 0 1.591-.55 2.932-1.652 4.035-1.102 1.101-2.443 1.651-4.034 1.651a5.594 5.594 0 0 1-3.347-1.077 5.402 5.402 0 0 1-2.051-2.841l-.001-.004a1.466 1.466 0 0 0-.528-.725 1.077 1.077 0 0 0-.893-.194l-.008.002a1.132 1.132 0 0 0-.754.59c-.16.302-.19.626-.09.958a7.65 7.65 0 0 0 2.89 4.078c1.416 1.031 3.012 1.547 4.782 1.547 1.103 0 2.143-.21 3.118-.633.971-.42 1.82-.99 2.548-1.71a7.973 7.973 0 0 0 1.721-2.55A7.839 7.839 0 0 0 20 12c0-1.103-.21-2.146-.633-3.129a7.985 7.985 0 0 0-1.722-2.55 8.235 8.235 0 0 0-2.547-1.708 7.767 7.767 0 0 0-3.118-.633Z"></path>
							</svg>
						</div>
						<div class="css-oss1kg">
							<span class="css-g354lr">
								<span class="css-dnoo08">필터 초기화</span>
							</span>
						</div>
					</button>
				</aside>
			</div>
			
			<section aria-label="상품 리스트 영역">
				<div class="css-1umbh81 e62ns3u0">
					<img src="https://dffoxz5he03rp.cloudfront.net/banners/unionstay/pc_top_banner_240103.jpg" alt="배너-0" style="width: 100%;">
					
					<div id="container" class="css-183vxbl e62ns3u1">
						<div style="height: 1000px; width: 100%; position: relative;">
							<div class="css-1wcdk3y e62ns3u2" style="transform: translateY(0px);">
							
								<div data-index="x">
									<div class="css-1xdhyk6">
										<a target="_blank" href="a">
											<div class="css-jk17ry erljagq0">
												<div class="thumbnail css-0 e6oouci0" aria-hidden="true" tabindex="-1">
													<div aria-hidden="true" role="presentation" class="css-1l5ilpc e6oouci1">
														<img alt="상품 썸네일" loading="lazy" decoding="async" data-nimg="fill" class="css-g81ghj e6oouci2" src="https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/02/01/LLzo/IrDeXWFGBi.jpg?width=980&amp;height=735&amp;quality=90" style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
													</div>
												</div>
												<div class="css-xwfdi9 erljagq1">
													<div class="mb-half-3 css-p58936 erljagq2">
														<div class="css-1iwf967 erljagq3">
															<div class="css-tjdujr edi3p4g1">
																<span class="edi3p4g0 css-121peml">신천 잠실 NU호텔 (이건 샘플용)</span>
																<h3 class="edi3p4g2 css-16kmqln">모텔 · 강남 중심에 위치</h3>
															</div>
														</div>
													</div>
													<div class="css-1l1txbn erljagq9">
														<button class="css-9ha9cd e1bx4bg61">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#adb5bd">
																<path fill-rule="evenodd" d="M2.644 9.91C2.644 6.454 5.16 4 8.316 4c2.096 0 3.585 1.47 4.401 2.935a.848.848 0 0 1-.31 1.145.817.817 0 0 1-1.124-.316C10.616 6.568 9.576 5.68 8.316 5.68c-2.24 0-4.022 1.698-4.022 4.23 0 1.473.644 3.01 1.912 4.57 1.267 1.56 3.119 3.088 5.423 4.518.11.069.219.128.31.168.044.019.075.03.093.034.441.018.793.387.793.84 0 .463-.37.84-.825.84-.279 0-.538-.095-.708-.17a4.148 4.148 0 0 1-.522-.278c-2.4-1.49-4.414-3.132-5.835-4.88-1.422-1.748-2.291-3.653-2.291-5.643Zm9.399 9.293h-.002.002Z" clip-rule="evenodd"></path>
																<path fill-rule="evenodd" d="M21.356 9.91c0-3.455-2.517-5.91-5.672-5.91-2.096 0-3.585 1.47-4.401 2.935a.848.848 0 0 0 .31 1.145c.396.229.9.087 1.124-.316.667-1.196 1.707-2.084 2.967-2.084 2.24 0 4.022 1.698 4.022 4.23 0 1.473-.644 3.01-1.912 4.57-1.267 1.56-3.119 3.088-5.423 4.518-.11.069-.219.128-.31.168a.758.758 0 0 1-.093.034.833.833 0 0 0-.793.84c0 .463.37.84.825.84.279 0 .538-.095.708-.17.19-.081.372-.184.522-.278 2.4-1.49 4.414-3.132 5.835-4.88 1.422-1.748 2.291-3.653 2.291-5.643Zm-9.399 9.293h.002-.002Z" clip-rule="evenodd"></path>
															</svg>
															<div class="css-fzwid6 e1bx4bg62">
																<span color="#848c94" class="e1bx4bg63 css-11dtkcp">2</span>
															</div>
														</button>
														<div class="css-l9rw6n erljagq4">
														
															<div class="css-1p1fdq5 erljagq7">
																<div class="css-1yxdl8j erljagq5">
																	<span class="erljagq8 css-15rrz1f">무료취소</span>
																</div>
															</div>
															
															<div class="css-dl3kio e1lavvxd0">  <!-- 방이 있을 경우 -->
																<ul class="css-qzcwn1 e1lavvxd1">
																	<li class="css-5i1dh6 e1lavvxd2"> 
																		<span class="mr-half-3 e1lavvxd3 css-1e4wxax">일반판매가</span>
																		<span class="e1lavvxd3 css-1e4wxax">140,000원</span>
																	</li>
																	<li class="css-5i1dh6 e1lavvxd2">
																		<span class="mr-half-3 css-12buyiw" style="color: rgb(250, 91, 74);">할인가</span>
																		<span>
																			<div class="css-5i1dh6 e1lavvxd2" style="justify-content: flex-end;">
																				<span class="mr-half-1 css-4409ec" style="color: rgb(250, 91, 74);"></span>
																				<span class="css-19kftx2" style="color: rgb(250, 91, 74);">138,254원/박</span>
																			</div>
																			<span class="css-bgkldf" style="color: rgb(250, 91, 74);"></span>
																		</span>
																	</li>
																</ul>
															</div>
															
															<div class="css-dl3kio e1lavvxd0" style="display: none"> <!-- 방이 없을 경우 -->
																<ul class="css-qzcwn1 e1lavvxd1">
																	<li class="css-5i1dh6 e1lavvxd2"> 
																		<span class="mr-half-3 e1lavvxd3 css-1e4wxax"></span>
																		<span class="e1lavvxd3 css-1e4wxax"></span>
																	</li>
																	<li class="css-5i1dh6 e1lavvxd2">
																		<span class="mr-half-3 css-12buyiw" style="color: rgb(132, 140, 148);"></span>
																		<span>
																			<div class="css-5i1dh6 e1lavvxd2" style="justify-content: flex-end;">
																				<span class="mr-half-1 css-4409ec" style="color: rgb(132, 140, 148);"></span>
																				<span class="css-19kftx2" style="color: rgb(132, 140, 148);">판매완료</span>
																			</div>
																			<span class="css-bgkldf" style="color: rgb(132, 140, 148);">일정을 변경해보세요</span>
																		</span>
																	</li>
																</ul>
															</div>
															
														</div>
													</div>
												</div>
											</div>
										</a>
									</div>
									<hr class="css-1646u5b" type="LINE_80_10">
								</div>
<!-- 							    여기서 부터 반복			 -->
						        <c:forEach var="hotel" items="${hotels}" varStatus="stat">
								    <c:set var="hotelInfo" value="${hotelInfoMap[hotel.hotel_idx]}" />
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
								    
								    <c:set var="formattedLowestPrice" >
										<fmt:formatNumber value="${lowestPrice}" type="number" pattern="#,###"/>
								    </c:set>
								    <c:set var="formattedDiscountedPrice">
								        <fmt:formatNumber value="${discountedPrice}" type="number" pattern="#,###"/>
								    </c:set>

						            <div data-index="${stat.index}" class="hotel">
						                <a href="/Hotel/${hotel.hotel_idx}">
						                    <div class="css-jk17ry erljagq0">
						                        <div class="thumbnail css-0 e6oouci0" aria-hidden="true" tabindex="-1">
						                            <div aria-hidden="true" role="presentation" class="css-1l5ilpc e6oouci1">
						                                <img alt="상품 썸네일" loading="lazy" decoding="async" data-nimg="fill" class="css-g81ghj e6oouci2" src="https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/02/01/LLzo/IrDeXWFGBi.jpg?width=980&height=735&quality=90" style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						                            </div>
						                        </div>
						                        <div class="css-xwfdi9 erljagq1">
						                            <div class="mb-half-3 css-p58936 erljagq2">
						                                <div class="css-1iwf967 erljagq3">
						                                    <div class="css-tjdujr edi3p4g1">
						                                        <span class="edi3p4g0 css-121peml">${hotel.name}</span>
						                                        <h3 class="edi3p4g2 css-16kmqln">${hotel.address1}.${hotel.address2}</h3>
						                                        <h4 class="edi3p4g2 css-16kmqln"></h4>
						                                    </div>
						                                </div>
						                            </div>
						                            <div class="css-1l1txbn erljagq9">
						                                <button class="css-9ha9cd e1bx4bg61">
						                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#adb5bd">
						                                        <path fill-rule="evenodd" d="M2.644 9.91C2.644 6.454 5.16 4 8.316 4c2.096 0 3.585 1.47 4.401 2.935a.848.848 0 0 1-.31 1.145.817.817 0 0 1-1.124-.316C10.616 6.568 9.576 5.68 8.316 5.68c-2.24 0-4.022 1.698-4.022 4.23 0 1.473.644 3.01 1.912 4.57 1.267 1.56 3.119 3.088 5.423 4.518.11.069.219.128.31.168.044.019.075.03.093.034.441.018.793.387.793.84 0 .463-.37.84-.825.84-.279 0-.538-.095-.708-.17a4.148 4.148 0 0 1-.522-.278c-2.4-1.49-4.414-3.132-5.835-4.88-1.422-1.748-2.291-3.653-2.291-5.643Zm9.399 9.293h-.002-.002Z" clip-rule="evenodd"></path>
						                                        <path fill-rule="evenodd" d="M21.356 9.91c0-3.455-2.517-5.91-5.672-5.91-2.096 0-3.585 1.47-4.401 2.935a.848.848 0 0 0 .31 1.145c.396.229.9.087 1.124-.316.667-1.196 1.707-2.084 2.967-2.084 2.24 0 4.022 1.698 4.022 4.23 0 1.473-.644 3.01-1.912 4.57-1.267 1.56-3.119 3.088-5.423 4.518-.11.069-.219.128-.31.168a.758.758 0 0 1-.093.034.833.833 0 0 0-.793.84c0 .463.37.84.825.84.279 0 .538-.095.708-.17.19-.081.372-.184.522-.278 2.4-1.49 4.414-3.132 5.835-4.88 1.422-1.748 2.291-3.653 2.291-5.643Zm-9.399 9.293h-.002-.002Z" clip-rule="evenodd"></path>
						                                    </svg>
						                                    <div class="css-fzwid6 e1bx4bg62">
						                                        <span color="#848c94" class="e1bx4bg63 css-11dtkcp">2</span>
						                                    </div>
						                                </button>
						                                <div class="css-l9rw6n erljagq4">
						                                    <div class="css-1p1fdq5 erljagq7">
						                                        <div class="css-1yxdl8j erljagq5">
						                                            <span class="erljagq8 css-15rrz1f">무료취소</span>
						                                        </div>
						                                    </div>
						                                    <div class="css-dl3kio e1lavvxd0">
						                                        <ul class="css-qzcwn1 e1lavvxd1">
						                                            <li class="css-5i1dh6 e1lavvxd2"> 
						                                                <span class="mr-half-3 e1lavvxd3 css-1e4wxax">일반판매가</span>
 																		<span class="e1lavvxd3 css-1e4wxax">${formattedLowestPrice}원</span>
						                                            </li>
						                                            <li class="css-5i1dh6 e1lavvxd2">
						                                                <span class="mr-half-3 css-12buyiw" style="color: rgb(250, 91, 74);">할인가</span>
								                                        <span>
								                                            <div class="css-5i1dh6 e1lavvxd2" style="justify-content: flex-end;">
								                                                <span class="mr-half-1 css-4409ec" style="color: rgb(250, 91, 74);"></span>
								                                                <span class="css-19kftx2" style="color: rgb(250, 91, 74);">${formattedDiscountedPrice}원/박</span>
								                                            </div>
								                                            <span class="css-bgkldf" style="color: rgb(250, 91, 74);"></span>
							                                       		 </span>
						                                            </li>
						                                        </ul>
						                                    </div>
						                                    <div class="css-dl3kio e1lavvxd0" style="display: none">
						                                        <ul class="css-qzcwn1 e1lavvxd1">
						                                            <li class="css-5i1dh6 e1lavvxd2"> 
						                                                <span class="mr-half-3 e1lavvxd3 css-1e4wxax"></span>
						                                                <span class="e1lavvxd3 css-1e4wxax"></span>
						                                            </li>
						                                            <li class="css-5i1dh6 e1lavvxd2">
						                                                <span class="mr-half-3 css-12buyiw" style="color: rgb(132, 140, 148);"></span>
						                                                <span>
						                                                    <div class="css-5i1dh6 e1lavvxd2" style="justify-content: flex-end;">
						                                                        <span class="mr-half-1 css-4409ec" style="color: rgb(132, 140, 148);"></span>
						                                                        <span class="css-19kftx2" style="color: rgb(132, 140, 148);">판매완료</span>
						                                                    </div>
						                                                    <span class="css-bgkldf" style="color: rgb(132, 140, 148);">일정을 변경해보세요</span>
						                                                </span>
						                                            </li>
						                                        </ul>
						                                    </div>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                </a>
						            </div>
						            <hr class="css-1646u5b" type="LINE_80_10">
						        </c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	
<script>
		document.addEventListener('DOMContentLoaded', () => {
			// 주소창에서 값 넘어왔을 때
			const params = new URLSearchParams(window.location.search);
			const place = params.get('place');
			const date = params.get('date');
			const guest = params.get('guest');
			
			// dropdown 활성화
		    const placeDropdown = document.querySelector('.place-dropdown');
		    const dateDropdown = document.querySelector('.date-dropdown');
		    const guestDropdown = document.querySelector('.guest-dropdown');

		    // place 관련 함수
		    const searchInput = document.querySelector('.searchInput');
		    const searchHistoryListBox = document.querySelector('.searchHistoryListBox');
		    const searchHistoryList = document.getElementById('searchHistoryList');
		    const suggestionsListBox = document.querySelector('.suggestionsListBox');
		    const suggestionsList = document.getElementById('suggestionsList');

		    // date 관련 함수
		    const dateDetails = document.querySelector('[data-section="date"] #date');
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
		    const placeElements = document.querySelectorAll('.searchDetail_div1')
    
		    function setValuesFromParams() {
		        if (place) {
		            document.getElementById('place').textContent = place;
		            placeInput.value = place;
		        }
		
		        if (date) {
		            document.getElementById('date').textContent = date;
		            dateInput.value = date;
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
			document.querySelector('[data-section="place"] .searchDetail_endDiv').addEventListener('click', function() {  
			    if (!placeDropdown.classList.contains('show')) {
			        dateDropdown.classList.remove('show');
			        guestDropdown.classList.remove('show');
			    }
			    placeDropdown.classList.toggle('show');
			});

			document.querySelector('[data-section="date"] .searchDetail_endDiv').addEventListener('click', function() {
			    if (!dateDropdown.classList.contains('show')) {
			        placeDropdown.classList.remove('show');
			        guestDropdown.classList.remove('show');
			    }
			    dateDropdown.classList.toggle('show');
			});

			document.querySelector('[data-section="guest"] .searchDetail_endDiv').addEventListener('click', function() {
			    if (!guestDropdown.classList.contains('show')) {
			        placeDropdown.classList.remove('show');
			        dateDropdown.classList.remove('show');
			    }
			    guestDropdown.classList.toggle('show');
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
		    
		    // date 관련 스크립트
		    const datepicker = $("#datepicker");
			
		    function formatDateString(dateStr) {
		        const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		        const dateObj = new Date(dateStr);
		        const month = dateObj.getMonth() + 1;
		        const day = dateObj.getDate();
		        const dayOfWeek = daysOfWeek[dateObj.getDay()];
		        return month + "월 " + day + "일(" + dayOfWeek + ")";
		    }
		    
			 // Datepicker 초기화
			datepicker.datepicker({
		        onSelect: function(dateText) {
		            if (!checkInSelected) {
		                checkInDate = dateText;
		                dateDetails.textContent = "입실: " +  formatDateString(checkInDate);
		                checkInSelected = true;
		                datepicker.datepicker('option', 'minDate', dateText);
		            } else {
		                checkOutDate = dateText;
		                dateDetails.textContent = formatDateString(checkInDate) + "~" + formatDateString(checkOutDate);
		                checkInSelected = false;
		                dateDropdown.classList.remove('show'); // dropdown 숨김
		                datepicker.datepicker('option', 'minDate', null);
		            }
		            dateInput.value = dateDetails.textContent;
		            checkAllInputs();
		        },
		        dateFormat: "yy-mm-dd"
		    });
			 
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
		    
		    // URL 파라미터를 유지한 채로 페이지 로드 시 값을 채워줌
		    window.addEventListener('popstate', function() {
		        const params = new URLSearchParams(window.location.search);
		        const place = params.get('place');
		        const date = params.get('date');
		        const guest = params.get('guest');
		        
		        if (place) {
		            document.getElementById('place').textContent = place;
		            placeInput.value = place;
		        }
		        
		        if (date) {
		            document.getElementById('date').textContent = date;
		            dateInput.value = date;
		        }
		        
		        if (guest) {
		            document.getElementById('guest').textContent = '성인 ' + guest + '명';
		            guestInput.value = guest;
		        }
		        
		        checkAllInputs();
		    });

		    // 페이지 로드 시 URL 파라미터 값 유지
		    const initialParams = new URLSearchParams(window.location.search);
		    const initialPlace = initialParams.get('place');
		    const initialDate = initialParams.get('date');
		    const initialGuest = initialParams.get('guest');

		    if (initialPlace) {
		        document.getElementById('place').textContent = initialPlace;
		        placeInput.value = initialPlace;
		    }

		    if (initialDate) {
		        document.getElementById('date').textContent = initialDate;
		        dateInput.value = initialDate;
		    }

		    if (initialGuest) {
		        document.getElementById('guest').textContent = '성인 ' + initialGuest + '명';
		        guestInput.value = initialGuest;
		    }

		    checkAllInputs();
		    
			// noUiSlider 바
	        const slider = document.getElementById('slider');

	        noUiSlider.create(slider, {
	            start: [0, 500000],
	            connect: true,
	            range: {
	                'min': 0,
	                'max': 500000
	            },
	            format: {
	                to: function (value) {
	                    return Math.round(value) + '원';
	                },
	                from: function (value) {
	                    return Number(value.replace('원', ''));
	                }
	            }
	        });

	        slider.noUiSlider.on('update', function (values, handle) {
	            if (handle === 0) {
	                document.getElementById('min-amount').innerText = values[0];
	            } else {
	                const maxAmountElement = document.getElementById('max-amount');
	                maxAmountElement.innerText = values[1];
	                if (Number(values[1].replace('원', '')) < 500000) {
	                    maxAmountElement.innerText += '';
	                } else {
	                    maxAmountElement.innerText += '+';
	                }
	            }
	        });
	    });
	</script>
</body>

</html>
