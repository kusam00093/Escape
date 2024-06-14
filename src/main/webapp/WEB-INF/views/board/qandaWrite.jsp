<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
      padding: 40px;
      background-color: #f8f9fa;
      font-family: 'Arial', sans-serif;
    }
    h3 {
      text-align: center;
      margin-bottom: 40px;
      color: #343a40;
      font-weight: bold;
    }
    .form-container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      margin: 0 auto;
    }
    .form-group label {
      font-weight: bold;
      color: #495057;
    }
    .form-control {
      border: 2px solid #ced4da;
      border-radius: 10px;
      padding: 10px;
      transition: border-color 0.3s;
    }
    .form-control:focus {
      border-color: #80bdff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
      border-radius: 10px;
      padding: 10px 20px;
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
<!-- 
<h2>문의등록</h2>
<form action="/Board/QandaWrite" method="post">
<div class="form-group">
<label for="title">제목</label>
<input type="text" class="form-control" id="title" name="title" >
<div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" id="content" name="content" rows="15" wrap="soft" style="resize: none;"></textarea>
    </div>
    <div style="text-align: center;">
      <button type="submit" class="btn btn-primary">글 작성</button>
    </div>
</div>
</form>
 -->

<div class="form-container">
  <h3>문의등록</h3>
  <form action="/Board/QandaWrite" method="post">
    <div class="form-group">
      <label for="user_idx">아이디</label>
      <input type="text" class="form-control" id="user_idx" name="user_idx">
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title" name="title">
    </div>

    <div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" id="content" name="content" rows="15" wrap="soft" style="resize: none;"></textarea>
    </div>
    <div style="text-align: center;">
      <button type="submit" class="btn btn-primary">글 작성</button>
    </div>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>