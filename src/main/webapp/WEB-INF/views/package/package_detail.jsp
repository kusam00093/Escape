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
            position: absolute;
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
 <div id="container1" >
 
  <div class="content1" data-rate1="${package_Rate.rate}">
 	<h2>${ packageVo.title } 스위스 (K-드라마) 촬영지와 블라우제 호수 투어 (스위스/인터라켄)</h2>
 	
 	<c:set var="user_idx" value="${user_idx}" />

<c:if test="${not empty user_idx}">
    <input type="hidden" value="${ user_idx }" id="user_idx">
</c:if>
            <div class="rating" >
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
     <div>(${ package_ReviewCount.count })</div>
<hr>
<div class="convenienceList">

	<c:forEach var="co" items="${ coList }">
		<div class="convenience_container">
				<button type="button" class="convenience_btn" name="convenience_idx" value="${ co.convenience_idx }" style="width: 200px; height: 50px;">${co.name }</button>
		</div>
	</c:forEach>
</div>
<hr>

<div class="table">
<h3> 주의사항 </h3>
<p>예약 확정 여부를 꼭 확인해주세요!</p>
<p>마이리얼트립은 레일유럽의 한국 총판입니다.</p>

<p>※ 여행일 기준 만 나이를 계산하여 옵션을 선택해주세요.</p>
<p>(1) 구매하신 상품의 옵션 정보와 (2) 입력하신 여행자 정보가 일치하지 않을 경우에는 결제 직후 예약이 확정되지 않을 수 있어요.</p>
<p>예약이 확정되지 않으면 카카오톡 알림톡으로 안내받으시는 고객지원실로 문의해주세요. 환불 및 재예약를 도와드릴게요.</p>
<p>예: 만 28세 이상 성인 옵션을 구매했는데, 여행일 기준 실제 여행자 정보는 만 27세일 경우에는 예약이 확정되지 않습니다.</p>

</div>


<hr>


<button class="btn btn-primary">${packageVo.start_date }</button>
<span>${ packageVo.duration }</span>
<button class="btn btn-primary">${packageVo.end_date }</button>

    


<hr>

    <div class="container3">
        <div class="row first-row">
	<c:forEach var="io" items="${package_imageList1  }">
	<img src="${ io.image }" alt="Paris Package">
	</c:forEach>
        </div>
        <div class="row second-row">
	<c:forEach var="io" items="${package_imageList2  }" varStatus="status"> 
	<img src="${io.image}" alt="Paris Package" ${status.last ? 'id="more-trigger"' : ''}>
	</c:forEach>
        </div>
    </div>

    <div id="modal" class="modal">
        <span class="close">&times;</span>
        <div class="modal-content">
            <div class="slide-container">
	<c:forEach var="io" items="${package_imageList3  }">
	<img src="${ io.image }" alt="Paris Package" class="slide active">
	</c:forEach>
            </div>
            <button class="prev">Prev</button>
            <button class="next">Next</button>
        </div>
    </div>
<hr>

<div class=detail>
	🏞[드라마 촬영지 + 블라우제호수 투어] 스위스여행에서 꼭 가보고 싶었던 곳을 모두 볼수 있는 투어~~
[에델바이스가 피는 나라에서 만나자~] 
에델바이스가 피는 나라 스위스에서 그중에서도 가장 아름답게 보여주었던 곳으로 여러분의 스위스 여행를 빛내드립니다.
드라마 화면에서도 다 담아지지 않을만큼 아름다운 스위스의 아름다움. 
웅장한 알프스의  절경. 동화같은 마을을 함께 여행해 드립니다.
🚘단독차량+가이드 투어로 편안하게 여행하세요.
(대중교통으로 이동하기 어려운⚡ 놓칠수 없는 여행지만  쏙쏙~)👌

[유명한 K-드라마] 촬영지 투어 +숲속의 에메랄드 빛 호수를 품고 있는 블라우제 여행
09:00 : 가이드 미팅 후 
1.	시그리스 빌(Sigriswil) - 남,녀 주인공이 만나는 장면
                                           거미(Gummi)협곡 위에 놓인 넓이 340m, 지상 180m 높이의 보행자 현수교에서 바라보는 툰호수 배경.
2.	이젤트발트(lseltwald)- 남자 주인공이 유람선 선착장에서 피아노를 치며, 브리엔츠 호수를 배경으로 동화같이 
                                                펼쳐진 이젤트발트 마을.
