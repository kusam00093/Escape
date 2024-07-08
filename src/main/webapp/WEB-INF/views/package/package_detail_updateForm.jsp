<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-control {
    border-radius: 1.25rem;
    border: 1px solid #ced4da;
    padding: 0.75rem 1rem;
    margin-bottom: 15px;
}

.btn {
    border-radius: 1.25rem;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

.form-label {
    font-size: 18px;
    font-weight: bold;
    margin-top: 10px;
    margin-bottom: 5px;
}

.img-thumbnail {
    max-width: 100px;
    max-height: 100px;
    margin: 10px;
    border: none;
}

.checkbox-label {
    font-size: 16px;
    margin-bottom: 10px;
}

.date-input {
    padding: 10px;
}

.detail {
    margin-top: 20px;
}

hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
}

@media (max-width: 576px) {
    .container {
        padding: 10px;
    }
    .form-control {
        width: 100%;
    }
}

.form-group {
    margin-bottom: 15px;
}

.content1 {
    margin-bottom: 20px;
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
</head>
<body>
<form action="/Package/Detail/Update" method="post" id="myForm" enctype="multipart/form-data">
    <div id="container1">
        <div class="content1">
            <div class="form-group">제목 : <input type="text" value="${packageVo.title}" name="title"></div>
            <div class="form-group">가격 : <input type="text" value="${packageVo.price}" name="price"></div>
            <div class="form-group">상세정보 : <input type="text" value="${packageVo.detail1}" name="detail1"></div>
            <div class="form-group">상세정보 : <input type="text" value="${packageVo.detail2}" name="detail2"></div>
            <div class="form-group">상세정보 : <input type="text" value="${packageVo.detail3}" name="detail3"></div>

            <div>주소</div>
            <div><input type="text" name="zip_code" placeholder="우편번호" readonly="readonly" value="123452"/></div>
            <div><input type="button" onclick="daumPost()" value="우편번호 찾기"></div>
            <br><div><input type="text" name="address1" placeholder="상세주소" value="서울"></div></br>
            <br><div><input type="text" name="address2" placeholder="상세주소" value="강남"></div></br>

            <div id="preview-container"></div>
            <c:forEach var="lo" items="${imageList}">
                <div><img alt="" src="${lo.image}" style="width: 100px; height: 100px; margin: 10px;"></div>
            </c:forEach>
            <input type="file" name="file" id="file" multiple style="display: none;">
            <button id="AddFileBtn">이미지 추가</button>

            <label for="location" class="form-label">국가를 선택하세요 (중복가능)</label>
            <c:forEach var="lo" items="${locationList}">
                <div class="col-auto">
                    <button type="button" class="btn btn-outline-primary location-btn" name="location_idx" value="${lo.location_idx}">
                        ${lo.name}
                        <!-- package_convenienceList에 있는 항목과 일치하면 체크 표시 추가 -->
                        <c:forEach var="plo" items="${package_locationList}">
                            <c:if test="${plo.location_idx == lo.location_idx}">
                                &#x2713; <!-- 체크 표시 (✔) -->
                                <!-- 일치하는 항목을 찾으면 루프 종료 -->
                                <c:set var="found" value="true" scope="page" />
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
            </c:forEach>
            <input type="hidden" id="selectedLocation" name="location_idx">

            <!-- package_convenienceList는 화면에 보이지 않도록 숨깁니다 -->
            <div style="display: none;">
                <c:forEach var="lo" items="${package_locationList}">
                    <button type="button" class="btn btn-outline-danger location-btn" name="location_idx" value="${lo.location_idx}">
                        ${lo.name}
                    </button>
                </c:forEach>
            </div>
            <hr>

            <label for="category" class="form-label">카테고리를 선택하세요 (중복가능)</label>
            <c:forEach var="lo" items="${categoryList}">
                <div class="col-auto">
                    <button type="button" class="btn btn-outline-primary category-btn" name="category_idx" value="${lo.category_idx}">
                        ${lo.name}
                        <!-- package_locationList에 있는 항목과 일치하면 체크 표시 추가 -->
                        <c:forEach var="plo" items="${package_categoryList}">
                            <c:if test="${plo.category_idx == lo.category_idx}">
                                &#x2713; <!-- 체크 표시 (✔) -->
                                <!-- 일치하는 항목을 찾으면 루프 종료 -->
                                <c:set var="found" value="true" scope="page" />
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
            </c:forEach>
            <input type="hidden" id="selectedCategory" name="category_idx">

            <!-- package_locationList는 화면에 보이지 않도록 숨깁니다 -->
            <div style="display: none;">
                <c:forEach var="lo" items="${package_categotyList}">
                    <button type="button" class="btn btn-outline-danger category-btn" name="category_idx" value="${lo.category_idx}">
                        ${lo.name}
                    </button>
                </c:forEach>
            </div>

            <hr>
            <label for="convenience" class="form-label">기타 사항을 선택하세요 (중복가능)</label>
            <c:forEach var="lo" items="${convenienceList}">
                <div class="col-auto">
                    <button type="button" class="btn btn-outline-primary convenience-btn" name="convenience_idx" value="${lo.convenience_idx}">
                        ${lo.name}
                        <!-- package_convenienceList에 있는 항목과 일치하면 체크 표시 추가 -->
                        <c:forEach var="plo" items="${package_convenienceList}">
                            <c:if test="${plo.convenience_idx == lo.convenience_idx}">
                                &#x2713; <!-- 체크 표시 (✔) -->
                                <!-- 일치하는 항목을 찾으면 루프 종료 -->
                                <c:set var="found" value="true" scope="page" />
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
            </c:forEach>
            <input type="hidden" id="selectedConvenience" name="convenience_idx">

            <!-- package_convenienceList는 화면에 보이지 않도록 숨깁니다 -->
            <div style="display: none;">
                <c:forEach var="lo" items="${package_convenienceList}">
                    <button type="button" class="btn btn-outline-danger convenience-btn" name="convenience_idx" value="${lo.convenience_idx}">
                        ${lo.name}
                    </button>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="datePickerInput" class="form-label">날짜 선택</label>
                <input type="text" id="datePickerInput" class="date-input" placeholder="날짜를 선택하세요" readonly>
                <input type="text" name="start_date" id="start_date" class="form-control" placeholder="시작 날짜" readonly>
                <input type="text" name="end_date" id="end_date" class="form-control" placeholder="끝 날짜" readonly>
            </div>
            <hr>

            <div>할인</div>
            <input type="checkbox" id="discountCheckbox" value="할인을 하시려면 체크해주세요">
            <div id="percentageInputContainer" name="discount_percent"></div>

            <hr>

            <div class=detail>

            </div>

            <hr>
        </div>
    </div>

    <hr>

    <input type="submit" value="수정하기">
</form>
<button id="Delete">삭제하기</button>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd92b81e9a491dc389672165f361ad1a&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
document.getElementById('discountCheckbox').addEventListener('change', function() {
	  const percentageInputContainer = document.getElementById('percentageInputContainer');

	  if (this.checked) {
	    // 기존의 입력 필드가 있다면 제거
	    const existingInput = document.getElementById('percentageInput');
	    if (existingInput) {
	      percentageInputContainer.removeChild(existingInput.parentNode); // 래퍼 div와 입력 필드 모두 제거
	    }

	    // 줄을 추가하는 <br> 태그 생성
	    const lineBreak = document.createElement('br');
	    percentageInputContainer.appendChild(lineBreak);

	    // 새 입력 필드 생성
	    const input = document.createElement('input');
	    input.type = 'number';
	    input.id = 'percentageInput';
	    input.name = 'discount_percent';
	    input.className = 'form-control'; // 기본 폼 컨트롤 클래스
	    input.placeholder = '할인 퍼센티지를 입력하세요';
	    input.min = '1';
	    input.max = '100';

	    // 입력값 유효성 검사
	    input.addEventListener('input', function() {
	      const value = parseInt(input.value, 10);
	      if (value < 1 || value > 100) {
	        alert('1부터 100까지의 숫자만 입력하세요');
	        input.value = '';
	      }
	    });

	    // 줄 간격을 위한 div 래퍼 추가
	    const wrapper = document.createElement('div');
	    wrapper.className = 'mt-2'; // margin-top-2 클래스로 간격 추가
	    wrapper.appendChild(input);

	    // 새로운 입력 필드를 <div> 아래에 추가
	    percentageInputContainer.appendChild(wrapper);
	  } else {
	    // 체크박스가 해제되면 추가된 태그만 제거
	    const existingInput = document.getElementById('percentageInput');
	    if (existingInput) {
	      percentageInputContainer.removeChild(existingInput.parentNode); // 래퍼 div와 입력 필드 모두 제거
	    }

	    // 추가된 <br> 태그도 제거
	    const lineBreak = percentageInputContainer.querySelector('br');
	    if (lineBreak) {
	      percentageInputContainer.removeChild(lineBreak);
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
					
                    // Set the image size
                    img.style.width = '100px';
                    img.style.height = '100px';
                    img.style.margin = '10px';
                    img.style.objectFit = 'cover'; // Optional: to maintain aspect ratio and fill the box

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

    const formatDate = (date) => {
      if (!date) return '';
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      return year + '/' + month + '/' + day;
    };

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

          console.log(`시작 날짜: ${startDateStr}`);
          console.log(`끝 날짜: ${endDateStr}`);
        } else {
          startDateInput.value = '';
          endDateInput.value = '';
          datePickerInput.value = '날짜를 선택하세요';
        }
      }
    });

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
