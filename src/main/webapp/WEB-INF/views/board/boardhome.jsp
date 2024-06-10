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


<!--
.card-container{
display: grid;
grid-template-columns: repeat(5, 1fr);
grid-gap: 20px;
}-->
<style>
    body {
      padding: 40px;
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
    .card-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      margin-top: 20px;
      justify-content: space-between;
      padding-left: 20px;
      padding-right: 20px;
    }
    .card {
      flex: 1 1 calc(33.333% - 20px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s;
      margin-bottom: 20px;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .card-body {
      padding: 20px;
    }
    .card-title a {
      color: #007bff;
      text-decoration: none;
    }
    .card-title a:hover {
      text-decoration: underline;
    }
    .btn-outline-info {
      margin-top: 10px;
    }
    
/*뉴스 스타일

  .container-qna {
      padding: 20px;
      background-color: #fdfdfd;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
    }

    .qna-header {
      margin-bottom: 20px;
      text-align: center;
    }

    .qna-header h5 {
      font-size: 28px;
      font-weight: 700;
      color: #333333;
    }

    .qna-header div {
      font-size: 16px;
      color: #666666;
    }

    .qna-count {
      color: #20B2AA;
      font-weight: 700;
    }

    .qna-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 10px;
      margin-bottom: 20px;
    }

    .qna-table th, .qna-table td {
      padding: 10px;
      text-align: left;
    }

    .qna-table th {
      background-color: #20B2AA;
      color: #ffffff;
      font-weight: 600;
      border-radius: 10px 10px 0 0;
    }

    .qna-table td {
      background-color: #ffffff;
      color: #333333;
      border: 1px solid #e6e6e6;
      border-radius: 10px;
    }

    .qna-table a {
      color: #1E90FF;
      text-decoration: none;
      font-weight: 600;
    }

    .qna-table a:hover {
      text-decoration: underline;
      color: #008080;;
    }

    .accordion-flush .accordion-item {
      border: none;
      margin-bottom: 10px;
    }

    .accordion-flush .accordion-header {
      padding: 0;
    }

    .accordion-flush .accordion-button {
      background-color: #ffffff;
      color: #333333;
      font-weight: 600;
      padding: 15px;
      border: 1px solid #e6e6e6;
      border-radius: 10px;
      transition: background-color 0.3s, color 0.3s;
    }

    .accordion-flush .accordion-button:hover {
      background-color: #20B2AA;;
      color: #ffffff;
    }

    .accordion-flush .accordion-body {
      border: 1px solid #e6e6e6;
      border-top: none;
      padding: 15px;
      border-radius: 0 0 10px 10px;
    }

    .btn-outline-info {
      margin-top: 10px;
      border-radius: 10px;
      padding: 10px 20px;
      font-weight: 600;
      transition: background-color 0.3s, color 0.3s;
    }

    .btn-outline-info:hover {
      background-color: #20B2AA;;
      color: #ffffff;
    }*/
    .container-news {
      padding: 20px;
      background-color: #fdfdfd;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
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
  </style>

</head>
<body>

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

 <table>
 <h5>동행찾기</h5>
<div><span> 총  <em id="getCount">${count}</em>건의 글</span></div>
<a class="btn btn-outline-info" href="/Board/FriendWriteForm" role="button">글쓰기</a>
<!--  
 <tr>
 <td>NO.</td>
 <td>글쓴이</td>
 <td><a>제목</a></td>
 <td>조회수</td>
 </tr>
 -->
 </table>
 <div class="card-container">
 <c:forEach var="posting" items="${postingList}" varStatus="status">
 <!--  
 <table>
 <tr>
 <td>${posting.board_idx}</td>
 <td>${posting.user_idx}</td>
 <td><a href="#">${posting.title}</a></td>
 <td>${posting.hit}</td>
 </tr>
 </table>
 -->
 <div class="card" style="width: 18rem;">
  <!-- <img src="..." class="card-img-top" alt="postingimg"> -->
  <div class="card-body">
    <p class="card-idx">${posting.board_idx}</p>
    <h5 class="card-title"><a href="/Board/FriendView?board_idx=${posting.board_idx}">${posting.title}</a> </h5>
    <p class="card-text">${posting.content}</p>
    <a href="#" class="btn btn-primary">채팅하기</a>
  </div>
</div>
 </c:forEach>
 </div>
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
          <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="news" items="${newsList}" varStatus="status">
          <tr>
            <td>${news.news_idx}</td>
            <td>${news.user_idx}</td>
            <td><a href="#">${news.title}</a></td>
            <td>${news.hit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<div class="tab-pane" id="qna" role="tabpanel" aria-labelledby="qna-tab"> 
 <table>
 <h5>Q&A</h5>
<div><span> 총  <em id="getQcount">${qcount}</em>건의 Q&A</span></div>
<a class="btn btn-outline-info" href="/Board/QWrite" role="button">문의등록</a>
<!-- 
 <tr>
 <td>NO.</td>
 <td>글쓴이</td>
 <td><a>제목</a></td>
 <td>답변유무</td>
 </tr>
 -->
 </table>
 <table>
 <c:forEach var="qna" items="${qnaList}" varStatus="status">
    <div class="accordion accordion-flush" id="accordionFlushExample">
      <div class="accordion-item">
        <h6 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${qna.qanda_idx}" aria-expanded="false" aria-controls="flush-collapse${qna.qanda_idx}"> ${qna.title}
          </button>
        </h6>
        <div id="flush-collapse${qna.qanda_idx}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
          <div class="accordion-body">${qna.content}</div>
        </div>
      </div>
      
        </div>
      </div>
 </c:forEach>
 </table>
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
<!--  
  <div class="tab-pane" id="notice" role="tabpanel" aria-labelledby="notice-tab">
<table>
 <h5>공지사항</h5>
<div><span> 총  <em id="getNocount">${nocount}</em>건</span></div>
 <tr>
 <td>NO.</td>
 <td><a>제목</a></td>
 </tr>
 </table>
 <c:forEach var="notice" items="${noticeList}" varStatus="status">
 <table>
 <tr>
 <td>${notice.notice}</td>
 <td><a href="#">${notice.title}</a></td>
 </tr>
 </table>
 </c:forEach>

</div>
</div>
-->
	
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

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>





