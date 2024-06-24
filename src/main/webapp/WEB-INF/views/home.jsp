<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Escape</title> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />

<style>
        /* 스타일링을 위한 CSS */
        .search-box {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            background-color: #f2f2f2;
            border-radius: 20px; 
            padding: 10px;
            align-items: center;
            
            max-width: 650px; /* 예시로 600px로 설정 */
  			width: 100%; /* 화면 너비에 맞게 조정 */
			margin: 0 auto; /* 가운데 정렬 */
    /* 나머지 스타일은 그대로 유지 */
            
        }
        .search-box input,
        .search-box select,
        .search-box button {
            border: none;
            border-radius: 20px;
            padding: 10px;
            background-color: #e0e0e0;
        }
        .search-box input[type="date"] {
            width: 35%;
        }
        .popular-destinations {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* 이미지들을 가운데 정렬 */
        }
        .popular-destinations img {
            width: 200px;
            margin: 10px;
        }
        #title {
        padding: 30px;
        text-align: center;
        }
    </style>
</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>


<div><a href="/Board/Boardhome">메인 공고</a></div>





<body>
    <h2 id="title">Escape 경로와 일정 검색하기</h2>
    <!-- 검색란 -->
    <div class="search-box">
        <select id="destination">
            <option value="">어디로 떠나시나요?</option>
            <option value="서울">서울</option>
            <option value="부산">부산</option>
            <option value="제주">제주</option>
            <!-- 원하는 여행지를 추가하세요 -->
        </select>
        <input id="departure" type="date" placeholder="언제 출발하시나요?">
        <select id="companion">
            <option value="">몇명과 떠나시나요?</option>
            <option value="1">나혼자</option>
            <option value="2">2명</option>
            <option value="3">3명</option>
            <option value="3">4명</option>
        </select>
        <!-- 여행가는 총 인원 추가하세요 -->
        <button onclick="search()">검색하기</button>
    </div>
    
    <br>
    <br>
    <br>
    <br>

    <!-- 인기 여행지 사진 -->
    <div class="popular-destinations">
        <img src="images/삿포로.jpg" alt="여행지1">
        <img src="images/괌.jpg" alt="여행지2">
        <img src="images/사이판.jpg" alt="여행지3">
    </div>

<%@include file="/WEB-INF/include/footer.jsp"%>
    <script>
        function search() {
            var destination = document.getElementById('destination').value;
            var departure = document.getElementById('departure').value;
            var companion = document.getElementById('companion').value;

            // 검색 기능 추가
            // 여기에서 검색 로직을 추가하면 됩니다. 서버로 데이터를 보내고 받아오는 등의 작업을 수행할 수 있습니다.
            // 이 예제에서는 단순히 검색어를 콘솔에 출력하는 것으로 대체합니다.
            console.log('선택된 여행지: ' + destination);
            console.log('출발일: ' + departure);
            console.log('동행: ' + companion);
        }
    </script>
</body>

</html>