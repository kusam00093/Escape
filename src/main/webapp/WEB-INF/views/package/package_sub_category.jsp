<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
<style>



.hero-slider {
  
  width: 68%;
  height: 500px;
  margin : 0 auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  position: relative;
  z-index: 0;
  overflow: hidden; /* 넘치는 이미지 숨기기 */
}

@media (max-width: 991px) {
  .hero-slider {
    height: 600px;
  }
}

@media (max-width: 767px) {
  .hero-slider {
    height: 500px;
  }
}

.hero-slider .swiper-slide {
  overflow: hidden;
  color: #fff;
}

.hero-slider .swiper-container {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
}

.hero-slider .slide-inner {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  background-size: cover;
  background-position: center;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: left;
}

.hero-slider .swiper-button-prev,
.hero-slider .swiper-button-next {
  background: transparent;
  width: 55px;
  height: 55px;
  line-height: 53px;
  margin-top: -30px;
  text-align: center;
  border: 2px solid #d4d3d3;
  border-radius: 55px;
  opacity:0;
  visibility:hidden;
  transition:all .3s ease;
}
.hero-slider:hover .swiper-button-prev,
.hero-slider:hover .swiper-button-next {
  transform:translateX(0);
  opacity:1;
  visibility:visible;
}

@media (max-width: 767px) {
  .hero-slider .swiper-button-prev,
  .hero-slider .swiper-button-next {
    display: none;
  }
}

.hero-slider .swiper-button-prev {
  left: 25px;
  transform:translateX(50px);
}

.hero-slider .swiper-button-prev:before {
  font-family: "Font Awesome 5 Free";
  content: "\f060";
  font-size: 15px;
  color: #d4d3d3;
  font-style: normal;
  display: inline-block
  vertical-align: middle;
  font-weight: 900;
}

.hero-slider .swiper-button-next {
  right: 25px;
  transform:translateX(-50px);
}

.hero-slider .swiper-button-next:before {
  font-family: "Font Awesome 5 Free";
  content: "\f061";
  font-size: 15px;
  color: #d4d3d3;
  font-style: normal;
  display: inline-block
  vertical-align: middle;
  font-weight: 900;
}

.hero-slider .swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  text-align: left;
  line-height: 12px;
  font-size: 12px;
  color: #000;
  opacity: 0.3;
  background:#fff;
  transition:all .2s ease;
}

.hero-slider .swiper-pagination-bullet-active {
  opacity:1;
}

.hero-slider .swiper-container-horizontal > .swiper-pagination-bullets,
.hero-slider .swiper-pagination-custom,
.hero-slider .swiper-pagination-fraction {
  bottom: 30px;
}

@media screen and (min-width: 992px) {
  .hero-slider .swiper-container-horizontal > .swiper-pagination-bullets,
  .hero-slider .swiper-pagination-custom,
  .hero-slider .swiper-pagination-fraction {
/*     display: none; */
  }
}
.swiper-pagination {
  text-align:left;
}

.hero-slider .swiper-container-horizontal > .swiper-pagination-bullets{
  bottom:50px;
    max-width: 1200px;
    padding: 0 15px;
    margin: 0 auto;
    left: 50%;
    transform: translateX(-50%);
}
}
@media (min-width: 767px) {
  .hero-slider .swiper-container-horizontal > .swiper-pagination-bullets{
  bottom:30px;
 
}
}
/*--------------------------------------------------------------
  #hero-style
--------------------------------------------------------------*/
.hero-style {
  height: 850px;
  transition:all .4s ease;
}

@media (max-width: 991px) {
  .hero-style {
    height: 600px;
  }
}

@media (max-width: 767px) {
  .hero-style{
    height: 500px;
  }
}

@media screen and (min-width: 992px) {
  .hero-style .container {
    padding-top: 95px;
  }
}

.hero-style .slide-title,
.hero-style .slide-text,
.hero-style .slide-btns {
  max-width: 690px;
}

.hero-style .slide-title h2 {
  font-size: 100px;
  font-weight: 600;
  line-height: 1;
  color: #ffffff;
  margin: 0 0 40px;
  text-transform: capitalize;
  transition:all .4s ease;
}

@media (max-width: 1199px) {
  .hero-style .slide-title h2 {
    font-size: 75px;
  }
}

