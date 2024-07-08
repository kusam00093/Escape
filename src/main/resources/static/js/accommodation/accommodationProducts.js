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
	
	// "호텔 클릭" 항목 클릭 이벤트
	const hotelLinks = document.querySelectorAll(".hotelBtn");
	
    hotelLinks.forEach(function(link) {
        link.addEventListener("click", function(event) {
            event.preventDefault();

            const place = placeInput.value;
            const date = dateInput ? dateInput.value : '';
            const guest = guestInput ? guestInput.value : '';

            const queryString = '?place=' + encodeURIComponent(place) + 
                                '&date=' + encodeURIComponent(date) + 
                                '&guest=' + encodeURIComponent(guest);
            
            const baseUrl = link.href.split('?')[0];
            
            link.href = baseUrl + queryString;
            window.open(link.href, "_blank");
        });
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
	
     document.querySelectorAll('.bookmarkButton').forEach(function(button) {
        const hotelId = button.getAttribute('data-hotel-id');
        fetch(`/AccommodationApi/bookmarkInfo?hotelId=${hotelId}`, {
            method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
            if (data.isBookmarked) {
                button.querySelector('svg').setAttribute('color', '#000000'); // 검정색 하트
            }
            button.querySelector('span').innerText = data.totalBookmarks; // 북마크 수 설정
        })
        .catch(error => console.error('Error:', error));

        button.addEventListener('click', function (e) {
            e.preventDefault(); // 페이지 이동 방지
            e.stopPropagation(); // 이벤트 전파 방지

            fetch('/AccommodationApi/toggleBookmark', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    'hotelId': hotelId
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message);
                    button.querySelector('span').innerText = data.totalBookmarks; // 북마크 수 업데이트
                    if (data.isBookmarked) {
                        button.querySelector('svg').setAttribute('color', '#000000'); // 검정색 하트로 변경
                    } else {
                        button.querySelector('svg').setAttribute('color', '#adb5bd'); // 원래 색으로 변경
                    }
                } else {
                    alert('북마크 처리에 실패했습니다: ' + data.message);
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });
    
});