3.	블라우제(Blausee)-'마법의 숲, 고독한 풍경 속의 보석, 이라고 불리는 호수는 에메랄드 빛 보석의 색깔을 가지고 있는 스위  
                                           스에서는 유명한 숲속의 호수이다.

가이드와 차량으로 이동하며 여행하는 투어입니다.

스위스는 특히 눈으로 보는 풍경이 사진이나 영상에 다 담아지지 않는다는 말씀들 많이 하십니다.
영상에 보여진 모습보다 눈으로 직접 보면 더 아름다운 곳이 스위스, 알프스 모습입니다.

-일생에 한번 허니문 여행
-소중한 가족과 함께 하는 여행
-연인과 잊지 못할 추억을 위한 여행
-혼자만의 힐링여행

대중교통과 기차로는 이동하기 힘든 여러 곳을 차량으로 가이드와 함께 콕 짚어 여행할 수 있는 좋은 기회입니다.
스위스 여행에서 한번쯤은 잊지 못할 추억을 남겨보세요.
</div>
<button class="button">더보기</button>

<hr>

<div class="detail_rate">
<div class="detail_rate_content1">
<h2>${ package_Rate_Max.rate/2 }</h2>
<div class="detail_rate_star" data-rate2="${ package_Rate_Max.rate }">
 	<div class="rating" >
         <div class="rating" >
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
</div>

</div>
<div>무언가</div>
</div>


<div class="detail_rate_content2">

<h3>이름</h3>
<p>날짜</p>
<div > <img src="/package_image/package_paris.jpg" alt="Paris Package" class="review_img"></div>
<p class="review">움직이기 힘든 지역들은 차로 편안하게 볼 수 있어서 좋았어요!
엄마랑 파리에서 많이 걸어다니면서 체력적으로 많이 힘들었는데 너무 좋은 투어를 만나 힐링할 수 있었습니다💕움직이기 힘든 지역들은 차로 편안하게 볼 수 있어서 좋았어요!
엄마랑 파리에서 많이 걸어다니면서 체력적으로 많이 힘들었는데 너무 좋은 투어를 만나 힐링할 수 있었습니다💕움직이기 힘든 지역들은 차로 편안하게 볼 수 있어서 좋았어요!
</p>
<button class="button2">더보기</button>
<button class="button3">더많은후기 보러가기</button>


</div>


</div>
<hr>




<div class="meeting">
<h2>이용안내</h2>
<h4>만나는 시간</h4>
<div>시간</div>
<h4>만나는 장소</h4>
<div>장소 글</div>
 <input type="hidden" id="address" value="${ packageVo.address1 }">
 <div id="map" style="width: 100%; height: 400px; margin: 0 auto;"></div>
<h4>필수 안내</h4>
<div>* 본 상품에는 여행자보험이 포함되어 있지 않습니다. 여행자보험 가입후 투어 참여해 주세요.
* 최소 모객 인원은 4인입니다. (투어 7일 전까지 4인이 모객되지 않을 경우 투어가 취소될 수 있습니다. )
*4인 단독으로 진행을 원하실경우 .(단독진행시 비용추가 발생이 있으십니다. 문의 후 진행 가능여부 안내드립니다.)
* 가이드는 도난, 분실 등에 대한 도움을 드릴수 없음을 양해의 말씀 드립니다.
* 투어 시작 10분 전까지 미팅 장소로 나와주시길 바랍니다. (5분 이상 지각 금지)
* 투어참여시 여권 필히 지참해 주세요.
* 투어 참여시 반드 시 바우처(여행확인증)를 프린트 혹은 캡쳐하여 가져오시길 바랍니다.
* 투어 동선은 당일 현지 상황 (도로상황, 날씨, 파업 등)에 의해 변경될 수 있습니다.
* 여행자 보험을 꼭 가입하고 투어에 참여하시길 권유합니다.</div>

</div>

<h4>취소 및 환불 규정</h4>
<div>
- 여행시작 30일 전까지 (~30) 통보 시 : 여행 요금 전액 환불
- 여행시작 20일 전까지 (29~20) 통보 시 : 총 상품 금액에서 10% 공제 후 환불
- 여행시작 6일 전까지 (19~6) 통보 시 : 총 상품 금액에서 15% 공제 후 환불
- 여행시작 1 일 전까지 (1~5) 통보 시 : 총 상품 금액에서 20% 공제 후 환불
- 여행일 당일 ~ 투어 시작 전 통보 시: 총 상품 금액에서 50% 공제 후 환불
</div>

