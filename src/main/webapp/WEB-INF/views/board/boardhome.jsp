<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="/css/header.css" />


<style>
    body {
      padding: 40px;
    }
     * {
      margin: 0;
      padding: 0px 20px 0px 20px;
      box-sizing: border-box;
    }
    li {
      list-style: none;
    }
    a {
      text-decoration: none;
      color: inherit;
    }
    img {
      vertical-align: top;
      
    }
    .nav-tabs .nav-link.active {
      background-color: #17a2b8;
      color: #fff;
    }
    .nav-tabs .nav-link {
      border: 1px solid #dee2e6;
      border-radius: .25rem;
      margin-right: .5rem;
    }
    
    /*카드호버*/
.card-container {
  flex-wrap: wrap;
  gap: 20px;
  margin-top: 20px;
  padding-left: 20px;
  padding-right: 20px;
  background-color: transparent;
  /*height: 100vh;*/
  display: flex;
  justify-content: center;
  align-items: center;
  
}

.card {
  flex: 1 1 calc(20% - 20px);
  
  transition: transform 0.2s;
  margin-bottom: 20px;
  cursor: pointer;
  width: 200px;
  height: 350px;
  position: relative;
  perspective: 1100px;
  border : none;
  background-color : transparent;
}
/*
.card-container .card {
  flex: 1 1 calc(20% - 20px);
}*/

.card > div {
  position: absolute;
  top: 0;
  left: 0;
  transition: 5s;
  
  width: 100%;
  height: 100%;
  
  backface-visibility: hidden;
}

.card .front {
  transform: rotateY(180deg);
  z-index: 1;
  border : none;
  
}

.card .card-body {


background: white;
border: 1px solid #87CEEB;
/*background: linear-gradient(to bottom, #87CEEB 0%, #ADD8E6 50%, #4682B4 100%);*/
/*background: linear-gradient(to bottom, #B0E0E6 0%, #C1CDCD 50%, #87CEEB 100%);*/


  height: 100%;
  padding: 20px 20px 20px 20px;
  color: #444444;

}

.card .card-body h5 {
  margin-bottom: 20px;
}

.card:hover .front {
  transform: rotateY(0);
}

.card:hover .card-body {
  transform: rotateY(-180deg);
}

.card:hover {
  transform: translateY(-5px);
}


    /*
    .card .card-body {
      background: rgba(0, 0, 0, 0.5);
      height: 100%;
      padding: 50px 20px 20px 20px;
      color: #fff;
      transform: rotateY(-180deg);
      backface-visibility: hidden;
    }
    .card .card-body h5 {
      margin-bottom: 20px;
    }
    .card:hover .front {
      transform: rotateY(180deg);
    }
    .card:hover .card-body {
      transform: rotateY(0);
    }
    
    .card:hover {
      transform: translateY(-5px);
    }*/
    /*
    .card-body {
      padding: 20px;
    }*/
    
    .card-title {
    text-align: center; 
    color: black; 
    font-weight: bold; 
    margin-top: 10px; 
    margin-bottom: 50px; 
    padding-bottom: 20px;
}

.card-text {
    text-align: center; 
    margin-top: 5px; 
    margin-bottom: 0; 
    height : 100px
}
    .cardImg {
    	height : 100%;
    	width : 100%;
    }
    
    .card-title a {
      /*color: #000000;*/
      color: #333333;
      text-decoration: none;
    }
    .card-title a:hover {
      text-decoration: underline;
    }
    
    .card-idx {
    /*
        display: inline-block;
        width: 30px; 
        height: 30px; 
        line-height: 30px; 
        text-align: center; 
        border-radius: 50%; 
        background-color: white; 
        border: 1px solid #87CEEB;*/
        color: #333333; 
    }
    
    .btn-outline-info {
      margin-top: 10px;
    }
    
  .blike {
	border : none;
	background-color : transparent;
/*	padding: 0 210px;*/
	position : absolute;
	top : 5px;
	
	padding: 0;
	right: 10px; /* 필요한 경우 위치 조정 */
  z-index: 10; /* 다른 요소 위에 오도록 설정 */
  cursor: pointer; /* 클릭 가능 영역 표시 */
	
}