@media (max-width: 991px) {
  .hero-style .slide-title h2 {
    font-size: 50px;
    margin: 0 0 35px;
  }
}

@media (max-width: 767px) {
  .hero-style .slide-title h2 {
    font-size: 35px;
    margin: 0 0 30px;
  }
}

.hero-style .slide-text p {
  opacity: 0.8;
  font-family: Rajdhani;
  font-size: 32px;
  font-weight: 500;
  line-height: 1.25;
  letter-spacing: normal;
  color: #ffffff;
  margin: 0 0 40px;
  transition:all .4s ease;
}

@media (max-width: 767px) {
  .hero-style .slide-text p {
    font-size: 16px;
    font-size: 1rem;
    font-weight: normal;
    margin: 0 0 30px;
  }
}

.hero-style .slide-btns > a:first-child {
  margin-right: 10px;
}


/*--------------------------------------------------------------
  #button-style
--------------------------------------------------------------*/
.theme-btn, .theme-btn-s2{
    background-color: #ffffff;
    font-size: 20px;
  font-weight: 500;
  line-height: 1.4;
  text-align: center;
  color:#2b3b95;
    padding: 9px 32px;
    border: 0; 
  border-radius: 3px;
    text-transform: uppercase;
    display: inline-block;
    line-height: initial;
  transition:all .4s ease;
}
a {
    text-decoration: none;
    transition: all 0.2s ease;
}
.theme-btn-s2{
    background-color: rgba(255, 255, 255, 0.9);
    color: #131e4a;
}
.theme-btn:hover, .theme-btn-s2:hover, .theme-btn:focus, .theme-btn-s2:focus, .theme-btn:active, .theme-btn-s2:active {
    background-color:#2b3b95 ;
    color: #fff;
}
.theme-btn-s3{
  font-size: 16px;
  font-weight: 500;
  line-height: 1.5;
  color: #ffffff;
  text-transform: uppercase;
}
i.fa-chevron-circle-right{
  height:22px;
  width:22px;
}
a:hover {
    text-decoration: none;
}
@media (max-width: 991px){
  .theme-btn, .theme-btn-s2, .theme-btn-s3 {
    font-size: 13px;
    padding: 15px 25px;
  }
}
@media (max-width: 767px){
  .theme-btn, .theme-btn-s2{
    padding: 13px 20px;
    font-size: 13px;
  }
}


#sortbox{
	width : 84%;
	margin: 20px 0px;
	text-align: right;
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






.rating {
  width: 100px;
  display: flex;
  justify-content: center; /* 가운데 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
  margin-left: 20px;;
}

.rating__input {
  display: none;
}

.rating__label {
  width: 10px;
  overflow: hidden;
  cursor: pointer;
}

.rating__label .star-icon {
  width: 10px;
  height: 20px;
  display: block;
  position: relative;
  left: 0;
  background-image: url("/images/star.svg");
  background-repeat: no-repeat;
  background-size: 20px;
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

.rating__label.half-filled .star-icon {
  background-position: left;
  width: 15px; /* 반 채워진 별의 너비 설정 */
}

