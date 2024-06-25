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

.btn-primary:focus {
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}
</style>
</head>
<body>
<div>
<h2>동행친구찾기</h2>
 <div>

          <!-- <form action="Board/FriendView${board.board_idx}" method="post">-->
          <form action="/Board/FriendUpdate" method="post">
        <!--    <input type="hidden" name="board_idx" value="${board_idx}">-->
          <input type="hidden" name="user_idx" value="${board.user_idx}">
          <input type="hidden" name="id" value="${sessionScope.login.id}">
 
                <div class="form-group">
                    <label for="board_idx">글번호</label>
                    <input type="text" class="form-control" id="board_idx" name="board_idx" value="${board.board_idx }" readonly>
                </div>
 <!-- 
                <div class="form-group">
                    <label for="user_idx">아이디</label>
                    <input type="text" class="form-control" id="user_idx" name="user_idx" value="${board.user_idx }" required>
                </div>
                <div class="form-group">
                    <label for="hit">조회수</label>
                    <input type="text" class="form-control" id="hit" name="hit" value="${board.hit }" required>
                </div>
                
                <div class="form-group">
                    <label for="created">작성일</label>
                    <input type="text" class="form-control" id="created" name="created" value="${board.created }" required>
                </div>-->
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value="${board.title }" required>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="15" wrap="soft" style="resize: none;"required>${ board.content }</textarea>
                </div>

                <div style="text-align:center;">
                <button type="submit" class="btn btn-primary">수정하기</button>
                </div>
                
            </form>
 </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>