<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>