button.blike:focus {
outline : none;

}  
    
    
/*뉴스*/    
.container-news {
      padding: 20px;
      background-color: #fdfdfd;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-top: 50px;
      margin-bottom: 100px;

    }
    .news-header {
      margin-bottom: 20px;
      text-align: center;
    }

    .news-header h5 {
      font-size: 28px;
      font-weight: 700;
      color: #333333;
    }

    .news-header div {
      font-size: 16px;
      color: #666666;
    }

    .news-count {
      color: #20B2AA;
      font-weight: 700;
    }

    .news-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 10px;
      margin-bottom: 20px;
    }

    .news-table th, .news-table td {
      padding: 10px;
      text-align: left;
    }

    .news-table th {
      background-color: #20B2AA;
      color: #ffffff;
      font-weight: 600;
      border-radius: 10px 10px 0 0;
    }

    .news-table td {
      background-color: #ffffff;
      color: #333333;
      border: 1px solid #e6e6e6;
      border-radius: 0 0 10px 10px;
    }

    .news-table a {
      color: #20B2AA;
      text-decoration: none;
    }

    .news-table a:hover {
      text-decoration: underline;
      color: #008080;
    }
    
/*qanda*/    
    #qna {
    padding: 20px;
}

#qna h5 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
}

.qna-summary {
    margin-bottom: 20px;
    font-size: 16px;
}

.btn-info {
    background-color: #20B2AA;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    text-decoration: none;
}

.btn-info:hover {
    background-color: #78e7e1;
}

.qna-list {
    margin-top: 20px;
}

.qna-item {
    margin-bottom: 20px;
}

.accordion-button {
    background-color: #f8f9fa;
    color: #333;
    font-size: 18px;
    padding: 15px;
    border: none;
    border-bottom: 1px solid #ddd;
    text-align: left;
    width: 100%;
    cursor: pointer;
}

.accordion-button:hover {
    background-color: #e9ecef;
}

.accordion-body {
    background-color: #fff;
    padding: 15px;
    border: 1px solid #ddd;
    border-top: none;
}

.accordion-item:last-child .accordion-button {
    border-bottom: none;
}
#DateTime {
	position : absolute;

	right:3%;
	font-size : 13px;
}

/*공지사항 스타일*/
    .container-notice {
      padding: 20px;
      background-color: #fdfdfd;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
    }

    .notice-header {
      margin-bottom: 20px;
      text-align: center;
    }

    .notice-header h5 {
      font-size: 28px;
      font-weight: 700;
      color: #333333;
    }

    .notice-header div {
      font-size: 16px;
      color: #666666;
    }

    .notice-count {
      color: #20B2AA;
      font-weight: 700;
    }

    .notice-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 10px;
      margin-bottom: 20px;
    }

    .notice-table th, .notice-table td {
      padding: 10px;
      text-align: left;
    }

    .notice-table th {
      background-color: #20B2AA;
      color: #ffffff;
      font-weight: 600;
      border-radius: 10px 10px 0 0;
    }

    .notice-table td {
      background-color: #ffffff;
      color: #333333;
      border: 1px solid #e6e6e6;
      border-radius: 0 0 10px 10px;
    }

    .notice-table a {
      color: #20B2AA;
      text-decoration: none;
    }

    .notice-table a:hover {
      text-decoration: underline;
      color: #008080;
    }
    
    
/* 젤리 버튼 애니메이션 */
.jelly-btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    color: black; /* 텍스트 색상을 파란색으로 설정 */
    background-color: #fff; /* 배경 색상을 흰색으로 설정 */
    border: 2px solid #007bff; /* 경계 색상을 파란색으로 설정 */
    border-radius: 5px;
    transition: all 0.3s ease;
    margin-top: 50px;
}

.jelly-btn:hover {
    background-color: #87CEEB;
    color: #fff;
    animation: jelly 0.5s;
}

.btn.btn-primary.jelly-btn {
	position : absolute;
	left : 36%;
	bottom : 5%;
}

@keyframes jelly {
    0%, 100% {
        transform: scale(1, 1);
    }
    25% {
        transform: scale(0.9, 1.1);
    }
    50% {
        transform: scale(1.1, 0.9);
    }
    75% {
        transform: scale(0.95, 1.05);
    }
}

.header-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
}
.header-container h5 {
margin-top: 30px;
    margin-bottom: 10px;
    font-weight: bolder;
}
.header-container div {
    margin-bottom: 10px;
}

.header-actions {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px; /* 위 여백 추가 */
}

