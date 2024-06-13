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
    <script>
        $(function() {
            var dateFormat = "yy-mm-dd",
                from = $("#from")
                    .datepicker({
                        defaultDate: "+1w",
                        changeMonth: true,
                        numberOfMonths: 2
                    })
                    .on("change", function() {
                        to.datepicker("option", "minDate", getDate(this));
                    }),
                to = $("#to").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2
                })
                .on("change", function() {
                    from.datepicker("option", "maxDate", getDate(this));
                });

            function getDate(element) {
                var date;
                try {
                    date = $.datepicker.parseDate(dateFormat, element.value);
                } catch (error) {
                    date = null;
                }
                return date;
            }

            $("#select-date-range").on("click", function() {
                $("#date-range-picker").toggle();
            });

            $("#apply-dates").on("click", function() {
                var startDate = $("#from").val();
                var endDate = $("#to").val();
                alert("선택한 기간: " + startDate + " - " + endDate);
                $("#date-range-picker").hide();
            });
        });
    </script>
</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
 <div id="container1">
 
  <div class="content1">
 	<h2>${ packageVo.title } 스위스 (K-드라마) 촬영지와 블라우제 호수 투어 (스위스/인터라켄)</h2>
 	<div class="rating" >
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

    <button id="select-date-range">기간 선택</button>
    <div id="date-range-picker">
        <form>
            <label for="from">시작 날짜:</label>
            <input type="text" id="from" name="from">
            <label for="to">종료 날짜:</label>
            <input type="text" id="to" name="to">
        </form>
        <button id="apply-dates">적용</button>
    </div>


<hr>

    <div class="container3">
        <div class="row first-row">
            <img src="/package_image/package_paris.jpg" alt="Paris Package">
        </div>
        <div class="row second-row">
            <img src="/package_image/package_paris.jpg" alt="Paris Package">
            <img src="/package_image/package_paris.jpg" alt="Paris Package">
            <img src="/package_image/package_paris.jpg" alt="Paris Package" id="more-trigger">
        </div>
    </div>

    <div id="modal" class="modal">
        <span class="close">&times;</span>
        <div class="modal-content">
            <div class="slide-container">
                <img class="slide active" src="/package_image/package_paris.jpg" alt="Paris Package">
                <img class="slide active" src="/package_image/package_osaka.jpg" alt="Paris Package">
                <img class="slide active" src="/package_image/package_danang.jpg" alt="Paris Package">
                <img class="slide active" src="/package_image/package_epl.jpg" alt="Paris Package">
                <img class="slide active" src="/package_image/package_paris.jpg" alt="Paris Package">
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

<h2>5.0</h2>
<div class="detail_rate_star">
 	<div class="rating" >
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
<div>장소 구글api</div>
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

<h3>리뷰</h3>

<div class="reviews">
<c:forEach var="re" items="${ reviewList }">

    <div class="review1">
		<img src="/package_image/package_paris.jpg" class="review-img">
        <div class="review-title">${ re.created }</div>
        <div class="reviewer">${ re.full_name }</div>
   		<div>&nbsp;</div>
        <div class="review-content">
            ${ re.content }내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at sapien vitae tellus viverra ultricies. Nam malesuada efficitur aliquam. Fusce ac ipsum eu libero posuere tristique.
        </div>
    </div>
 </c:forEach>   


</div>

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
<script>
$(function () {

    // INITIALIZE DATEPICKER PLUGIN
    $('.datepicker').datepicker({
        clearBtn: true,
        format: "dd/mm/yyyy"
    });


    // FOR DEMO PURPOSE
    $('#reservationDate').on('change', function () {
        var pickedDate = $('input').val();
        $('#pickedDate').html(pickedDate);
    });
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
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
