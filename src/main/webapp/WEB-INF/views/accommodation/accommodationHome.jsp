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
<link rel="stylesheet" href="/css/accommodationHome.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<%@include file="/WEB-INF/include/header.jsp"%>

<%@include file="/WEB-INF/include/nav.jsp"%>
<body>

	<main>
		<section class="lodging_search">
			<div class="lodging_search_information">
				<h1>숙소 찾기</h1>
			</div>
			<div class="lodging_search_detail">
				<form id="lodgingSearchForm" action="/Accommodation/Products" method="get">
					<div class="lodging_search_details" data-section="place">
						<div class="lodging_search_details_div1">
							<div class="lodging_search_details_div1_div1">
								<span class="lodging_search_details_div1_div1_span1">여행지</span> 
								<span class="lodging_search_details_div1_div1_span2">여행지나 숙소명 검색</span>
								<input type="hidden" name="place" id="placeInput">
							</div>
							<div class="searchOptionDropdown" id="searchOptionDropdown">
								<div class="searchOptionDropdown_div1">
									<div class="searchOptionDropdown_div1_div1">
										<div class="searchOptionDropdown_div1_div1_div1">
											<div class="searchOptionDropdown_div1_div1_div1_div1" style="width: 100%; height: 48px;">
												<div class="searchOptionDropdown_div1_div1_div1_div1_search_img">
													<svg xmlns="http://www.w3.org/2000/svg" width="20"
														height="20" fill="currentColor" viewBox="0 0 24 24"
														class="mrt-web-icons" color="#666d75">
														<path
															d="m18.875 20.475-5.55-5.55c-.5.383-1.075.692-1.725.925-.65.233-1.342.35-2.075.35-1.85 0-3.417-.646-4.7-1.938C3.542 12.97 2.9 11.4 2.9 9.55c0-1.85.642-3.421 1.925-4.713C6.108 3.546 7.675 2.9 9.525 2.9s3.421.646 4.713 1.937c1.291 1.292 1.937 2.863 1.937 4.713 0 .733-.112 1.425-.337 2.075a5.726 5.726 0 0 1-.913 1.7l5.575 5.6c.2.2.3.454.3.763 0 .308-.108.57-.325.787a1.101 1.101 0 0 1-.812.325c-.325 0-.588-.108-.788-.325ZM9.525 13.9c1.217 0 2.25-.421 3.1-1.263.85-.841 1.275-1.87 1.275-3.087s-.425-2.246-1.275-3.088c-.85-.841-1.883-1.262-3.1-1.262s-2.246.42-3.087 1.262c-.842.842-1.263 1.871-1.263 3.088s.421 2.246 1.263 3.087c.841.842 1.87 1.263 3.087 1.263Z">
														</path>
													</svg>
												</div>
												<input type="text" placeholder="여행지나 숙소명 검색" 
													class="searchOptionDropdown_div1_div1_div1_div1_search_input1">
												<input type="text" tabindex="-1"
													class="searchOptionDropdown_div1_div1_div1_div1_search_input2">
												<button	class="searchOptionDropdown_div1_div1_div1_div1_button">
												<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" class="mrt-web-icons" color="#848c94">
													<path d="M7.725 16.275c.2.2.446.3.738.3.291 0 .537-.1.737-.3l2.8-2.8 2.825 2.825c.2.2.442.296.725.287.283-.008.525-.112.725-.312.2-.2.3-.446.3-.738s-.1-.537-.3-.737l-2.8-2.8L16.3 9.175c.2-.2.296-.442.287-.725a1.031 1.031 0 0 0-.312-.725c-.2-.2-.446-.3-.737-.3-.292 0-.538.1-.738.3l-2.8 2.8L9.175 7.7a.947.947 0 0 0-.725-.288 1.035 1.035 0 0 0-.725.313c-.2.2-.3.445-.3.737s.1.538.3.738l2.8 2.8L7.7 14.825c-.2.2-.296.442-.287.725.008.283.112.525.312.725ZM12 22.2a10 10 0 0 1-3.988-.8 10.246 10.246 0 0 1-3.237-2.175A10.248 10.248 0 0 1 2.6 15.988 9.999 9.999 0 0 1 1.8 12c0-1.417.267-2.746.8-3.988a10.247 10.247 0 0 1 2.175-3.237A10.247 10.247 0 0 1 8.012 2.6 9.999 9.999 0 0 1 12 1.8c1.417 0 2.746.266 3.988.8a10.248 10.248 0 0 1 3.237 2.175A10.246 10.246 0 0 1 21.4 8.012 10 10 0 0 1 22.2 12a10 10 0 0 1-.8 3.988 10.247 10.247 0 0 1-2.175 3.237 10.247 10.247 0 0 1-3.237 2.175 10 10 0 0 1-3.988.8Z">
													</path>
												</svg>
												</button>
											</div>
										</div>
									</div>
									<div class="searchOptionDropdown_div1_div2">
									
									</div>
									<div class="searchOptionDropdown_div1_div3">
										<div>
											<div class="searchOptionDropdown_div1_div3_div1 searchHistoryListBox">
												<span style="color: #141719;" class="searchOptionDropdown_div1_div3_div1_span1">검색 기록</span>
	<!-- 											<button shape="pill" class="searchOptionDropdown_div1_div3_div1_button"> -->
	<!-- 												<div class="searchOptionDropdown_div1_div3_div1_button_div1"> -->
	<!-- 													<span class="searchOptionDropdown_div1_div3_div1_button_div1_span1">지우기</span> -->
	<!-- 												</div> -->
	<!-- 											</button> -->
												<ul id="searchHistoryList" class="searchHistoryList"></ul> <!-- 검색 기록 리스트 -->
											</div>
											<div class="searchOptionDropdown_div1_div3_div1  suggestionsListBox" style="display: none;">
												<span style="color: #141719;" class="searchOptionDropdown_div1_div3_div1_span1">지역</span>
												<ul id="suggestionsList" class="suggestionsList"></ul> <!-- 검색 리스트 -->
											</div>
						   				</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="lodging_search_details_interval"></div>
						
		            <div class="lodging_search_details dropdownDate_top" data-section="date">
		                <div class="lodging_search_details_div1">
		                    <div class="lodging_search_details_div1_div1">
		                        <span class="lodging_search_details_div1_div1_span1">일정</span>
		                        <span class="lodging_search_details_div1_div1_span2">언제 떠나시나요?</span>
		                        <input type="hidden" name="date" id="dateInput">
		                    </div>
		                </div>
		                <div class="searchOptionDropdown dropdownDate">
		                    <div class="dropdownDate_div1">
		                        <div class="dropdownDate_div1_div1" id="datepicker"></div> <!-- datepicker ID 추가 -->
		                        <footer class="dropdownDate_div1_footer1"></footer>
		                    </div>
		                </div>
		            </div>
					
					<div class="lodging_search_details_interval"></div>
					
					<div class="lodging_search_details dropdownNumber" data-section="number">
						<div class="lodging_search_details_div1">
							<div class="lodging_search_details_div1_div1">
								<span class="lodging_search_details_div1_div1_span1">숙박</span> 
								<span	class="lodging_search_details_div1_div1_span2_personnel">성인	2명</span>
								<input type="hidden" name="personnel" id="personnelInput">
							</div>
						</div>
							<div class="searchOptionDropdown dropdownNumber_div2" style="display: none;">
							    <div class="dropdownNumber_div2_adult">
							        <span class="dropdownNumber_div2_adult_text">성인</span>
							        <div class="dropdownNumber_choice">
							            <button class="dropdownNumber_choice_button decrease">
							                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24" color="#343a40">
							                    <path d="M6 13.15c-.317 0-.587-.113-.812-.338A1.105 1.105 0 0 1 4.85 12c0-.317.113-.587.338-.812.225-.225.495-.338.812-.338h12c.317 0 .587.113.812.338.225.225.338.495.338.812 0 .317-.113.587-.338.812a1.105 1.105 0 0 1-.812.338H6Z"></path>
							                </svg>
							            </button>
							            <div class="dropdownNumber_choice_num">
							                <span class="dropdownNumber_choice_num_span">2</span>
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
					
					<div class="lodging_search_details_button">
						<button shape="fill" class="lodging_search_details_button1"
							disabled>
							<div class="lodging_search_details_button1_div1">
								<span class="lodging_search_details_button1_div1_span1">검색</span>
							</div>
						</button>
					</div>
				</form>
			</div>
		</section>
	</main>

