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
<form class="package_search_main" action="/Package/Home/Sub" method="POST">
  <input class="package_search" type="search" name="keyword" placeholder="가고싶은 여행지를 검색하세요" aria-label="Search">
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
  
    <c:forEach var="pa" items="${ packageList }">
      <div class="card" style="text-decoration: none;">
                <!-- 상위 링크는 카드 내용 전체를 클릭해도 이동하도록 유지 -->
                <a href="/Package/Detail?package_idx=${ pa.package_idx }">
                    <div class="image" style="margin-bottom:10px;">
                        <img src="${ pa.image }" style="width: 305px; height: 240px;">
                    </div>
                    <div><i class="fas fa-external-link-alt"></i></div>
                </a>
<c:if test="${not empty user_idx && user_idx != 0}">
    <!-- 북마크 버튼은 링크 밖에 배치 -->
    <div class="icon-container" style="display: inline-block; text-align: center; margin-left:120px; width: 24px; height: 24px;">
        <img src="${pa.state == 1 ? '/img/like_on.png' : '/img/like_off.png'}" class="nav_icon bookmarkbtn" data-package-idx="${pa.package_idx}" data-state="${pa.state == 1 ? 1 : 0}" />
    </div>
</c:if>
                <div class="details packageList">
                    <div class="package1">
                        <div style="display: flex; align-items: center;">
                            <c:choose>
                                <c:when test="${not empty pa.category_name}">
                                    <button class="btn btn-primary" style="margin-left: 10px;">${pa.category_name}</button>
                                </c:when>
                            </c:choose>

                            <c:choose>
                                <c:when test="${not empty pa.location_name}">
                                    <button class="btn btn-primary" style="margin-left: 10px;">${pa.location_name}</button>
                                </c:when>
                            </c:choose>
                        </div>

                        <div class="package_title" style="margin-right: 10px;">${pa.title}</div>
                        <div style="display: flex; align-items: center;">
                            <div class="rating" data-rate="${pa.rate}" style="display: flex; margin-right: 10px;">
                                <!-- 스타 아이콘 생성 -->
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
                            <p style="margin-top:20px;">(${pa.count})</p>
                        </div>
<c:choose>
    <c:when test="${(not empty pa.discount_percent and pa.discount_percent != 0) or (not empty pa.discount_integer and pa.discount_integer != 0)}">
        <div style="display: flex; align-items: center; margin-left:10px;">
            <p style="color: gray; text-decoration: line-through; margin-right: 10px;">${pa.price}/1인</p>
            <p style="font-size: 1.2rem; font-weight: bold;">${pa.discounted_price}/1인</p>

            <!-- 남은 인원 조건 처리 -->
            <c:choose>
                <c:when test="${pa.remaining_person == 0}">
                    <p>마감된 패키지입니다</p>
                </c:when>
                <c:otherwise>
                    <p>남은 인원: ${pa.remaining_person}/${pa.limited_person}</p>
                </c:otherwise>
            </c:choose>
        </div>
    </c:when>
    <c:otherwise>
        <div style="display: flex; align-items: center; gap: 10px;">
            <p style="font-size: 1.2rem; font-weight: bold; margin-left: 10px;">${pa.price}/1인</p>

            <!-- 남은 인원 조건 처리 -->
            <c:choose>
                <c:when test="${pa.remaining_person == 0}">
                    <p>마감된 패키지입니다</p>
                </c:when>
                <c:otherwise>
                    <p>남은 인원: ${pa.remaining_person}/${pa.limited_person}</p>
                </c:otherwise>
            </c:choose>
        </div>
    </c:otherwise>
</c:choose>
                    </div>
                </div>
            </div>
</c:forEach>



    </div>
    <div class="button-container">
      <button id="prevButton">이전</button>
      <button id="nextButton">다음</button>
    </div>
  </div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
// document.addEventListener("DOMContentLoaded", function() {
//     const searchForm = document.querySelector(".package_search_main");
//     const searchInput = document.querySelector(".package_search");

//     searchForm.addEventListener("submit", function(event) {
//         event.preventDefault(); // 기본 제출 이벤트 막기

//         const searchTerm = searchInput.value.trim(); // 검색어 가져오기 (공백 제거)
        
//         if (searchTerm) { // 검색어가 비어있지 않을 경우에만 요청 보내기
//         	const url = '/Package/Search/Sub?keyword=' + encodeURIComponent(searchTerm); // 검색어를 인코딩하여 URL 생성

//             fetch(url)
//                 .then(response => response.json())
//                 .then(data => {
//                     // 검색 결과를 처리하는 함수 호출 (renderSearchResults 등)
//                     console.log("Received search results:", data);
//                 })
//                 .catch(error => {
//                     console.error("Error fetching search results:", error);
//                 });
//         }
//     });
// });
</script>
<script>
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.bookmarkbtn').forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();  // 기본 동작(링크 이동) 방지
            console.log('Bookmark button clicked!');  // 디버깅 메시지 확인

            const packageIdx = parseInt(e.target.dataset.packageIdx);
            let currentState = parseInt(e.target.dataset.state);
            const newState = (currentState === 1) ? 0 : 1;  // currentState가 1이면 0, 아니면 1

            console.log(currentState);  // 현재 상태를 콘솔에 출력
            console.log(newState);  // 새 상태를 콘솔에 출력

            // 서버에 상태 업데이트 요청
            fetch('/Bookmark', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    package_idx: packageIdx,
                    state: newState
                })
            })
            .then(response => {
                if (response.ok) {
                    return response.json();  // JSON 응답을 반환
                } else {
                    throw new Error('Failed to update bookmark');  // 실패 시 에러 발생
                }
            })
            .then(result => {
                console.log(result.state);  // 서버에서 반환하는 state 값

                // 새 상태에 따라 이미지와 상태 업데이트
                e.target.src = newState === 1 ? '/img/like_on.png' : '/img/like_off.png';
                e.target.dataset.state = newState;
            })
            .catch(error => {
                console.error('Error:', error);  // 에러 처리
            });
        });
    });
});
</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const categoryButtons = document.querySelectorAll(".category_btn");

    categoryButtons.forEach(button => {
        button.addEventListener("click", function() {
            const categoryIdx = this.value;
            const url = "/Package/Home/Sub?category_idx=" + categoryIdx;
            window.location.href = url;
        });
    });
});
</script>
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

<script>
    window.addEventListener('load', () => {
        const reviews = document.querySelectorAll('.rating');

        reviews.forEach(review => {
            const rate = parseInt(review.getAttribute('data-rate')); // data-rate 값을 정수로 변환
            //console.log(rate)

            // 별 아이콘들을 가져옴
            const starIcons = review.querySelectorAll('.star-icon');

            // 별을 채우기 위한 클래스
            const filledClass = 'filled';

            // rate 값에 따라 별 아이콘에 클래스를 적용
            for (let i = 0; i < Math.floor(rate); i++) {
                starIcons[i].classList.add(filledClass); // 정수 부분에 filled 클래스 추가
            }

            // rate 값이 정수가 아닐 때 (소수점이 있을 때), 반 채워진 별 처리
            if (rate % 1 !== 0) {
                starIcons[Math.floor(rate)].classList.add('half-filled');
            }
        });
    });
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
