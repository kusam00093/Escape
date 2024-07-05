<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<style>

#container1 {
  width : 80%;
  margin : 0 auto;
  margin-left : 250px;
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start
}

#container1 > .content1, #container1 > .sidebar1 {
  padding: 30px;
  border: 1px solid #ccc
}

#container1 .content1 {
  width: calc(70% - 20px);
  min-height: 1200px;
}

#container1 .content1 p, #container1 .sidebar1 p {
  font-size: 18px;
  line-height: 1.8
}

#container1 .sidebar1 {
  position: sticky;
  top: 20px;
  width: 300px; 
  margin-left: 20px;
  background-color: #ffe3e3
}

.sidebar-section {
  margin-bottom: 20px;
}

.sidebar-section h4 {
  margin-bottom: 10px;
}

.sidebar-section table {
  width: 100%;
  border-collapse: collapse;
}

.sidebar-section table, .sidebar-section th, .sidebar-section td {
  border: 1px solid #ccc;
  padding: 10px;
}

.sidebar-section button {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.sidebar-section button:hover {
  background-color: #0056b3;
}

.sidebar-section .comment {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  resize: vertical;
}


.rating {
  float: none;
  width: 200px;
  display: flex;
  justify-content: flex-start; /* 왼쪽 정렬 */
}

.rating__input {
  display: none;
}

.rating__label {
  width: 20px;
  overflow: hidden;
  cursor: pointer;
}

.rating__label .star-icon {
  width: 20px;
  height: 40px;
  display: block;
  position: relative;
  left: 0;
  background-image: url("/images/star.svg");
  background-repeat: no-repeat;
  background-size: 40px;
}

.rating__label .star-icon.filled {
  background-image: url("/images/star_fill.svg");
}

.rating__label--full .star-icon {
  background-position: right;
}

.rating__label--half .star-icon {
  background-position: left;
}

.rating.readonly .star-icon {
  opacity: 0.7;
  cursor: default;
}
.rating__label--half .star-icon {
    background-position: left;
}

.rating__label.half-filled .star-icon {
    background-position: left;
    width: 30px; /* 반 채워진 별의 너비 설정 */
}







.table{
	border : 1px solid #0D0D0D;
}



/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/
.datepicker td, .datepicker th {
    width: 2.5rem;
    height: 2.5rem;
    font-size: 0.85rem;
}

.datepicker {
    margin-bottom: 3rem;
}




.input-group {
    border-radius: 30rem;
}

input.form-control {
    border-radius: 30rem 0 0 30rem;
    border: none;
}

input.form-control:focus {
    box-shadow: none;
}

input.form-control::placeholder {
    font-style: italic;
}

.input-group-text {
    border-radius: 0 30rem 30rem 0;
    border: none;
}

.datepicker-dropdown {
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

        .container3 {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .row {
            display: flex;
            width: 100%;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .row.first-row img {
            width: 100%;
        }
        .row.second-row img {
            width: calc(33.33% - 5px); /* Subtract margin */
        }
        .row.second-row img:nth-child(3) {
            width: calc(34% - 5px); /* Subtract margin */
        }
        
        
        
        
        
        
        
        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.8);
        }
        .modal-content {
            margin: auto;
            display: block;
            max-width: 80%;
            max-height: 80%;
            text-align: center;
            position: relative;
        }
        .modal-content img {
            width: 100%;
            height: auto;
        }
        .modal-content .slide-container {
            position: relative;
            display: inline-block;
        }
        .modal-content .slide {
            display: none;
        }
        .modal-content .slide.active {
            display: block;
        }
        .modal-content button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
        }
        .modal-content .prev {
            left: 10px;
        }
        .modal-content .next {
            right: 10px;
        }
        
        
        .detail_rate {
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .detail_rate_content1 {
            width: 25%;
            padding: 20px;
            background-color: #f9f9f9;
            border-right: 1px solid #ddd;
            text-align: left;
        }
        .detail_rate_content2 {
            width: 75%;
            padding: 20px;
        }
        .detail_rate_star {
            margin-bottom: 20px;
        }
        .detail_rate_star h2 {
            margin: 0;
            font-size: 48px;
            color: #ffcc00;
        }
       
        .review_img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .review {
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .button2, .button3 {
            background-color: #ffcc00;
            border: none;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button2:hover, .button3:hover {
            background-color: #ffa500;
        }




.review_img{
	width: 100px;
	height: 100px;
}    


        .review1 {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            position: relative;
        }
        .review-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .reviewer {
            font-style: italic;
            color: #666;
            margin-bottom: 5px;
        }
        .rating {
            color: #f90;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .review-content {
            line-height: 1.6;
        }
        .review-img {
            position: static;
            top: 10px;
            right: 10px;
            width: 100px;
            height: auto;
        }
        
        
        
        
        .container4 {
            display: flex;
            align-items: center;
            background: white;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .counter {
            font-size: 1.5em;
            margin: 0 20px;
            width: 80px; /* 고정된 너비를 설정 */
            text-align: center; /* 텍스트 중앙 정렬 */
            transition: color 0.3s;
        }
        .button {
            font-size: 1em;
            padding: 10px 20px;
            cursor: pointer;
            margin: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            transition: background-color 0.3s, transform 0.3s;
        }
        .button:active {
            transform: scale(0.98);
        }
        .button:hover {
            background-color: #0056b3;
        }




    .flex-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
    }
    .button-container {
      display: flex;
      gap: 10px; /* 버튼 사이의 간격 조절 */
      margin-left: auto;
    }
        
        
    /* 모달 스타일 */
    .modal2 {
      display: none;
      position: fixed;
      z-index: 9999;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.5);
    }
    
    .modal2-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
      animation-name: animatetop;
      animation-duration: 0.4s
    }
    
    @keyframes animatetop {
      from {top: -300px; opacity: 0}
      to {top: 0; opacity: 1}
    }
    
    .close {
      color: #aaaaaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      cursor: pointer;
    }
    
    .close:hover,
    .close:focus {
      color: #000;
      text-decoration: none;
    }
    
    
    
    
    
    
    
    
    
    
    
    
.wrap {
    display: flex;
    justify-content: center;
    flex-direction: column;
    gap: 32px;
}

h1 {
    font-size: 40px;
    font-weight: 600;
}

.rating {
    float: none;
    width: 200px;
    display: flex;

    &__input {
        display: none;
    }

    &__label {
        width: 20px;
        overflow: hidden;
        cursor: pointer;

        .star-icon {
            width: 20px;
            height: 40px;
            display: block;
            position: relative;
            left: 0;
            background-image: url('https://velog.velcdn.com/images/jellykelly/post/9957327f-f358-4c25-9989-5bb3dd5755d6/image.svg');
            background-repeat: no-repeat;
            background-size: 40px;
          
            &.filled {
                background-image: url(' https://velog.velcdn.com/images/jellykelly/post/10caf033-b0ef-4d58-804b-6e33395e4ea5/image.svg');
        }

        &--full .star-icon {
            background-position: right;
        }

        &--half .star-icon {
            background-position: left;
        }
    }

    &.readonly {
        .star-icon {
            opacity: 0.7;
            cursor: default;
        }
    }
}




        .img-thumbnail {
            max-width: 100px; /* 최대 너비 100px로 설정 */
            max-height: 100px; /* 최대 높이 100px로 설정 */
            margin: 10px; /* 이미지 사이의 간격 설정 */
        }
</style> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
<form action="/Package/Detail/Update" method="post" id="myForm" enctype="multipart/form-data" >
 <div id="container1" >
 
  <div class="content1">
  <div>제목 : <input type="text" value="${ packageVo.title }" name="title"></div>
  <div>가격 : <input type="text" value="${ price }" name="price"></div>
  <div>상세정보 :<input type="text" value="${ detail1 }" name="detail1"></div>
  <div>상세정보 :<input type="text" value="${ detail2 }" name="detail2"></div>
  <div>상세정보 :<input type="text" value="${ detail3 }" name="detail3"></div>
 	

<div>주소</div>
  <div><input type="text" name="zip_code" placeholder="우편번호" readonly="readonly" value="123452"/></div>
 <div> <input type="button"  onclick="daumPost()" value="우편번호 찾기" /></div>
  <br><div><input type="text" name="address1" placeholder="상세주소" value="서울"></div></br>
  <br><div><input type="text" name="address2" placeholder="상세주소" value="강남"></div></br>


        
        <div id="preview-container"></div>
        		<c:forEach var="lo" items="${ imageList }">
 					<div><img alt="" src="${ lo.image }" style="width: 100px; height: 100px; margin: 10px;"></div>       		
		</c:forEach>
        <input type="file" name="file" id="file" multiple style="display: none;">
        <button id="AddFileBtn">이미지 추가</button>


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

    
        <div class="container">
            <input type="text" id="datePickerInput" class="date-input" placeholder="날짜를 선택하세요" readonly>
            <input type="text" name="start_date" id="start_date" placeholder="시작 날짜" readonly >
            <input type="text" name="end_date" id="end_date" placeholder="끝 날짜" readonly>
        </div>
        <hr>
        
    <div>할인</div>
    <input type="checkbox" id="discountCheckbox" value="할인을 하시려면 체크해주세요">
    <div id="percentageInputContainer" name="discount_percent"></div>

<hr>



<hr>

<div class=detail>

</div>

<hr>




</div>
<hr>





</div>

<h4></h4>
<div>

</div>

<hr>




<input type="submit" value="수정하기">

</form>>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd92b81e9a491dc389672165f361ad1a&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

<script>
document.addEventListener('DOMContentLoaded', () => {
    var fileInput = document.getElementById('file');
    var previewContainer = document.getElementById('preview-container');
    var fileAddBtn = document.getElementById('file-add-btn');

    // 파일 추가 버튼 클릭 시 파일 선택 input 클릭 이벤트 발생
    fileAddBtn.addEventListener('click', function () {
        fileInput.click(); // 파일 선택 input을 클릭하여 파일 선택 창 열기
    });

    // 파일 선택 input의 change 이벤트 처리
    fileInput.addEventListener('change', function () {
        // 미리보기 컨테이너 초기화
        previewContainer.innerHTML = '';

        // 선택된 모든 파일에 대해 반복 처리
        for (let i = 0; i < fileInput.files.length; i++) {
            let file = fileInput.files[i];
            let reader = new FileReader();

            reader.onload = function (e) {
                // 이미지 태그를 생성하고 미리보기 이미지 설정
                let img = new Image();
                img.src = e.target.result;
                img.className = 'img-thumbnail';
                img.style.width = '100px'; // 원하는 너비
                img.style.height = '100px'; // 원하는 높이

                // 파일 이름 표시
                let fileNamePara = document.createElement('p');
                fileNamePara.textContent = file.name; // 파일 이름 설정
                previewContainer.appendChild(fileNamePara); // 파일 이름 추가
                previewContainer.appendChild(img); // 이미지 추가
            };

            // FileReader를 사용하여 파일 읽기 시작
            reader.readAsDataURL(file);
        }
    });

    // 폼 제출 시
    document.querySelector('form').addEventListener('submit', async function (e) {
        e.preventDefault(); // 기본 제출 동작 방지

        const formData = new FormData(this); // FormData 객체 생성

        // FormData 객체에 파일 추가 (이미 파일들은 fileInput에 포함되어 있음)
        // 파일 선택 input의 name 속성은 이미 "file"로 설정되어 있음
        try {
            const response = await fetch(this.action, {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                // 성공적으로 제출된 경우
                const result = await response.json();
                console.log('성공:', result);
                // 성공 후 행동
            } else {
                // 실패한 경우
                console.error('실패:', response.statusText);
                // 실패 후 행동
            }
        } catch (error) {
            console.error('에러:', error);
        }
    });
});

    </script>

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

<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