<%-- 	<%@include file="/WEB-INF/include/footer.jsp"%> --%>
<script>
document.addEventListener("DOMContentLoaded", function(){
    const placeElements = document.querySelectorAll('.lodging_search_details_div1');
    const searchInput = document.querySelector('.searchOptionDropdown_div1_div1_div1_div1_search_input1');
    const suggestionsList = document.getElementById('suggestionsList');
    const searchHistoryList = document.getElementById('searchHistoryList');
    const searchHistoryBox = document.querySelector('.searchHistoryListBox');
    const suggestionsBox = document.querySelector('.suggestionsListBox');
    let checkInSelected = false;
    let checkInDate = null;
    let checkOutDate = null;
    const dateDetails = document.querySelector('[data-section="date"] .lodging_search_details_div1_div1_span2');
    const personnelSpan = document.querySelector('.lodging_search_details_div1_div1_span2_personnel');
    const searchButton = document.querySelector('.lodging_search_details_button1');
    const placeInput = document.getElementById('placeInput');
    const dateInput = document.getElementById('dateInput');
    const personnelInput = document.getElementById('personnelInput');
    
    function checkAllInputs() {
        const placeText = document.querySelector('[data-section="place"] .lodging_search_details_div1_div1_span2').textContent.trim();
        const dateText = dateDetails.textContent.trim();
        const personnelText = personnelSpan.textContent.trim();

        if (placeText !== "여행지나 숙소명 검색" && dateText !== "언제 떠나시나요?" && personnelText !== "성인 0명") {
        	searchButton.disabled = false;
        	searchButton.style.backgroundColor = 'black'; // 배경색을 검은색으로 변경
        	searchButton.style.color = 'white'; // 배경색을 검은색으로 변경
        } else {
            searchButton.disabled = true;
            searchButton.style.backgroundColor = ''; // 기본 배경색으로 변경
        }
    }
    
    placeElements.forEach(element => {
        element.addEventListener('click', function(){
            // 모든 searchOptionDropdown 요소 숨기기
            document.querySelectorAll('.searchOptionDropdown').forEach(dropdown => {
                dropdown.style.display = 'none';
            });
            // 모든 lodging_search_details_div1 요소에서 clicked 클래스 제거
            placeElements.forEach(el => el.classList.remove('clicked'));
            // 클릭한 요소의 searchOptionDropdown 보이기
            const dropdown = this.querySelector('.searchOptionDropdown');
            if (dropdown) {
                dropdown.style.display = 'block';
            }
            // 클릭한 요소에 clicked 클래스 추가
            this.classList.add('clicked');
        });
    });

    // 검색 기록 로드
    loadSearchHistory();

    searchInput.addEventListener('input', function(){
        const query = searchInput.value;
        if (query.length > 0) {
            // 검색 기록 숨기기
            searchHistoryBox.style.display = 'none';
            // 검색 제안 표시
            suggestionsBox.style.display = 'block';

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
                    console.log('Appending item:', item.name); // 항목 추가 확인을 위한 콘솔 로그
                    const li = document.createElement('li');
                    li.innerHTML = '<div class="suggestion-item">' +
                                   '<span class="suggestion-item-text">' + item.name + '</span>' +
                                   '</div>';

                    li.querySelector('.suggestion-item-text').addEventListener('click', function() {
                        // 선택한 값을 해당 lodging_search_details_div1_div1_span2 요소에 넣기
                        const parentDetails = searchInput.closest('.lodging_search_details');
                        const selectedElement = parentDetails.querySelector('.lodging_search_details_div1_div1_span2');
                        if (selectedElement) {
                            selectedElement.textContent = item.name;
                        }
                       
                        // 선택한 후 dropdown 숨기기
                        const parentDropdown = searchInput.closest('.searchOptionDropdown');
                        console.log('Hiding dropdown:', parentDropdown); // 확인을 위한 콘솔 로그
                        if (parentDropdown) {
                            parentDropdown.style.display = 'none';
                        }

                        // 검색 기록에 추가
                        addSearchHistory(item.name);
                        // suggestionsList 비우기
                        suggestionsList.innerHTML = '';
                        // 검색 제안 숨기기
                        suggestionsBox.style.display = 'none';
                        // 검색 기록 표시
                        searchHistoryBox.style.display = 'block';
                        
                        checkAllInputs();
                    });
                    suggestionsList.appendChild(li);
                });
                console.log('Suggestions list updated:', suggestionsList); // 업데이트 후 확인
            })
            .catch(error => {
                console.error('Error:', error); // 에러 확인을 위한 콘솔 로그
            });
        } else {
            suggestionsList.innerHTML = '';
            // 검색 제안 숨기기
            suggestionsBox.style.display = 'none';
            // 검색 기록 표시
            searchHistoryBox.style.display = 'block';
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
                document.querySelectorAll('.searchOptionDropdown').forEach(dropdown => {
                    dropdown.style.display = 'none';
                });
                const parentDetails = searchInput.closest('.lodging_search_details');
                const selectedElement = parentDetails.querySelector('.lodging_search_details_div1_div1_span2');
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
            searchHistoryList.style.display = 'block';
        } else {
            searchHistoryList.style.display = 'none';
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
                $(".dropdownDate").hide();
                datepicker.datepicker('option', 'minDate', null);
            }
            dateInput.value = dateDetails.textContent;
            checkAllInputs();
        },
        dateFormat: "yy-mm-dd"
    });
    
    // "일정" 항목 클릭 이벤트
    document.querySelector('[data-section="date"] .lodging_search_details_div1').addEventListener('click', function() {
        $(".dropdownDate").toggle();
    });

    // 달력이 숨겨져 있어야 할 경우 기본적으로 숨김
    $(".dropdownDate").hide();
	
    
    // "숙박" 항목 클릭 이벤트
    document.querySelector('[data-section="number"] .lodging_search_details_div1').addEventListener('click', function() {
        const dropdown = document.querySelector('[data-section="number"] .dropdownNumber_div2');
        dropdown.style.display = dropdown.style.display === 'none' ? 'block' : 'none';
    });
    
    // "인원" 항목 클릭 이벤트
    const decreaseButton = document.querySelector('.dropdownNumber_choice_button.decrease');
    const increaseButton = document.querySelector('.dropdownNumber_choice_button.increase');
    const numSpan = document.querySelector('.dropdownNumber_choice_num_span');
    
    function updatePersonnelCount(newCount) {
        numSpan.textContent = newCount;
        personnelSpan.textContent = '성인 ' + newCount + '명';
        personnelInput.value = newCount;
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
    
    searchButton.addEventListener('click', function () {
        if (!searchButton.disabled) {
            const place = placeInput.value;
            const date = dateInput.value;
            const personnel = personnelInput.value;
            const queryString = '?place=' + encodeURIComponent(place) + '&date=' + encodeURIComponent(date) + '&personnel=' + encodeURIComponent(personnel);
            window.location.href = searchButton.form.action + queryString;
        }
    });
    
    checkAllInputs(); // 초기 상태 확인
});
</script>
</body>

</html>
