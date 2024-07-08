<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
<style>
  /* 기본 스타일 */
  body {
    font-family: 'Rajdhani', sans-serif;
    background-color: #f5f5f5;
    color: #333;
    margin: 0;
    padding: 20px;
    box-sizing: border-box;
  }

  .container1 {
    max-width: 800px;
    margin: 0 auto;
    padding: 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  h1 {
    margin-bottom: 30px;
    font-size: 28px;
    text-align: center;
    color: #007bff;
  }

  /* 버튼 스타일 */
  button {
    padding: 12px 24px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #0056b3;
  }

  /* 위치 및 카테고리 버튼 */
  .btn-group {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 20px;
  }

  .btn-group .btn {
    flex: 1;
    font-size: 14px;
    padding: 10px;
  }

  /* 버튼 활성화 상태 */
  .btn.active {
    background-color: #0056b3;
    border-color: #0056b3;
  }

  /* 폼 필드 스타일 */
  .form-control {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ced4da;
    border-radius: 6px;
    margin-bottom: 20px;
    box-sizing: border-box;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
  }

  .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
  }

  .form-label {
    font-weight: bold;
    margin-bottom: 8px;
    display: block;
    color: #333;
  }

  .textarea-control {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ced4da;
    border-radius: 6px;
    margin-bottom: 20px;
    box-sizing: border-box;
    resize: vertical;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
  }

  .textarea-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
  }

  .date-input {
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ced4da;
    border-radius: 6px;
    width: 100%;
    box-sizing: border-box;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
  }

  .date-input:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
  }

  #preview-container img {
    width: 100px;
    height: 100px;
    margin: 10px;
    object-fit: cover;
    border-radius: 6px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  .checkbox-container {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }

  .checkbox-container input[type="checkbox"] {
    margin-right: 10px;
  }

  .checkbox-container .form-label {
    margin-bottom: 0;
    font-weight: normal;
  }

  .form-actions {
    display: flex;
    justify-content: center;
    margin-top: 30px;
  }

  .form-actions button {
    background-color: #28a745;
    border-color: #28a745;
  }

  .form-actions button:hover {
    background-color: #218838;
    border-color: #1e7e34;
  }

  /* 우편번호 찾기 버튼 스타일 */
  .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
  }

  .btn-primary:hover {
    background-color: #0056b3;
    border-color: #00409a;
  }

  hr {
    border: 0;
    border-top: 1px solid #e0e0e0;
    margin: 20px 0;
  }

  .mt-2 {
    margin-top: 10px;
  }

  .mt-3 {
    margin-top: 20px;
  }


.checkbox-container {
  display: flex;
  flex-direction: column; /* 컨테이너의 방향을 세로로 설정 */
  align-items: flex-start; /* 자식 요소들을 왼쪽 정렬 */
}

/* .checkbox-container .form-label { */
/*   margin-bottom: 10px; /* 레이블과 입력 필드 사이의 간격 조정 */ */
/* } */

#percentageInputContainer {
/*   margin-top: 10px; /* 컨테이너와 다른 요소 사이의 간격 조정 */ */
  padding-left: 0; /* 왼쪽 여백 제거 */
  display: flex;
  flex-direction: column; /* 입력 필드와 줄바꿈이 수직으로 배치되도록 설정 */
  align-items: flex-start; /* 왼쪽 정렬 */
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>
</head>

<body>

