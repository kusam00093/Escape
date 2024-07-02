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
    const guestSpan = document.querySelector('.lodging_search_details_div1_div1_span2_guest');
    const searchButton = document.querySelector('.lodging_search_details_button1');
    const placeInput = document.getElementById('placeInput');
    const dateInput = document.getElementById('dateInput');
    const guestInput = document.getElementById('guestInput');
    
    function checkAllInputs() {
        const placeText = document.querySelector('[data-section="place"] .lodging_search_details_div1_div1_span2').textContent.trim();
        const dateText = dateDetails.textContent.trim();
        const guestText = guestSpan.textContent.trim();
        const guestCount = parseInt(guestText.replace('성인', '').replace('명', '').trim());
        
        if (placeText !== "여행지나 숙소명 검색" && dateText !== "언제 떠나시나요?" && guestCount > 0) {
        	searchButton.disabled = false;
        	searchButton.style.backgroundColor = 'black'; // 배경색을 검은색으로 변경
        	searchButton.style.color = 'white'; // 배경색을 검은색으로 변경
        } else {
            searchButton.disabled = true;
            searchButton.style.backgroundColor = 'white'; // 배경색을 검은색으로 변경
        	searchButton.style.color = 'black'; // 배경색을 검은색으로 변경
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
                    	console.log('Suggestion item clicked:', item.name); // 클릭 확인을 위한 콘솔 로그
                    	// 선택한 값을 해당 lodging_search_details_div1_div1_span2 요소에 넣기
                        const selectedElement = document.querySelector('[data-section="place"] .lodging_search_details_div1_div1_span2');
//                     	const selectedElement2 = document.querySelector('.searchOptionDropdown_div1_div1_div1_div1_search_input1');
                        if (selectedElement) {
                            selectedElement.textContent = item.name;
                            placeInput.value = item.name; // placeInput 값 설정
                        }
                        
//                         if (selectedElement2) {
//                             selectedElement2.textContent = item.name;
//                             placeInput.value = item.name; // placeInput 값 설정
//                         }
                       
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
    
    function updateguestCount(newCount) {
        numSpan.textContent = newCount;
        guestSpan.textContent = '성인 ' + newCount + '명';
        guestInput.value = newCount;
        checkAllInputs();
    }
    
    decreaseButton.addEventListener('click', function(){
    	event.preventDefault();  // 기본 동작 방지
    	let currentValue = parseInt(numSpan.textContent);
    	if (currentValue > 0) { // 최소값 설정
    		updateguestCount(currentValue - 1);
    	}
    });
    
    increaseButton.addEventListener('click', function () {
    	event.preventDefault();  // 기본 동작 방지
        let currentValue = parseInt(numSpan.textContent);
        updateguestCount(currentValue + 1);
    });
    
    searchButton.addEventListener('click', function () {
        if (!searchButton.disabled) {
            const place = placeInput.value;
            const date = dateInput.value;
            const guest = guestInput.value;
            const queryString = '?place=' + encodeURIComponent(place) + '&date=' + encodeURIComponent(date) + '&guest=' + encodeURIComponent(guest);
            window.location.href = searchButton.form.action + queryString;
        }
    });
    
    checkAllInputs(); // 초기 상태 확인
});
