<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
<style>
button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #0056b3;
}

div[name="start_date"], div[name="end_date"] {
    margin-top: 10px;
    font-size: 18px;
    color: #333;
}

.date-input {
    margin-top: 20px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 200px;
    text-align: center;
}

#preview-container img {
    width: 100px;
    height: 100px;
    margin: 10px;
    object-fit: cover; /* 이미지를 100x100 박스에 잘 맞도록 */
}

</style> 
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-97/variables.css">
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/169963/mixins.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />

<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>


    <form action="/Package/Write" method="post" id="myForm" enctype="multipart/form-data" >
    	<input type="hidden" value="${ user_idx }" name="user_idx">
    	
        <input type="text" name="title" placeholder="제목을 입력하세요" required value="제목1">
        <hr>
        <input type="text" name="price" placeholder="가격을 입력하세요" required value="10000">
        <hr>
        <textarea rows="4" cols="50" name="detail1" placeholder="상세 내용 1">ㅇㅁㄴㅇㄻㄴㅇ</textarea>
        <textarea rows="4" cols="50" name="detail2" placeholder="상세 내용 2">ㅁㄴㅇㄹㄴㅁㅇ</textarea>
        <textarea rows="4" cols="50" name="detail3" placeholder="상세 내용 3">ㅅㅁㄴㅇㄹㄴㅁ</textarea>
        
        <hr>
        
	 	<label for="location" class="form-label">국가를 선택하세요 (중복가능)</label>
		<c:forEach var="lo" items="${ locationList }">
			<div class="col-auto">
					<button type="button" class="btn btn-outline-primary location-btn" name="location_idx" value="${ lo.location_idx }">${lo.name }</button>
			</div>
		</c:forEach>
		<input type="hidden" id="selectedLocation" name="location_idx">
		
        <hr>

		
		<label for="category" class="form-label">카테고리를 선택하세요 (중복가능)</label>
		<c:forEach var="ca" items="${ categoryList }">
			<div class="col-auto">
					<button type="button" class="btn btn-outline-primary category-btn" name="category_idx" value="${ ca.category_idx }">${ca.name }</button>
			</div>
		</c:forEach>
		<input type="hidden" id="selectedCategory" name="category_idx">
        
        
        <hr>
		<label for="convenience" class="form-label">기타 사항을 선택하세요 (중복가능)</label>
		<c:forEach var="co" items="${ convenienceList }">
			<div class="col-auto">
					<button type="button" class="btn btn-outline-primary convenience-btn" name="convenience_idx" value="${ co.convenience_idx }">${co.name }</button>
			</div>
		</c:forEach>
		<input type="hidden" id="selectedConvenience" name="convenience_idx">
        <hr>
        
        <input type="text" name="zip_code" placeholder="우편번호" readonly="readonly" value="123452"/>
        <input type="button"  onclick="daumPost()" value="우편번호 찾기" />
        <br><input type="text" name="address1" placeholder="상세주소" value="서울"></br>
        <br><input type="text" name="address2" placeholder="상세주소" value="강남"></br>
        
        <hr>
        
        
        
        <div id="preview-container"></div>
        <input type="file" name="file" id="file" multiple style="display: none;">
        <button id="AddFileBtn">이미지 추가</button>
        
        <hr>
        
        <div>제한인원</div>
        <input type="number" min="1" max="2000" step="1" name="limited_person" value="44">
        
        
        <hr>
        
        <div class="container">
            <input type="text" id="datePickerInput" class="date-input" placeholder="날짜를 선택하세요" readonly>
            <input type="text" name="start_date" id="start_date" placeholder="시작 날짜" readonly >
            <input type="text" name="end_date" id="end_date" placeholder="끝 날짜" readonly>
        </div>
        <hr>
        
    <div>할인</div>
    <input type="checkbox" id="discountCheckbox" value="할인을 하시려면 체크해주세요">
    <div id="percentageInputContainer" name="discount_percent"></div>
        
        
		
        <button type="submit">제출하기</button>
    </form>
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일 경우 조합형 주소 조합
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형 주소가 있을 경우 마지막에 붙여줌
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합형 주소를 최종 주소에 추가
                    fullAddr += extraAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 입력
                document.getElementsByName('zip_code')[0].value = data.zonecode; // 우편번호
                document.getElementsByName('address1')[0].value = fullAddr; // 주소

                // 커서를 상세주소 필드로 이동
                document.getElementsByName('address1')[0].focus();
            }
        }).open();
    }
</script>
 <script>
        document.getElementById('discountCheckbox').addEventListener('change', function() {
            const percentageInputContainer = document.getElementById('percentageInputContainer');
            
            if (this.checked) {
                // 체크박스가 체크된 경우 퍼센티지 입력 필드 추가
                const input = document.createElement('input');
                input.type = 'number';
                input.id = 'percentageInput';
                input.name = 'discount_persent';
                input.placeholder = '할인 퍼센티지를 입력하세요';
                input.min = '0';
                input.max = '100';
                
                percentageInputContainer.appendChild(input);
            } else {
                // 체크박스가 체크 해제된 경우 퍼센티지 입력 필드 제거
                const input = document.getElementById('percentageInput');
                if (input) {
                    percentageInputContainer.removeChild(input);
                }
            }
        });
    </script>
<script>
//선택된 버튼들의 값을 저장할 배열을 선언합니다.
let selectedCategory = [];
let selectedLocation = [];
let selectedConvenience = [];

