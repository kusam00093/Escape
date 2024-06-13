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
    width : 62%;
    margin : 0 auto ;
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



.more{
	width : 70%;
	margin : 0 auto;
	text-align: right;
	color: blue;
}
.more a{
	color :blue;
	
	
}
.more a:hover{
	color :#f0f;
	text-decoration: none;
	
	
}



@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

body {
  font-family: Arial, sans-serif;
}

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

* {
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
}

.container1 {
  width : 70%;
  margin : 0 auto;
  display: flex;
  flex-wrap: wrap;
  place-items: center;
  justify-content: center;
}

.card {
  width: 18rem;
  display: grid;
  overflow: hidden;
  transition: 0.4s;
  margin: 10px 10px;
  position: relative;
  border-radius: 5px;
  place-items: center;
  justify-content: center;
  background-color: #fff;
  box-shadow: 0px 0px 10px 0.1rem rgb(0 0 0 / 8%);
}

.card:hover {
  transform: translate(0px, -10px);
  box-shadow: 0px 10px 10px 0.1rem rgb(0 0 0 / 15%);
}

.card h2 {
  letter-spacing: 1px;
}

.image {
  position: relative;
}

.image img {
  max-width: 20rem;
  max-height: 20rem;
}

.image div {
  top: 0;
  left: 0;
  opacity: 1;
  height: 97%;
  width: 100%;
  font-size: 2rem;
  position: absolute;
  border-radius: 0.5rem;
}

.image:hover div {
  opacity: 0.4;
  background-color: #202020;
}

.image:hover div a {
  display: block;
}

.image div a {
  top: 50%;
  left: 50%;
  opacity: 1;
  color: #fff;
  display: none;
  font-size: 3rem;
  cursor: pointer;
  position: absolute;
  transform: translate(-50%, -50%);
}

.details {
  max-width: 90%;
  text-align: center;
  padding: 0 0 10px 0;
}

.details p:last-child {
  color: #000c;
  padding: 0px 10px;
}

.button-container {
  text-align: center;
  margin-top: 20px;
}

.button-container button {
  padding: 10px 20px;
  margin: 0 10px;
  cursor: pointer;
}
.card-container {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.card {
    flex: 0 0 25%;
}
.image {
    position: relative;
}

.icon-container {
    position: absolute;
    top: 10px; /* 상단에서의 거리 */
    right: 10px; /* 오른쪽에서의 거리 */
}

.nav_icon {
    width: 30px; /* 아이콘의 크기 */
    height: 30px;
}

  .category {
    width: 60%;
    display: flex;
    padding: 10px;
    margin: 10px auto;
    gap: 10px;
    flex-wrap: wrap; /* 요소가 너비를 넘어갈 경우 줄 바꿈 */
    justify-content: flex-start; /* 가로 중앙 정렬 */
  }

  .category_container {
    margin: 2px; /* 버튼 간격 조절을 위해 사용 */
  }

  .category_btn {
    height: 50px;
    border: none;
    border-radius: 5px;
    background-color: #f5f6f7;
    transition: box-shadow 0.3s, background-color 0.3s;
  }

  .category_btn:hover {
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
    background-color: #d9d9d9;
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


<div class="category">

	<c:forEach var="ca" items="${ categoryList }">
		<div class="category_container">
				<button type="button" class="category_btn" name="category_idx" value="${ ca.category_idx }" style="width: 200px; height: 50px;">${ca.name }</button>
		</div>
	</c:forEach>

</div>


<h4><img src="/images/icons_discount.png" class="nav_icon"/>할인중인 패키지</h4>
<div class="more">
<a  href="/Package/Home/Sub">더보기</a>
</div>
   <div class="container1">
    <div class="card-container">
  
    
      <div class="card">
        <a href="#">
    <div class="image">
        <img src="/package_image/package_paris.jpg">
        <div class="icon-container">
            <img src="/images/icons_best.png" class="nav_icon" />
        </div>
        <div><i class="fas fa-external-link-alt"></i></div>
    </div>
    <div class="details">
        <h2>Jhon Deo</h2>
        <p>화가</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
    </div>
    </a>
</div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>Emma Smith</h2>
          <p>배우</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>James Martin</h2>
          <p>사진작가</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>James Martin</h2>
          <p>사진작가</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>James Martin</h2>
          <p>작가1</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>James Martin</h2>
          <p>사진작가2</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>James Martin</h2>
          <p>사진작가3</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
      <div class="card">
        <div class="image">
          <img src="/package_image/package_paris.jpg">
          <div><a href="#"><i class="fas fa-external-link-alt"></i></a></div>
        </div>
        <div class="details">
          <h2>James Martin</h2>
          <p>사진작가4</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing sit amet consectetur adipisicing elit. Maiores earum ab nihil</p>
        </div>
      </div>
    </div>
    <div class="button-container">
      <button id="prevButton">이전</button>
      <button id="nextButton">다음</button>
    </div>
  </div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
let currentIndex = 0;
const cards = document.querySelectorAll('.card');
const totalCards = cards.length;
const cardsPerPage = 4;

// 초기 화면 설정
document.addEventListener('DOMContentLoaded', () => {
    updateCardContainer();
});

document.getElementById('prevButton').addEventListener('click', showPrevCards);
document.getElementById('nextButton').addEventListener('click', showNextCards);

function updateCardContainer() {
    cards.forEach((card, index) => {
        if (index >= currentIndex && index < currentIndex + cardsPerPage) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}

function showPrevCards() {
    if (currentIndex > 0) {
        currentIndex -= cardsPerPage;
        if (currentIndex < 0) {
            currentIndex = 0;
        }
        updateCardContainer();
    }
}

function showNextCards() {
    if (currentIndex < totalCards - cardsPerPage) {
        currentIndex += cardsPerPage;
        if (currentIndex > totalCards - cardsPerPage) {
            currentIndex = totalCards - cardsPerPage;
        }
        updateCardContainer();
    }
}

updateCardContainer();
</script>
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