.header-actions span {
    margin-right: 10px; /* 글 개수와 버튼 사이 간격 설정 */    
    

  </style>

</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>
	<!-- Nav tabs -->
<ul class="nav nav-tabs" id="boardTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="friend-tab" data-bs-toggle="tab" data-bs-target="#friend" type="button" role="tab" aria-controls="friend" aria-selected="true">동행찾기</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="news-tab" data-bs-toggle="tab" data-bs-target="#news" type="button" role="tab" aria-controls="news" aria-selected="false">여행지뉴스</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="qna-tab" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="false">Q&A</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice" type="button" role="tab" aria-controls="notice" aria-selected="false">공지사항</button>
  </li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="friend" role="tabpanel" aria-labelledby="friend-tab">

<div class="container-friend">
 <table>
  <div class="header-container">
 <h5>🏃‍♀️동행찾기🏃‍♂️</h5>
  </div>
<div><span> 총  <em id="getCount">${count}</em>건의 글</span></div>
<div class="header-actions">
<a class="btn btn-outline-info jelly-btn " href="/Board/FriendWriteForm?user_idx=${user_idx}&id=${ id }&nowpage=${nowpage}" role="button">글쓰기</a>
</div>
 </table>
 
<%@include file="/WEB-INF/include/pagingmenus.jsp" %>
  
 <div class="card-container ">
 <c:forEach var="posting" items="${postingList}" varStatus="status">

 <div class="card " >
 <div class="front"><a href="/Board/FriendView?board_idx=${posting.board_idx}&nowpage=${nowpage}">
          <img class="cardImg" src="/img/ddu.png" alt="Image">
        </a></div>
  <div class="card-body">
    <p class="card-idx">${posting.board_idx}</p>
<!--    <button class=" blike" type="button" data-board-idx="${posting.board_idx}" data-board-like-idx="${board_like_idx}" data-user-idx="${user_idx}">
     <img src="/img/like_off.png" alt="좋아요">
   </button> -->
    <h5 class="card-title"><a href="/Board/FriendView?board_idx=${posting.board_idx}&nowpage=${nowpage}">${posting.title}</a> </h5>
    <hr>
    <p class="card-text">${posting.content}</p>
    <div class="text-center mt-5">
    <a href="/room?board_idx=${posting.board_idx}" class="btn btn-primary jelly-btn">채팅하기</a>
    </div>
</div>
</div>
 </c:forEach>
 </div>
  </div>
  <%@include file="/WEB-INF/include/paging.jsp" %>
 </div>
  
<div class="tab-pane" id="news" role="tabpanel" aria-labelledby="news-tab">
  <div class="container-news">
  <div class="news-header">
    <h5>여행지뉴스</h5>
    <div><span>총 <em id="getNcount" class="news-count">${ncount}</em>건의 뉴스</span></div>
    </div>
    <table class="news-table">
      <thead>
        <tr>
          <th scope="col">NO.</th>
          <th scope="col">글쓴이</th>
          <th scope="col">제목</th>
          <th scope="col">뉴스보기</th>
          <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="news" items="${newsList}" varStatus="status">
          <tr>
            <td>${news.news_idx}</td>
            <td>${news.user_idx}</td>
            <td>${news.title}</td> 
      <!--      <td><a href="${news.content}" class="news-link" data-news-idx="${news.news_idx}" target="_blank">뉴스보기</a></td>  -->
            <td>
            <a href="${news.content}" class="news-link" data-news-idx="${news.news_idx}" data-hit="${news.hit}" data-click-count="0" target="_blank">
            <form action="/Api/${news.news_idx}/updateNewsHit" method="post">뉴스보기</form></a>
            </td>
            
         <!--     <td>${news.hit}</td>-->
         <td id="hit-count-${news.news_idx}">${news.hit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<!-- ************************************************************************************ -->

<div class="tab-pane" id="qna" role="tabpanel" aria-labelledby="qna-tab">
    <h5>Q&A</h5>
    <div class="qna-summary">총 <em id="getQcount">${qcount}</em>건의 Q&A</div>
    <a class="btn btn-info" href="/Board/QandaWriteForm" role="button">문의 등록</a>

    <div class="qna-list">
        <c:forEach var="qna" items="${qnaList}" varStatus="status">
            <div class="qna-item">
                <div class="accordion" id="accordion${status.index}">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}">
                                ${qna.title}         
                              <div id="DateTime">${qna.created}</div> <!-- created를 여기로 이동 -->
                            </button>
                        </h2>
                        <div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}" data-bs-parent="#accordion${status.index}">
                            <div class="accordion-body">

                                <div>${qna.content}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>




 
  <div class="tab-pane" id="notice" role="tabpanel" aria-labelledby="notice-tab">