// 버튼 요소들을 선택합니다.
const categoryBtns = document.querySelectorAll('.category-btn');
const locationBtns = document.querySelectorAll('.location-btn');
const convenienceBtns = document.querySelectorAll('.convenience-btn');

// 각 버튼에 클릭 이벤트를 추가합니다.
categoryBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // 현재 버튼의 선택 상태를 토글합니다.
        btn.classList.toggle('active');
        
        // 버튼의 값이 선택된 상태라면 배열에 추가하고, 그렇지 않다면 배열에서 제거합니다.
        const categoryValue = btn.value;
        if (btn.classList.contains('active')) {
            selectedCategory.push(categoryValue);
        } else {
        	selectedCategory = selectedCategory.filter(category => category !== categoryValue);
        }

        // 선택된 기술들을 확인하기 위해 콘솔에 출력합니다.
        console.log(selectedCategory);

        // 선택된 기술들의 값을 hidden input에 설정하여 폼으로 전송합니다.
        const categoryInput = document.getElementById('selectedCategory');
        categoryInput.value = selectedCategory.join(',');
    });
});

locationBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // 현재 버튼의 선택 상태를 토글합니다.
        btn.classList.toggle('active');
        
        // 버튼의 값이 선택된 상태라면 배열에 추가하고, 그렇지 않다면 배열에서 제거합니다.
        const locationValue = btn.value;
        if (btn.classList.contains('active')) {
            selectedLocation.push(locationValue);
        } else {
        	selectedLocation = selectedLocation.filter(location => location !== locationValue);
        }

        // 선택된 기술들을 확인하기 위해 콘솔에 출력합니다.
        console.log(selectedLocation);

        // 선택된 기술들의 값을 hidden input에 설정하여 폼으로 전송합니다.
        const locationInput = document.getElementById('selectedLocation');
        locationInput.value = selectedLocation.join(',');
    });
});
convenienceBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // 현재 버튼의 선택 상태를 토글합니다.
        btn.classList.toggle('active');
        
        // 버튼의 값이 선택된 상태라면 배열에 추가하고, 그렇지 않다면 배열에서 제거합니다.
        const convenienceValue = btn.value;
        if (btn.classList.contains('active')) {
            selectedConvenience.push(convenienceValue);
        } else {
        	selectedConvenience = selectedConvenience.filter(convenience => convenience !== convenienceValue);
        }

        // 선택된 기술들을 확인하기 위해 콘솔에 출력합니다.
        console.log(selectedConvenience);

        // 선택된 기술들의 값을 hidden input에 설정하여 폼으로 전송합니다.
        const convenienceInput = document.getElementById('selectedConvenience');
        convenienceInput.value = selectedConvenience.join(',');
    });
});

// 페이지가 로드될 때 선택된 기술들의 값을 hidden input에 설정합니다.
window.addEventListener('DOMContentLoaded', () => {
    const categoryInput = document.getElementById('selectedCategory');
    const locationInput = document.getElementById('selectedLocation');
    categoryInput.value = selectedCategory.join(',');
    locationInput.value = selectedLocation.join(',');
});
</script>
    <!-- 날짜 선택기용 HTML -->
   
     <script>
        let selectedFiles = [];

        document.getElementById('AddFileBtn').addEventListener('click', function(e) {
        	 e.preventDefault();
            document.getElementById('file').click();
        });

        document.getElementById('file').addEventListener('change', function(event) {
            const files = Array.from(event.target.files);
            
            // Update selectedFiles array
            selectedFiles = selectedFiles.concat(files);

            // Clear the previous previews
            const previewContainer = document.getElementById('preview-container');
            previewContainer.innerHTML = '';

            selectedFiles.forEach(file => {
                if (file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        previewContainer.appendChild(img);
                    };

                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const startDateInput = document.getElementById('start_date');
        const endDateInput = document.getElementById('end_date');
        const datePickerInput = document.getElementById('datePickerInput');
        const form = document.getElementById('myForm');

        // 날짜 포맷 함수
        const formatDate = (date) => {
            if (!date) return '';
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            return year + '/' + month + '/' + day;
        };

        // Flatpickr 설정
        flatpickr(datePickerInput, {
            mode: "range",
            dateFormat: "Y-m-d",
            locale: {
                firstDayOfWeek: 0,
                weekdays: {
                    shorthand: ['일', '월', '화', '수', '목', '금', '토'],
                    longhand: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
                },
                months: {
                    shorthand: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    longhand: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
                }
            },
            onChange: (selectedDates) => {
                if (selectedDates.length === 2) {
                    const [startDate, endDate] = selectedDates;
                    const startDateStr = formatDate(new Date(startDate));
                    const endDateStr = formatDate(new Date(endDate));
                    startDateInput.value = startDateStr;
                    endDateInput.value = endDateStr;
                    datePickerInput.value = '날짜를 선택하세요';

                    // 선택된 날짜 확인을 위한 콘솔 출력
                    console.log(`시작 날짜: ${startDateStr}`);
                    console.log(`끝 날짜: ${endDateStr}`);
                } else {
                    startDateInput.value = '시작 날짜';
                    endDateInput.value = '끝 날짜';
                    datePickerInput.value = '날짜를 선택하세요';
                }
            }
        });

        // 폼 제출 이벤트 리스너
        form.addEventListener('submit', (event) => {
            if (!startDateInput.value || !endDateInput.value) {
                event.preventDefault();
                alert('시작 날짜와 끝 날짜를 선택해 주세요.');
            }
        });
    });
    </script>
</body>

</html>
