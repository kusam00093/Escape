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
#comment-form, .container2{
margin-top: 20px;
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
<div class="container2">
<h6>댓글</h6>
  <c:forEach var="comment" items="${commentList}" varStatus="status">
<input type="hidden" class="comment-board-idx" name="board_idx" value="${comment.board_idx }" readonly />
    <div class="card mb-3">
      <div class="card-body">
        <h5 class="card-title"  style="font-size: 14px;">댓글 번호: ${comment.board_comment_idx}</h5>
        <p class="card-text" style="font-size: 25px;">${comment.content}</p>
        <p class="card-text"><small class="text-muted">작성일: ${comment.created}</small></p>

     <!-- <a href="/Api/Board/${board.board_idx}/${comment.board_comment_idx}/commentDelete" class="btn btn-primary delete-comment-btn" data-board-idx="${board.board_idx}" data-comment-idx="${comment.board_comment_idx}" >삭제</a> -->  
       <a href="/Api/Board/${comment.board_idx}/${comment.board_comment_idx}/commentDelete" class="btn btn-primary delete-comment-btn" data-board-idx="${comment.board_idx}" data-comment-idx="${comment.board_comment_idx}" >삭제</a>
           
      </div>
    </div>
  </c:forEach>
</div>

      
<!-- 댓글 쓰기 -->
<form action="/Api/Board/{board.board_idx}/commentCreate" method="POST" id="comment-form">
  <input type="hidden" class="comment-board-idx" name="board_idx" value="${board.board_idx }" readonly />
  <input type="hidden" class="comment-idx" name="comment_idx" value="${commentVo.board_comment_idx}" readonly />
  <div class="form-group">
    <label for="content">댓글내용</label>
    <input type="text" class="form-control" id="content" name="content">
  </div>
  
  <button type="submit" class="btn btn-primary" id="comment-create-btn">댓글 작성</button>
</form>



</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
	  document.getElementById('comment-form').addEventListener('submit', (event) => {
	    event.preventDefault(); // 폼의 기본 제출 동작을 방지합니다.

	    let board_idx_element = document.querySelector('.comment-board-idx');
	    if (!board_idx_element) {
	      console.error('board-idx element not found');
	      alert('board-idx element not found.');
	      return;
	    }
	    let board_idx = parseInt(board_idx_element.value, 10);
	    console.log('board_idx:', board_idx); // 디버깅을 위해 추가
	    
	    // Check if board_idx is NaN
	    if (isNaN(board_idx)) {
	      console.error('Invalid board_idx:', board_idx);
	      alert('Invalid board index.');
	      return;
	    }

	    let url = `/Api/Board/\${board_idx}/commentCreate`;

	    const commentVo = {
	    	      content: document.querySelector('#content').value,
	    	    };


	    const params = {
	      method: 'POST',
	      headers: { "Content-Type": "application/json" },
	      body: JSON.stringify(commentVo)
	    };

	    fetch(url, params)
	      .then(response => response.json()) 
	      .then(data => {
	        if (data) {
	          alert("댓글이 등록되었습니다");
	          window.location.reload(); 
	        } else {
	          alert("댓글 등록 실패!");
	        }
	      })
	      .catch(error => {
	        console.error('댓글 등록 에러:', error);
	        alert("댓글 등록 중 오류가 발생했습니다.");
	      });
	  });
	});
	
	
	/*댓글 삭제*/
    // 삭제 버튼 클릭 이벤트 핸들러
document.querySelectorAll('.delete-comment-btn').forEach(function(button) {
    button.addEventListener('click', function(event) {
        event.preventDefault(); // 기본 동작 방지

        var boardIdx = this.getAttribute('data-board-idx'); // 게시글 인덱스 가져오기
        var commentIdx = this.getAttribute('data-comment-idx'); // 댓글 인덱스 가져오기

        fetch(`/Api/Board/\${boardIdx}/\${commentIdx}/commentDelete`, { // 게시글 번호와 댓글 번호를 사용하여 URL 구성
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ board_idx: boardIdx, board_comment_idx: commentIdx }), 
        })
        .then(response => response.json())
        .then(data => {

            console.log('댓글이 삭제되었습니다.');
            alert("댓글이 삭제되었습니다");
	        window.location.reload(); 
           
        })
        .catch((error) => {
            console.error('Error:', error);
        });
    });

});


/*답글

const replyButtons = document.querySelectorAll('.reply-button');

  replyButtons.forEach(button => {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      
      // 답글 폼 생성
      const replyForm = document.createElement('form');
      replyForm.setAttribute('class', 'comment-form');
      replyForm.setAttribute('action', '/Api/Board/${board_idx}/commentCreate');
      replyForm.setAttribute('method', 'POST');
      replyForm.setAttribute('enctype', 'application/json');

      // 답글 폼 내부 요소 추가
      const boardIdxInput = document.createElement('input');
      boardIdxInput.setAttribute('type', 'hidden');
      boardIdxInput.setAttribute('class', 'comment-board-idx');
      boardIdxInput.setAttribute('name', 'board_idx');
      boardIdxInput.setAttribute('value', '\${board.board_idx}');
      replyForm.appendChild(boardIdxInput);

      const commentIdxInput = document.createElement('input');
      commentIdxInput.setAttribute('type', 'hidden');
      commentIdxInput.setAttribute('class', 'comment-idx');
      commentIdxInput.setAttribute('name', 'comment_idx');
      commentIdxInput.setAttribute('value', '\${commentVo.board_comment_idx}');
      replyForm.appendChild(commentIdxInput);

      const contentLabel = document.createElement('label');
      contentLabel.setAttribute('for', 'content');
      contentLabel.textContent = '댓글내용';
      replyForm.appendChild(contentLabel);

      const contentInput = document.createElement('input');
      contentInput.setAttribute('type', 'text');
      contentInput.setAttribute('class', 'form-control comment-content');
      contentInput.setAttribute('id', 'content');
      contentInput.setAttribute('name', 'content');
      replyForm.appendChild(contentInput);

      const submitButton = document.createElement('button');
      submitButton.setAttribute('type', 'submit');
      submitButton.setAttribute('class', 'btn btn-primary');
      submitButton.textContent = '댓글 작성';
      replyForm.appendChild(submitButton);

      // 답글 폼을 해당 댓글 아래에 추가
      const cardBody = button.parentElement;
      cardBody.appendChild(replyForm);
    });
  });
*/

</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>