<hr>

<div class="flex-container">
  <h3 style="display: inline-block;">리뷰</h3>
  <div class="button-container">
    <c:if test="${not empty paycount and paycount > 0}">
<button class="ReviewRate btn btn-primary" style="display: inline-block;" id="goReviewWrite">리뷰쓰기</button>
    </c:if>

  </div>
</div>
<div class="reviews">
    <c:forEach var="re" items="${reviewList}">
        <div class="review1" data-rate="${re.rate}" >
            <img src="/package_image/package_paris.jpg" class="review-img">
            <div class="review-title">${re.created}</div>
            <div class="rating">
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
            <div class="reviewer">${re.full_name}</div>
            <div>&nbsp;</div>
            <div class="review-content">
                ${re.content}내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at sapien vitae tellus viverra ultricies. Nam malesuada efficitur aliquam. Fusce ac ipsum eu libero posuere tristique.
            </div>
        </div>
    </c:forEach>
</div>

  </div>
  <aside class="sidebar1">
    <div class="sidebar-section">
      <h4>금액/제한인원</h4>
      <p>금액: ${ packageVo.price }원</p>
      <input type="hidden" value="${ packageVo.price }" id="money">
      <p>제한 인원: ${ packageVo.limited_person }명</p>
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
<c:if test="${usertype.type eq 1}">
  <!-- ${usertype} 값이 1일 때만 보이는 HTML -->
  <div>
    <div class="container4">
      <button class="button" id="decrementButton">&lt;</button>
      <div class="counter" id="counter"><span id="counter-value">1</span></div>
      <button class="button" id="incrementButton">&gt;</button>
    </div>
  </div>

  <div class="sidebar-section">
    <form action="#" method="post">
      <div id="finalmoney"></div>
      <input type="submit" value="예약하기" id="goApply">
    </form>
    <button id="bookmarkbtn">스크랩하기</button>
  </div>
</c:if>

    <div class="sidebar-section">
      <h4>코멘트</h4>
    </div>
    
  </aside>
</div>








<div class="modal2" id="exampleModal2">
  <div class="modal2-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">리뷰 작성하기</h5>
    </div>
    <div class="modal-body">
      <h2 class="fs-5">모달 안의 팝오버</h2>
  <p>This <a href="#" role="button" class="btn btn-secondary popover-test" title="Popover title" data-bs-content="Popover body content is set in this attribute.">button</a> triggers a popover on click.</p>
      <h2 class="fs-5">모달 안의 툴팁</h2>
      <p><a href="#" data-bs-toggle="tooltip" title="툴팁">이 링크</a>와 <a href="#" data-bs-toggle="tooltip" title="툴팁">저 링크</a>에 마우스를 올리면 툴팁이 나타납니다.</p>
    </div>
    
    <div class="wrap">
    <h1>별점</h1>
    <form action="/Package/Insert/Review">
    
    
    
    <div class="rating">
        <label class="rating__label rating__label--half" for="starhalf">
            <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star1">
            <input type="radio" id="star1" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star1half">
            <input type="radio" id="star1half" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star2">
            <input type="radio" id="star2" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star2half">
            <input type="radio" id="star2half" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star3">
            <input type="radio" id="star3" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star3half">
            <input type="radio" id="star3half" class="rating__input" name="rating" checked>
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star4">
            <input type="radio" id="star4" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star4half">
            <input type="radio" id="star4half" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star5">
            <input type="radio" id="star5" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
    </div>
    
    <div>
    <textarea rows="5" cols="" name="content" placeholder="리뷰내용을 입력하세요"></textarea>
    
    <hr>
    <input type="submit" value="리뷰 등록" class="btn btn-primary">
    </div>
    
    
    
    
        </form>
</div>
    
    
    
    

    
    
    
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" id="closeModal">닫기</button>
    </div>
  </div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd92b81e9a491dc389672165f361ad1a&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

const rateWrap = document.querySelectorAll('.rating'),
label = document.querySelectorAll('.rating .rating__label'),
input = document.querySelectorAll('.rating .rating__input'),
labelLength = label.length,
opacityHover = '0.5';