<div class="container1">
  <h1>패키지 작성</h1>

  <form action="/Package/Detail/Update" method="post" id="myForm" enctype="multipart/form-data">
  	<input type="hidden" value="${ packageVo.package_idx }" name="package_idx">
    <input type="hidden" value="${ user_idx }" name="user_idx">

    <div class="form-group">
      <label for="title" class="form-label">제목</label>
      <input type="text" id="title" name="title" class="form-control"  value="${ packageVo.title }">
    </div>
    <hr>

    <div class="form-group">
      <label for="price" class="form-label">가격</label>
      <input type="text" id="price" name="price" class="form-control" placeholder="가격을 입력하세요"  value="${ packageVo.price }">
    </div>
    <hr>

    <div class="form-group">
      <label for="detail1" class="form-label">상세 내용 1</label>
      <textarea id="detail1" name="detail1" class="form-control" rows="4" placeholder="상세 내용 1">${ pcakageVo.detail1 }</textarea>
    </div>
    <div class="form-group">
      <label for="detail2" class="form-label">상세 내용 2</label>
      <textarea id="detail2" name="detail2" class="form-control" rows="4" placeholder="상세 내용 2">${ pcakageVo.detail2 }</textarea>
    </div>
    <div class="form-group">
      <label for="detail3" class="form-label">상세 내용 3</label>
      <textarea id="detail3" name="detail3" class="form-control" rows="4" placeholder="상세 내용 3">${ pcakageVo.detail3 }</textarea>
    </div>

    <hr>

    <div class="form-group">
      <label for="location" class="form-label">국가를 선택하세요 (중복가능)</label>
      <div class="btn-group">
            <c:forEach var="lo" items="${locationList}">
                <div class="col-auto">
                    <button type="button" class="btn btn-outline-primary location-btn" name="location_idx" value="${lo.location_idx}">
                        ${lo.name}
                        <c:forEach var="plo" items="${package_locationList}">
                            <c:if test="${plo.location_idx == lo.location_idx}">
                                &#x2713;
                                <c:set var="found" value="true" scope="page" />
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
            </c:forEach>
            <input type="hidden" id="selectedLocation" name="location_idx">

            <div style="display: none;">
                <c:forEach var="lo" items="${package_locationList}">
                    <button type="button" class="btn btn-outline-danger location-btn" name="location_idx" value="${lo.location_idx}">
                        ${lo.name}
                    </button>
                </c:forEach>
            </div>
            </div>
            </div>
            

    <hr>

    <div class="form-group">
      <label for="category" class="form-label">카테고리를 선택하세요 (중복가능)</label>
      <div class="btn-group">
            <c:forEach var="lo" items="${categoryList}">
                <div class="col-auto">
                    <button type="button" class="btn btn-outline-primary category-btn" name="category_idx" value="${lo.category_idx}">
                        ${lo.name}
                        <c:forEach var="plo" items="${package_categoryList}">
                            <c:if test="${plo.category_idx == lo.category_idx}">
                                &#x2713;
                                <c:set var="found" value="true" scope="page" />
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
            </c:forEach>
            <input type="hidden" id="selectedCategory" name="category_idx">

            <div style="display: none;">
                <c:forEach var="lo" items="${package_categotyList}">
                    <button type="button" class="btn btn-outline-danger category-btn" name="category_idx" value="${lo.category_idx}">
                        ${lo.name}
                    </button>
                </c:forEach>
            </div>
     </div>
            </div>
    <hr>

    <div class="form-group">
      <label for="convenience" class="form-label">기타 사항을 선택하세요 (중복가능)</label>
      <div class="btn-group">
           <c:forEach var="lo" items="${convenienceList}">
                <div class="col-auto">
                    <button type="button" class="btn btn-outline-primary convenience-btn" name="convenience_idx" value="${lo.convenience_idx}">
                        ${lo.name}
                        <c:forEach var="plo" items="${package_convenienceList}">
                            <c:if test="${plo.convenience_idx == lo.convenience_idx}">
                                &#x2713; 
                                <c:set var="found" value="true" scope="page" />
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
            </c:forEach>
            <input type="hidden" id="selectedConvenience" name="convenience_idx">

            <div style="display: none;">
                <c:forEach var="lo" items="${package_convenienceList}">
                    <button type="button" class="btn btn-outline-danger convenience-btn" name="convenience_idx" value="${lo.convenience_idx}">
                        ${lo.name}
                    </button>
                </c:forEach>
            </div>
     </div>
            </div>
    <hr>

    <div class="form-group">
      <label for="zip_code" class="form-label">우편번호</label>
      <input type="text" id="zip_code" name="zip_code" class="form-control" placeholder="우편번호" readonly value="123452">
      <button type="button" class="btn btn-primary mt-2" onclick="daumPost()">우편번호 찾기</button>
    </div>
    <div class="form-group">
      <label for="address1" class="form-label">주소</label>
      <input type="text" id="address1" name="address1" class="form-control" placeholder="상세주소" value="서울">
    </div>
    <div class="form-group">
      <label for="address2" class="form-label">상세 주소</label>
      <input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소" value="강남">
    </div>

    <hr>
    <div class="form-group">
      <label for="file" class="form-label">이미지 추가</label>
                  <c:forEach var="lo" items="${imageList}">
                <div><img alt="" src="${lo.image}" style="width: 100px; height: 100px; margin: 10px;"></div>
            </c:forEach>
      <button type="button" id="AddFileBtn" class="btn btn-secondary">이미지 추가</button>
      <input type="file" name="file" id="file" multiple style="display: none;">
      <div id="preview-container" class="mt-3"></div>
    </div>

    <hr>

    <div class="form-group">
      <label for="limited_person" class="form-label">제한 인원</label>
      <input type="number" id="limited_person" name="limited_person" class="form-control" min="1" max="2000" step="1" value="${ packageVo.limited_person }">
    </div>

    <hr>

    <div class="form-group">
      <label for="datePickerInput" class="form-label">날짜 선택</label>
      <input type="text" id="datePickerInput" class="date-input" placeholder="날짜를 선택하세요" >
      <input type="text" name="start_date" id="start_date" class="form-control" placeholder="시작 날짜" value="${packageVo.start_date }">
      <input type="text" name="end_date" id="end_date" class="form-control" placeholder="끝 날짜" value="${packageVo.end_date }">
    </div>

    <hr>

    <div class="checkbox-container">
      <input type="checkbox" id="discountCheckbox" value="할인을 하시려면 체크해주세요">
      <label for="discountCheckbox" class="form-label">할인</label>
      <div id="percentageInputContainer" name="discount_percent"></div>
    </div>

    <div class="form-actions">
      <button type="submit" class="btn btn-success">제출하기</button>
    </div>
  </form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
  function daumPost() {
    new daum.Postcode({
      oncomplete: function(data) {
        var fullAddr = '';
        var extraAddr = '';

        if (data.userSelectedType === 'R') {
          fullAddr = data.roadAddress;
        } else {
          fullAddr = data.jibunAddress;
        }

        if(data.userSelectedType === 'R'){
          if(data.bname !== ''){
            extraAddr += data.bname;
          }
          if(data.buildingName !== ''){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
          }
          fullAddr += extraAddr;
        }

        document.getElementsByName('zip_code')[0].value = data.zonecode;
        document.getElementsByName('address1')[0].value = fullAddr;
        document.getElementsByName('address1')[0].focus();
      }
    }).open();
  }