.package_title{
	margin : 10px;
	text-align: left;
	font-size: 20px;
	font-weight: bold;
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

</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>


<!-- start of hero -->
<section class="hero-slider hero-style">
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="slide-inner slide-bg-image" data-background="/package_image/package_paris.jpg">
          <div class="container">
            <div data-swiper-parallax="300" class="slide-title">
              <h2>GUITAR CLASSESFOR KIDS</h2>
            </div>
            <div data-swiper-parallax="400" class="slide-text">
              <p>Want to see your kid become more expressive?</p>
            </div>
            <div class="clearfix"></div>
            <div data-swiper-parallax="500" class="slide-btns">
              <a href="#" class="theme-btn-s2">Register now</a>
              <a href="#" class="theme-btn-s3"><i class="fas fa-chevron-circle-right"></i> Get Info</a>
            </div>
          </div>
        </div>
        <!-- end slide-inner -->
      </div>
      <!-- end swiper-slide -->

      <div class="swiper-slide">
        <div class="slide-inner slide-bg-image" data-background="/package_image/package_epl.jpg">
          <div class="container">
            <div data-swiper-parallax="300" class="slide-title">
              <h2>GUITAR CLASSESFOR KIDS</h2>
            </div>
            <div data-swiper-parallax="400" class="slide-text">
              <p>Want to see your kid become more expressive?</p>
            </div>
            <div class="clearfix"></div>
            <div data-swiper-parallax="500" class="slide-btns">
              <a href="#" class="theme-btn-s2">Register now</a>
              <a href="#" class="theme-btn-s3"><i class="fas fa-chevron-circle-right"></i>Get Info</a>
            </div>
          </div>
        </div>
        <!-- end slide-inner -->
      </div>
      <!-- end swiper-slide -->
    </div>
    <!-- end swiper-wrapper -->

    <!-- swipper controls -->
    <div class="swiper-pagination"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
</section>
<!-- end of hero slider -->
<div id="sortbox">
  <label for="sortOption">정렬선택</label>
  <select id="sortOption" name="sortOption">
    <option value="">-----</option>
    <option value="hit">조회수</option>
    <option value="date">최근순</option>
  </select>
</div>

<h2>${ categoryVo.name }의 검색결과 입니다</h2>
<input type="hidden" value="${ categoryVo.category_idx }" id="category">
</div>
   <div class="container1">
    <div class="card-container">
    <c:forEach var="pa" items="${ packageList_sub }">
      <div class="card">
        <a href="#">
    <div class="image">
        <img src="${ pa.image }" style="width : 305px; height: 240px;">
        <div class="icon-container">
            <img src="/images/icons_best.png" class="nav_icon" />
        </div>
        <div><i class="fas fa-external-link-alt"></i></div>
    </div>
    <div class="details packageList" >
    
    <div class="package1">
<c:choose>
    <c:when test="${not empty pa.category_name}">
        <button class="btn btn-primary">${pa.category_name}</button>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${not empty pa.location_name}">
        <button class="btn btn-primary">${pa.location_name}</button>
    </c:when>
</c:choose>
        <div class="package_title">${ pa.title }</div>
        
                   <div class="rating" data-rate="${ pa.rate }" >
                <div class="rating__label rating__label--half"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--full"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--half"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--full"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--half"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--full"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--half"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--full"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--half"><span class="star-icon"></span></div>
                <div class="rating__label rating__label--full"><span class="star-icon"></span></div>
            </div>
            
            <p>
            (${ pa.count })
            </p>
        <p>${ pa.price }/1인<p>
        <p>정원:${ pa.limited_person }</p>
    </div>
    </div>
    
    
    </a>
</div>
</c:forEach>
</div>
</div>



<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/WEB-INF/include/footer.jsp"%>

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
//HERO SLIDER
var menu = [];
document.querySelectorAll('.swiper-slide').forEach(function(slide) {
    var dataText = slide.querySelector('.slide-inner').getAttribute("data-text");
    menu.push(dataText);
});

var interleaveOffset = 0.5;

var swiperOptions = {
    loop: true,
    speed: 1000,
    parallax: true,
    autoplay: {
        delay: 6500,
        disableOnInteraction: false,
    },
    watchSlidesProgress: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    on: {
        progress: function() {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
                var slideProgress = swiper.slides[i].progress;
                var innerOffset = swiper.width * interleaveOffset;
                var innerTranslate = slideProgress * innerOffset;
                swiper.slides[i].querySelector(".slide-inner").style.transform =
                "translate3d(" + innerTranslate + "px, 0, 0)";
            }      
        },
        touchStart: function() {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
                swiper.slides[i].style.transition = "";
            }
        },
        setTransition: function(speed) {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
                swiper.slides[i].style.transition = speed + "ms";
                swiper.slides[i].querySelector(".slide-inner").style.transition =
                speed + "ms";
            }
        }
    }
};

var swiper = new Swiper(".swiper-container", swiperOptions);

// DATA BACKGROUND IMAGE
document.addEventListener('DOMContentLoaded', function () {
    var sliderBgSetting = document.querySelectorAll(".slide-bg-image");
    sliderBgSetting.forEach(function(element) {
        var background = element.getAttribute("data-background");
        if (background) {
            element.style.backgroundImage = "url(" + background + ")";
        }
    });
});
</script>


<script>
window.addEventListener('load', updateStarRating);
window.addEventListener('resize', updateStarRating);