let stars = document.querySelectorAll('.rating .star-icon');

checkedRate();

rateWrap.forEach(wrap => {
wrap.addEventListener('mouseenter', () => {
stars = wrap.querySelectorAll('.star-icon');

stars.forEach((starIcon, idx) => {
    starIcon.addEventListener('mouseenter', () => {
        initStars(); 
        filledRate(idx, labelLength); 

        for (let i = 0; i < stars.length; i++) {
            if (stars[i].classList.contains('filled')) {
                stars[i].style.opacity = opacityHover;
            }
        }
    });

    starIcon.addEventListener('mouseleave', () => {
        starIcon.style.opacity = '1';
        checkedRate(); 
    });

    wrap.addEventListener('mouseleave', () => {
        starIcon.style.opacity = '1';
    });
});
});
});

function filledRate(index, length) {
if (index <= length) {
for (let i = 0; i <= index; i++) {
    stars[i].classList.add('filled');
}
}
}

function checkedRate() {
let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');


initStars();
checkedRadio.forEach(radio => {
let previousSiblings = prevAll(radio);

for (let i = 0; i < previousSiblings.length; i++) {
    previousSiblings[i].querySelector('.star-icon').classList.add('filled');
}

radio.nextElementSibling.classList.add('filled');

function prevAll() {
    let radioSiblings = [],
        prevSibling = radio.parentElement.previousElementSibling;

    while (prevSibling) {
        radioSiblings.push(prevSibling);
        prevSibling = prevSibling.previousElementSibling;
    }
    return radioSiblings;
}
});
}

function initStars() {
for (let i = 0; i < stars.length; i++) {
stars[i].classList.remove('filled');
}
}


</script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // 모달 열기 버튼
    var modalBtn = document.getElementById('goReviewWrite');
    // 모달 닫기 버튼 (모달 안에 있는 X 버튼)
    var closeModalBtn = document.getElementById('closeModal');
    // 모달 창
    var modal = document.getElementById('exampleModal2');
    
    // 모달 열기 버튼에 클릭 이벤트 리스너 추가
    modalBtn.addEventListener('click', function() {
      if (modal) {
        modal.style.display = 'block'; // 모달 보이기
      }
    });
    
    // 모달 닫기 버튼에 클릭 이벤트 리스너 추가
    if (closeModalBtn) {
      closeModalBtn.addEventListener('click', function() {
        if (modal) {
          modal.style.display = 'none'; // 모달 숨기기
        }
      });
    }
    
    // 사용자가 모달 바깥을 클릭했을 때 모달 숨기기
    window.addEventListener('click', function(event) {
      if (event.target == modal) {
        modal.style.display = 'none'; // 모달 숨기기
      }
    });
  });
</script>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        if (typeof kakao === 'undefined' || !kakao.maps) {
            console.error('Kakao Maps API 로드 실패');
            return;
        }

        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // JSP에서 전달된 회사 주소를 사용합니다
        var companyAddress = document.getElementById("address").value;
        //alert(companyAddress);

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(companyAddress, function(result, status) {
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">회사 위치</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });
    });
    </script>



    <script>
    document.addEventListener('DOMContentLoaded', function(event) {
        let moneyString = document.querySelector('#money').value;
        let moneyInteger = parseInt(moneyString.replace(/,/g, ""));
        
        
        
        

        
        
        
        
        // 1. 맨 처음에 moneyInteger 값을 출력
        let formattedMoney = formatMoney(moneyInteger);
        //console.log(formattedMoney); // 콘솔에 출력

        var counterValueElement = document.getElementById('counter-value');
        var incrementButton = document.getElementById('incrementButton');
        var decrementButton = document.getElementById('decrementButton');
        var finalMoneyElement = document.getElementById('finalmoney');

        var counterValue = 1;

        // 초기화할 때 moneyInteger 값 출력
        finalMoneyElement.textContent = formattedMoney;

        incrementButton.addEventListener('click', function() {
            counterValue++;
            updateFinalMoney();
            updateCounterValue();
        });

        decrementButton.addEventListener('click', function() {
            if (counterValue > 1) {
                counterValue--;
                updateFinalMoney();
                updateCounterValue();
            }
        });

        function updateFinalMoney() {
            let result = moneyInteger * counterValue;
            finalMoneyElement.textContent = formatMoney(result);
        }

        function updateCounterValue() {
            counterValueElement.textContent = counterValue;
            if (counterValue > 1) {
                counterValueElement.style.color = 'green';
            } else {
                counterValueElement.style.color = 'red';
            }
            setTimeout(function() {
                counterValueElement.style.color = '';
            }, 300);
        }

        // 숫자를 3자리마다 쉼표로 구분하여 포맷하는 함수
        function formatMoney(value) {
            let formatted = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            return formatted + '원';
        }
        
        

        
        
        
        const applybtn =document.querySelector('#goApply');
        applybtn.addEventListener('click',(event)=>{
        	event.preventDefault();
        	//console.log(finalMoneyElement)
        	        let finalMoneyText = finalMoneyElement.textContent; // '400,000원' 형태의 문자열
        let finalMoneyValue = parseInt(finalMoneyText.replace(/,/g, "").replace('원', '')); // '400000' 형태의 정수
        const package_idx = ${packageVo.package_idx};
        let reservation_su = counterValue;
        let url = "/Package/Reservation?reservation_price="+finalMoneyValue+"&package_idx="+package_idx+"&reservation_su="+counterValue;
        location.href = url;
        })
        
        
        
    });

    
    
