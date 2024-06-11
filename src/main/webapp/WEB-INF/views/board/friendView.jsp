<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f8f9fa;
  padding: 40px;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #343a40;
}

.form-group {
  margin-bottom: 20px;
}

.label {
  font-weight: bold;
  color: #495057;
}

.form-control {
  border: 2px solid #ced4da;
  border-radius: 5px;
  padding: 10px;
  width: 100%;
  transition: border-color 0.3s;
}

.form-control:focus {
  border-color: #80bdff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
}

.btn-primary {
  background-color: #007bff;
  border-color: #007bff;
  border-radius: 5px;
  padding: 10px 20px;
  color: #ffffff;
  text-decoration: none;
  transition: background-color 0.3s, border-color 0.3s;
}

.btn-primary:hover {
  background-color: #0056b3;
  border-color: #004085;
}

.btn-delete {
  background-color: #dc3545;
  border-color: #dc3545;
}

.btn-delete:hover {
  background-color: #c82333;
  border-color: #bd2130;
}
</style>
</head>
<body>
<div>
<h2>동행친구찾기</h2>
 <div>

          <!-- <form action="Board/FriendView${board.board_idx}" method="post">-->
          <form action="/Board/Boardhome" method="post">
          <input type="hidden" name="board_idx" value="${board.board_idx}">
 
 
                <div class="form-group">
                    <label for="board_idx">글번호</label>
                    <div class="form-control" >${board.board_idx}</div>
                </div>
                <div class="form-group">
                    <label for="user_idx">아이디</label>
                    <div class="form-control" >${board.user_idx}</div>
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <div class="form-control" >${board.title}</div>
                </div>
                <div class="form-group">
                    <label for="hit">조회수</label>
                    <div class="form-control" >${board.hit}</div>
                </div>
                
                <div class="form-group">
                    <label for="created">작성일</label>
                    <div>${board.created}</div>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <div class="form-control" style="height: 240px; overflow-y: auto;">${board.content }</div>
                </div>

                <div style="text-align:center;">
                <button type="submit" class="btn btn-primary">목록으로</button>
                <a href="/Board/FriendUpdateForm?board_idx=${board.board_idx }" class="btn btn-primary">수정하기</a>
                <a href="/Board/FriendDelete?board_idx=${board.board_idx }" class="btn btn-primary">삭제</a>
                
                </div>
                
            </form>
 </div>
<!-- 댓글 추가
 <div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> 댓글
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
				<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
				<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
				<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">댓글완성</button>
		    </li>
		</ul>
	</div>
</div>
--> 

<!-- 댓글 리스트 -->
<div class="container2" >
        <c:forEach var="comment" items="${commentList}" varStatus="status">
          <div class="form-group">
                    <label for="created">작성일</label>
                    <div>${comment.created}</div>
                </div>
          <div class="form-group">
                    <label for="board_comment_idx">댓글 번호</label>
                    <div>${comment.board_comment_idx}</div>
                </div>
          <div class="form-group">
                    <label for="content">내용</label>
                    <div>${comment.content}</div>
                </div>
        </c:forEach>
      </div>
<!-- 댓글 리스트 -->
<form action="/Api/Board/{board_idx}/commentCreate" method="POST">
<input type="hidden" name="board_idx" value="${commentVo.board_idx}">
<div class="form-group">
      <label for="content">내용</label>
      <input type="text" class="form-control" id="content" name="content">
 </div>
<button type="button" class="btn btn-primary" id="comment-create-btn">댓글 작성</button>
</form>


</div>

<script>
const commentCreateBtnEl = document.getElementById('comment-create-btn');

commentCreateBtnEl.addEventListener('click', ()=> {
   
   let board_idx = parseInt(document.querySelector('#new-comment-id').value); 
   let url = 'http://localhost:9089/Api/Board/{board_idx}/commentCreate';
   
 const comment = {

     board_comment_idx : document.querySelector('#new-comment-nickname').value,

     content      : document.querySelector('#new-comment-body').value,
     // 부모 게시글의 id
     ccomu_bno  : ccomu_bno // 정수로 변환된 ccomu_bno 값 사용
 };

 const params = {
     method  : 'POST',
     headers : {"Content-Type":"application/json" },
     body    : JSON.stringify( comment )   
 };

   fetch(url, params)
         .then(response => response.json()) // 응답 데이터를 JSON 으로 변환
         .then(data => {
             if(data) {
                   alert("댓글이 등록되었습니다");
                   window.location.reload(); // 성공한 경우 페이지 새로고침
             } else {
                  alert("댓글 등록 실패!");
             }
         }) 
       .catch(error => {
             console.error('댓글 등록 에러:', error);
             alert("댓글 등록 중 오류가 발생했습니다.");         
       })
});







/*
document.addEventListener('DOMContentLoaded', () => {



 document.addEventListener("DOMContentLoaded", function() {
    function commentGet(board_idx) {
        fetch(`/Api/Board/\${board_idx}/commentGet`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ board_idx})
        }).then(response => {
            if (!response.ok) {
                throw new Error('Failed to fetch comments');
            }
            return response.json();
        }).then(commentList => {
            console.log('Server response:', commentList);
            updateComments(commentList);
        }).catch(error => console.error('Error fetching comments:', error));
    }
}); 

function updateComments(commentList) {
    const container = document.querySelector('.container2');
    container.innerHTML = '';

    commentList.forEach(comment => {
        const commentDiv = document.createElement('div');
        commentDiv.classList.add('form-group');

        const createdDiv = document.createElement('div');
        createdDiv.innerHTML = `<label for="created">작성일</label><div>\${comment.created}</div>`;
        commentDiv.appendChild(createdDiv);

        const idxDiv = document.createElement('div');
        idxDiv.innerHTML = `<label for="board_comment_idx">댓글 번호</label><div>\${comment.board_comment_idx}</div>`;
        commentDiv.appendChild(idxDiv);

        const contentDiv = document.createElement('div');
        contentDiv.innerHTML = `<label for="content">내용</label><div>\${comment.content}</div>`;
        commentDiv.appendChild(contentDiv);

        container.appendChild(commentDiv);
    });
}
*/
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>