function updateStarRating() {
    const reviews = document.querySelectorAll('.rating');

    reviews.forEach(review => {
        const rate = parseInt(review.getAttribute('data-rate')); // data-rate 값을 정수로 변환

        // 별 아이콘들을 가져옴
        const starIcons = review.querySelectorAll('.star-icon');

        // 별을 채우기 위한 클래스
        const filledClass = 'filled';

        // 모든 별 아이콘에서 클래스 초기화
        starIcons.forEach(icon => {
            icon.classList.remove(filledClass, 'half-filled');
        });

        // rate 값에 따라 별 아이콘에 클래스를 적용
        for (let i = 0; i < Math.floor(rate); i++) {
            starIcons[i].classList.add(filledClass); // 정수 부분에 filled 클래스 추가
        }

        // rate 값이 정수가 아닐 때 (소수점이 있을 때), 반 채워진 별 처리
        if (rate % 1 !== 0) {
            starIcons[Math.floor(rate)].classList.add('half-filled');
        }
    });
}
</script>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const sortOption = document.getElementById("sortOption");
    sortOption.addEventListener("change", function() {
        const selectedOption = sortOption.value;
        const category_idx = document.getElementById("category").value;
        console.log(category_idx)
        //alert(category_idx)
        let url = "";

        if (selectedOption === "hit") {
            url = "/Category/Hit?category_idx="+category_idx;
        } else if (selectedOption === "date") {
            url = "/Category/Recent?category_idx="+category_idx;
        }

        fetch(url)
        .then(response => response.json())
        .then(data => {
            renderPackages(data);
            updateStarRating(); 
            updateCardDisplay(); // 데이터를 받아온 후 카드를 업데이트
        })
        .catch(error => {
            console.error("Error fetching package data:", error);
        });
});

let currentIndex = 0;
const cardsPerPage = 4;
let totalCards = 0;

function renderPackages(packages) {
    const container = document.querySelector(".card-container");
    container.innerHTML = ""; // 기존 내용 초기화

    let html = '';

    packages.forEach(function(pa) {
        // Create card HTML
        let cardHtml = '<div class="card">';
        cardHtml += '<a href="#">';
        cardHtml += '<div class="image">';
        cardHtml += '<img src="' + pa.image + '" style="width: 305px; height: 240px;">';
        cardHtml += '<div class="icon-container">';
        cardHtml += '<img src="/images/icons_best.png" class="nav_icon">';
        cardHtml += '</div>';
        cardHtml += '<div><i class="fas fa-external-link-alt"></i></div>';
        cardHtml += '</div>';
        cardHtml += '<div class="details packageList">';
        cardHtml += '<div class="package1">';
        
        // Add category button if category_name exists
        if (pa.category_name) {
            cardHtml += '<button class="btn btn-primary">' + pa.category_name + '</button>';
        }
        
        // Add location button if location_name exists
        if (pa.location_name) {
            cardHtml += '<button class="btn btn-primary">' + pa.location_name + '</button>';
        }

        cardHtml += '<div class="package_title">' + pa.title + '</div>';
        cardHtml += '<div class="rating" data-rate="' + pa.rate + '">';

        // Add star ratings (10 spans)
        for (let i = 0; i < 10; i++) {
            cardHtml += '<div class="rating__label ' + (i % 2 === 0 ? 'rating__label--half' : 'rating__label--full') + '"><span class="star-icon"></span></div>';
        }

        cardHtml += '</div>';
        cardHtml += '<p>(' + pa.count + ')</p>';
        cardHtml += '<p>' + pa.price + '/1인</p>';
        cardHtml += '<p>정원:' + pa.limited_person + '</p>';
        cardHtml += '</div>'; // Close package1
        cardHtml += '</div>'; // Close details packageList
        cardHtml += '</a>'; // Close link
        cardHtml += '</div>'; // Close card

        html += cardHtml;
    });

    container.innerHTML = html;
    totalCards = packages.length; // 전체 카드 수 업데이트
    updateCardDisplay(); // 카드 표시 업데이트
}

function updateCardDisplay() {
    const cards = document.querySelectorAll('.card');

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
        updateCardDisplay();
    }
}

function showNextCards() {
    if (currentIndex < totalCards - cardsPerPage) {
        currentIndex += cardsPerPage;
        if (currentIndex > totalCards - cardsPerPage) {
            currentIndex = totalCards - cardsPerPage;
        }
        updateCardDisplay();
    }
}

updateCardDisplay(); // 초기 화면 설정
});
</script>

</body>

</html>