</script>




    <script>
    var modal = document.getElementById('modal');
    var trigger = document.getElementById('more-trigger');
    var slides = document.querySelectorAll('.modal-content img.slide');
    var slideIndex = 0;

    // Open modal
    trigger.onclick = function() {
        modal.style.display = 'block';
        showSlide(slideIndex);
    };

    // Close modal
    modal.onclick = function(event) {
        if (event.target == modal || event.target.className == 'close') {
            modal.style.display = 'none';
        }
    };

    // Prev/Next slide functionality
    var prevButton = document.querySelector('.prev');
    var nextButton = document.querySelector('.next');

    prevButton.onclick = function() {
        slideIndex -= 1;
        if (slideIndex < 0) {
            slideIndex = slides.length - 1;
        }
        showSlide(slideIndex);
    };

    nextButton.onclick = function() {
        slideIndex += 1;
        if (slideIndex >= slides.length) {
            slideIndex = 0;
        }
        showSlide(slideIndex);
    };

    function showSlide(index) {
        slides.forEach(function(slide) {
            slide.classList.remove('active');
        });
        slides[index].classList.add('active');
    }
    </script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var originalContent = document.querySelector('.detail').innerHTML;
    var originalContent2 = document.querySelector('.review').innerHTML;
    var contentLines = originalContent.split('\n');
    var contentLines2 = originalContent2.split('\n');
    var visibleLines = contentLines.slice(0, 5).join('\n');
    var visibleLines2 = contentLines2.slice(0, 5).join('\n');
    var hiddenLines = contentLines.slice(5).join('\n');
    var hiddenLines2 = contentLines2.slice(5).join('\n');

    document.querySelector('.detail').innerHTML = visibleLines;
    var button = document.querySelector('.button');
    document.querySelector('.review').innerHTML = visibleLines2;
    var button2 = document.querySelector('.button2');
    
    button.addEventListener('click', function() {
        if (button.textContent === "더보기") {
            document.querySelector('.detail').innerHTML = originalContent;
            button.textContent = "간략히 보기";
        } else {
            document.querySelector('.detail').innerHTML = visibleLines;
            button.textContent = "더보기";
        }
    });
    button2.addEventListener('click', function() {
        if (button2.textContent === "더보기") {
            document.querySelector('.review').innerHTML = originalContent2;
            button2.textContent = "간략히 보기";
        } else {
            document.querySelector('.review').innerHTML = visibleLines2;
            button2.textContent = "더보기";
        }
    });
});

</script>

<script>
    window.addEventListener('load', () => {
        const reviews = document.querySelectorAll('.review1');

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
<script>
    window.addEventListener('load', () => {
        const reviews = document.querySelectorAll('.content1');

        reviews.forEach(review => {
            const rate = parseInt(review.getAttribute('data-rate1')); // data-rate 값을 정수로 변환
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

        });
    });
</script>
<script>
    window.addEventListener('load', () => {
        const reviews = document.querySelectorAll('.detail_rate_star');

        reviews.forEach(review => {
            const rate = parseInt(review.getAttribute('data-rate2')); // data-rate 값을 정수로 변환
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

        });
    });
</script>

<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
