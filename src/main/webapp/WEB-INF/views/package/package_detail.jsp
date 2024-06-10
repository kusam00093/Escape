<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
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
  background-color: #e9ecef
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
  background-image: url("/img/star_fill.svg");
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
</style> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="starRating.css"/>

</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
 <div id="container1">
 
  <div class="content1">
 	<h2> 제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</h2>
 	<div class="rating" style="margin-left: 50px;">
    <label class="rating__label rating__label--half" for="starhalf">
        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--full" for="star1">
        <input type="radio" id="star1" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--half" for="starhalf">
        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--full" for="star1">
        <input type="radio" id="star1" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--half" for="starhalf">
        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--full" for="star1">
        <input type="radio" id="star1" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--half" for="starhalf">
        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--full" for="star1">
        <input type="radio" id="star1" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--half" for="starhalf">
        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
    <label class="rating__label rating__label--full" for="star1">
        <input type="radio" id="star1" class="rating__input" name="rating" value="">
        <span class="star-icon"></span>
    </label>
</div>

<hr>
<div class="convenienceList">

	<c:forEach var="co" items="${ coList }">
		<div class="convenience_container">
				<button type="button" class="convenience_btn" name="convenience_idx" value="${ co.convenience_idx }" style="width: 200px; height: 50px;">${co.name }</button>
		</div>
	</c:forEach>
</div>
<hr>




  </div>

  <aside class="sidebar1">
    <div class="sidebar-section">
      <h4>금액/제한인원</h4>
      <p>금액: 100,000원</p>
      <p>제한 인원: 10명</p>
    </div>

    <div class="sidebar-section">
      <h4>테이블</h4>
      <table>
        <tr>
          <th>헤더</th>
          <td>내용</td>
        </tr>
      </table>
    </div>

    <div class="sidebar-section">
      <button>예약하기</button>
      <button>스크랩하기</button>
    </div>

    <div class="sidebar-section">
      <h4>코멘트</h4>
    </div>
    
  </aside>
</div>



</body>

</html>
