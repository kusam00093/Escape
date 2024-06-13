<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
<style>
  .slideshow-container {
    position: relative;
    width: 100%;
    max-width: 1050px; /* 이미지의 최대 너비 설정 */
    margin: 0 auto; /* 가운데 정렬 */
    overflow: hidden; /* 넘치는 이미지 숨기기 */
    height: 600px; /* 높이 설정 */
  }
  .slideshow-content {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .slideshow-container img {
    width: 1050px;
    height: 600px;
    object-fit: cover; /* 이미지 비율 유지 및 자르기 */
    opacity: 0; /* 초기에 모든 이미지를 투명하게 설정 */
    transition: opacity 1s ease; /* 페이드 인/아웃 효과 설정 */
    position: absolute; /* 이미지 위치 설정 */
    top: 0;
    left: 0;
  }
  .showing {
    opacity: 1 !important; /* 현재 이미지를 보이게 설정 */
  }
  .prev, .next {
    cursor: pointer;
    position: absolute;
    top: 50%;
    background-color: rgba(0, 0, 0, 0.5);
    color: #fff;
    padding: 10px;
    border: none;
    outline: none;
    z-index: 100;
  }
  .prev {
    left: 0;
    transform: translateY(-50%);
  }
  .next {
    right: 0;
    transform: translateY(-50%);
  }
  
  .h2{
  	text-align: center;
  }
  
  .slide {
    position: static;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center; /* 텍스트도 수평 가운데 정렬 */
  }

  .text {
    color: #fff;
    font-size: 50px;
    font-weight: bold;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
    opacity: 0; /* 초기에 텍스트를 투명하게 설정 */
    transition: opacity 1s ease; /* 텍스트 페이드 인/아웃 효과 설정 */
    position: absolute;
    bottom: 10px;
    left: 10px;
    right: 10px; /* 좌우 여백 설정 */
    padding-bottom: 150px;
  }
  
  h4{
  	text-align:  left;
  	font-weight: bolder;
  	padding-top: 30px;
  	padding-bottom: 30px;
  }
  .package_search_main {
    display: flex;
    justify-content: center;
    margin-bottom: 20px; /* 필요에 따라 조절 */
  }

  .package_search {
    width: 1000px; /* 원하는 넓이로 조절 */
  }

  .btn-outline-success {
    margin-left: 10px; /* 버튼과 입력 창 사이 여백 조절 */
  }
  .package_search {
    padding-left: 30px; /* 이미지를 표시할 공간 확보 */
    background-image: url('/images/icons_search.png');
    background-repeat: no-repeat;
    background-position: 5px center; /* 이미지 위치 조정 */
    background-size: 20px; /* 이미지 크기 조정 */
  }


</style> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />

</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
<h4><img src="/images/icons_best.png" class="nav_icon"/>최근 인기있는 관광 패키지</h4>

<div class="slideshow-container">
  <div class="slideshow-content">
    <button class="prev" onclick="showPrevImage()">❮</button>
    <div class="slide">
      <img src="/package_image/package_danang.jpg" class="package_img showing" />
      <div class="text">다낭 패키지</div>
    </div>
    <div class="slide">
      <img src="/package_image/package_epl.jpg" class="package_img"/>
      <div class="text">EPL 투어 패키지</div>
    </div>
    <div class="slide">
      <img src="/package_image/package_osaka.jpg" class="package_img"/>
      <div class="text">오사카 여행 패키지</div>
    </div>
    <div class="slide">
      <img src="/package_image/package_activity.jpg" class="package_img"/>
      <div class="text">다양한 액티비티 패키지</div>
    </div>
    <div class="slide">
      <img src="/package_image/package_paris.jpg" class="package_img"/>
      <div class="text">파리 여행 패키지</div>
    </div>
    <button class="next" onclick="showNextImage()">❯</button>
  </div>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>

<h4><img src="/images/icons_search_2.png" class="nav_icon"/>가고싶은곳을 검색하세요</h4>
<form class="package_search_main">
  <input class="package_search" type="search" placeholder="가고싶은 여행지를 검색하세요" aria-label="Search">
  <button class="btn btn-outline-success" type="submit">
    검색
  </button>
</form>




<script>
const images = document.querySelectorAll('.package_img');
const texts = document.querySelectorAll('.text');
let index = 0;

function showPrevImage() {
  images[index].style.opacity = '0';
  texts[index].style.opacity = '0';
  index = (index - 1 + images.length) % images.length;
  images[index].style.opacity = '1';
  texts[index].style.opacity = '1';
}

function showNextImage() {
  images[index].style.opacity = '0';
  texts[index].style.opacity = '0';
  index = (index + 1) % images.length;
  images[index].style.opacity = '1';
  texts[index].style.opacity = '1';
}

images[index].style.opacity = '1';
texts[index].style.opacity = '1';

// 5초마다 이미지 전환하기
setInterval(showNextImage, 3000);
</script>

<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