</script>

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
  let selectedCategory = [];
  let selectedLocation = [];
  let selectedConvenience = [];

  const categoryBtns = document.querySelectorAll('.category-btn');
  const locationBtns = document.querySelectorAll('.location-btn');
  const convenienceBtns = document.querySelectorAll('.convenience-btn');

  categoryBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
      const categoryValue = btn.value;
      if (btn.classList.contains('active')) {
        selectedCategory.push(categoryValue);
      } else {
        selectedCategory = selectedCategory.filter(category => category !== categoryValue);
      }
      const categoryInput = document.getElementById('selectedCategory');
      categoryInput.value = selectedCategory.join(',');
    });
  });

  locationBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
      const locationValue = btn.value;
      if (btn.classList.contains('active')) {
        selectedLocation.push(locationValue);
      } else {
        selectedLocation = selectedLocation.filter(location => location !== locationValue);
      }
      const locationInput = document.getElementById('selectedLocation');
      locationInput.value = selectedLocation.join(',');
    });
  });

  convenienceBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
      const convenienceValue = btn.value;
      if (btn.classList.contains('active')) {
        selectedConvenience.push(convenienceValue);
      } else {
        selectedConvenience = selectedConvenience.filter(convenience => convenience !== convenienceValue);
      }
      const convenienceInput = document.getElementById('selectedConvenience');
      convenienceInput.value = selectedConvenience.join(',');
    });
  });

  window.addEventListener('DOMContentLoaded', () => {
    const categoryInput = document.getElementById('selectedCategory');
    const locationInput = document.getElementById('selectedLocation');
    categoryInput.value = selectedCategory.join(',');
    locationInput.value = selectedLocation.join(',');
  });
</script>

<script>
  let selectedFiles = [];

  document.getElementById('AddFileBtn').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('file').click();
  });

  document.getElementById('file').addEventListener('change', function(event) {
    const files = Array.from(event.target.files);
    selectedFiles = selectedFiles.concat(files);
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
</body>
</html>