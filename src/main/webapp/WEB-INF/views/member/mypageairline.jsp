<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Airline 마이페이지</title>
    <style>
        /* 스타일링을 위한 CSS */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body1 {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow-y: auto;
        }
        .container1 {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            width: 100%;
            max-width: 1200px; /* 최대 너비를 설정 */
        }
        .sidebar {
            font-size: 19px;
            text-align: center;
            width: 200px;
            background-color: #6e8efb;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: auto;
            position: sticky;
            top: 0;
        }
        .sidebar h3 {
            color: #fff;
            margin-bottom: 20px;
            text-align: center;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin-bottom: 10px;
        }
        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
        }
        .sidebar ul li a:hover {
            background-color: #a777e3;
        }
        .register-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            transition: transform 0.3s ease-in-out;
            margin-left: 20px; /* 사이드바와의 간격을 위한 마진 */
        }
        .register-container:hover {
            transform: scale(1.02);
        }
        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            text-align: center;
            color: #6e8efb;
            font-weight: 600;
            font-size: 24px;
            position: relative;
        }
        h2::after {
            content: '';
            width: 50px;
            height: 3px;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            display: block;
            margin: 10px auto 0;
            border-radius: 2px;
        }
        h3::after {
            content: '';
            width: 115px;
            height: 3px;
            background: #fff;
            display: block;
            margin: 10px auto 0;
            border-radius: 2px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }
        .form-group span {
            display: block;
            padding: 12px;
            border-radius: 8px;
            background: #f9f9f9;
            color: #333;
            font-size: 16px;
            margin-top: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        button[type="submit"],  #goList {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
            margin-top: 20px;
        }
        button[type="submit"]:hover,  #goList:hover {
            background: linear-gradient(135deg, #a777e3, #6e8efb);
            transform: scale(1.05);
        }
        .logo-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .logo-container img {
            max-width: 100px; /* 로고 이미지의 최대 가로 길이를 지정 */
            margin-right: 10px; /* 로고 이미지와 텍스트 사이의 간격 조정 */
        }
    </style>
<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
   crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
</head>
<body1>
    <div class="container1">
        <div class="sidebar">
            <h3>마이페이지</h3>
            <ul>
                 <li><a href="/mypage">회원정보</a></li>
                <li><a href="#">내가 등록한 상품</a></li>
                <li><a href="#">신청자 목록</a></li>
                <li><a href="#">마감된 상품</a></li>
                <li><a href="#">대화내역</a></li>
            </ul>
        </div>

        <div class="register-container">
            <h2>Airline 회원정보 보기</h2>
            <form action="/mypageAirlineUpdateForm" method="post">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <span>${user.id}</span>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <span>${user.email}</span>
                </div>
                <div class="form-group">
                    <label for="name">회사명:</label>
                    <span>${airline.name}</span>
                </div>
                <div class="form-group">
                    <label for="cnum">사업자등록번호:</label>
                    <span>${airline.cnum}</span>
                </div>
                <div class="form-group">
                    <label for="phone">연락처:</label>
                    <span>${airline.phone}</span>
                </div>
                <div class="form-group">
                    <label for="logo">로고:</label>
                    <img src="${airline.logo}"> <!-- 이미지 파일을 표시하는 img 요소 -->
                </div>
                
                <button type="submit">정보수정</button>
                <input type="button" value="취소" id="goList">
            </form>
        </div>
    </div>

    <script>
        const goListEl = document.getElementById('goList');
        goListEl.addEventListener('click', function(e) {
            location.href = '/';
        });
    </script>
    
</body>
</html>