<div class="container-notice">
    <div class="notice-header">
      <h5>공지사항</h5>
      <div><span> 총 <em id="getNocount" class="notice-count">${nocount}</em>건</span></div>
    </div>
    <table class="notice-table">
      <thead>
        <tr>
          <th>NO.</th>
          <th>제목</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="notice" items="${noticeList}" varStatus="status">
          <tr>
            <td>${notice.notice}</td>
            <td><a href="#">${notice.title}</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

</div>
	
</body>

<script>
var triggerTabList = [].slice.call(document.querySelectorAll('#boardTab button'))
triggerTabList.forEach(function (triggerEl) {
  var tabTrigger = new bootstrap.Tab(triggerEl)

  triggerEl.addEventListener('click', function (event) {
    event.preventDefault()
    tabTrigger.show()
  })
})



/*===========================*/
/*
function updateClickCount(event, newsIdx) {
    event.preventDefault(); // 기본 링크 동작 방지
    const link = event.target;
    const hitCountElement = document.getElementById(`hit-count-\${newsIdx}`);
    let currentHitCount = parseInt(hitCountElement.textContent, 10);

    // AJAX 요청
    fetch(`/Api/\${newsIdx}/updateNewsHit`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
    })
    .then(response => {
      if (response.ok) {
        currentHitCount += 1;
        hitCountElement.textContent = currentHitCount;
        window.open(link.href, '_blank'); // 새 창으로 링크 열기
      } else {
        console.error('클릭 횟수 업데이트 실패');
      }
    })
    .catch(error => {
      console.error('오류 발생:', error);
    });
  }*/

/*================게시글 좋아요==================*/
 document.addEventListener("DOMContentLoaded", function() {
    const blikeButtons = document.querySelectorAll('.blike');
    console.log('.blike');

    function toggleBlike(button) {
        console.dir(button);

        var img = button.querySelector('img');
        var currentSrc = img.getAttribute('src');
        var boardIdx = button.getAttribute('data-board-idx');
        var boardLikeIdx = button.getAttribute('data-board-like-idx');
        var userIdx = button.getAttribute('data-user-idx');

        console.log('boardIdx:', boardIdx);
        console.log('boardLikeIdx:', boardLikeIdx);
        console.log('userIdx:', userIdx);

        if (currentSrc.includes('like_on.png')) {
            img.setAttribute('src', '/img/like_off.png');
            console.log('스크랩이 해제되었습니다.');
            alert('스크랩이 해제되었습니다.');
            // 이미 스크랩된 상태에서 스크랩 버튼을 클릭한 경우
            deleteBlike(boardIdx, userIdx, boardLikeIdx);
        } else {
            img.setAttribute('src', '/img/like_on.png');
            console.log('스크랩 공고 버튼이 클릭되었습니다.');
            alert('스크랩 되었습니다.');
            // 스크랩되지 않은 상태에서 스크랩 버튼을 클릭한 경우
            addBlike(boardIdx, userIdx, boardLikeIdx);
        }
    }

    function addBlike(boardIdx, userIdx, boardLikeIdx) {
        fetch(`/Api/Board/\${boardIdx}/\${userIdx}/\${boardLikeIdx}/addBlike`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ board_idx: boardIdx, user_idx: userIdx, board_like_idx: boardLikeIdx })
        }).then(response => {
            if (!response.ok) {
                throw new Error('Failed to toggle like');
            }
            return response.text();
        }).then(liketext => {
            console.log('Server response:', liketext);
        }).catch(error => console.error('Error toggling like:', error));
    }

    function deleteBlike(boardIdx, userIdx, boardLikeIdx) {
        fetch(`/Api/Board/\${boardIdx}/\${userIdx}/\${boardLikeIdx}/deleteBlike`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ board_idx: boardIdx, user_idx: userIdx, board_like_idx: boardLikeIdx })
        }).then(response => {
            if (!response.ok) {
                throw new Error('Failed to toggle like');
            }
            return response.text();
        }).then(liketext => {
            console.log('Server response:', liketext);
        }).catch(error => console.error('Error toggling like:', error));
    }

    blikeButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            toggleBlike(button);
            console.log('Button clicked');
        });
    });
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>



<%@include file="/WEB-INF/include/footer.jsp"%>


</html>
