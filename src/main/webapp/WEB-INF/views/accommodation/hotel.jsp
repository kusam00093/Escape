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
<link rel="stylesheet" href="/css/accommodation/hotel.css" />
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
	<main class="el8kvy20 css-2kceou e1pzvah12">
		<div class="css-qhzs5v en76een0">
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
							<img alt="" src="" class="css-j3xuou e9nb2z72">
						</div>
						<button shape="pill" class="e9nb2z73 css-14fxxv1">
							<div class="css-oss1kg">
								<span class="css-g354lr">
									<span class="css-dnoo08">사진 모두 보기</span>
								</span>
							</div>
						</button>
					</div>
				</div>
<!-- 				호텔 이름/좋아요/가격/객실 선택 -->
				<div class="css-yd8sa2 e18lo67g2">
					<div>
						<div class="css-1s91mnt e18lo67g3">
							<div class="css-c9l051 e18lo67g4">
								<div class="css-i3pbo e18lo67g5">
									<div class="css-1mi5cco eyhncde0">
										<div class="css-k008qs eyhncde1">
											<span class="eyhncde2 css-sfumlt">풍경채 콘도텔</span>
										</div>
										<div class="css-k008qs eyhncde1">
											<span class="eyhncde3 css-1r4homq">펜션</span>
										</div>
									</div>
								</div>
								<div class="css-ayucfr e18lo67g6">
									<div class="css-6g4hta e157n2fq0">
										<div class="origin-price css-1n2mv2k e157n2fq3">
											<span class="css-bgkldf" style="color: rgb(250, 91, 74);">제로마진가</span>
											<span class="css-12wooir e157n2fq2">222,362원</span>
										</div>
										<div class="css-1n2mv2k e157n2fq3">
											<span class="mr-half-1 css-1kjy5hl" style="color: rgb(250, 91, 74);">215,754원/박</span>
											<img height="14" src="https://dffoxz5he03rp.cloudfront.net/icons/zero_margin_3x.png" alt="">
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
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</main>
<script>
</script>	 
</body>

</html>
