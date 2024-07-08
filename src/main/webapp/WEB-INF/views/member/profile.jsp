<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Person 프로필</title>
    
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
            align-items: flex-start; /* 화면 위쪽에 붙이기 */
            min-height: 100vh;
            overflow-y: auto;
        }
        .container1 {
            display: flex;
            align-items: flex-start; /* 화면 위쪽에 붙이기 */
            justify-content: center;
            width: 100%;
            max-width: 1200px; /* 최대 너비를 설정 */
            margin-top: 20px; /* 위쪽에 약간의 여백 추가 */
        }
        .sidebar {
        	margin-top: 20px;
            font-size: 19px;
            text-align: center;
            width: 200px;
            background-color: #6e8efb;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: auto; /* 사이드바의 높이를 내용에 맞게 설정 */
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
            max-width: 700px; /* 너비를 더 크게 설정 */
            transition: transform 0.3s ease-in-out;
            margin-left: 20px; /* 사이드바와의 간격을 위한 마진 */
            margin-top: 20px; /* 위쪽에 약간의 여백 추가 */
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
            font-size: 32px; /* 글자 크기 키우기 */
            position: relative;
        }
        h2::after {
            content: '';
            width: 500px;
            height: 3px;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            display: block;
            margin: 10px auto 0;
            border-radius: 2px;
        }
        #sidebartitle::after {
            content: '';
            width: 140px;
            height: 3px;
            background: #fff;
            display: block;
            margin: 10px auto 0;
            border-radius: 2px;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group label {
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
            display: block;
            font-size: 22px; /* 글자 크기 키우기 */
        }
        .form-group span {
            display: block;
            padding: 12px;
            border-radius: 8px;
            background: #f9f9f9;
            color: #333;
            font-size: 20px; /* 글자 크기 키우기 */
            margin-top: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .profile-picture {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .profile-picture img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 4px solid #6e8efb; /* 추가된 스타일 */
        }
        .profile-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: linear-gradient(135deg, #e9f0f7, #f7f9fc);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease-in-out;
        }
        .profile-card:hover {
            transform: scale(1.05);
        }
        .profile-details {
            width: 100%;
            text-align: center;
            margin-top: 20px;
        }
        .profile-details .form-group {
            margin-bottom: 15px;
        }
        button[type="submit"], #goList {
            width: 150px;
            padding: 15px;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px; /* 글자 크기 키우기 */
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
            margin-top: 20px;
        }
        button[type="submit"]:hover, #goList:hover {
            background: linear-gradient(135deg, #a777e3, #6e8efb);
            transform: scale(1.05);
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
            <h3 id="sidebartitle">마이페이지</h3>
            <ul>
                <li><a href="/profile">회원정보</a></li>
                <li><a href="/mypagebuy">신청내역</a></li>
                <li><a href="/mypagebookmark">위시리스트</a></li>
                <li><a href="/mypageboard">대화목록</a></li>
            </ul>
        </div>

        <div class="register-container">
            <div class="profile-card">
                <h2>${person.last_name}${person.first_name}님 프로필</h2>
          	  <form action="/mypageUpdateForm" method="post">
                <div class="profile-picture">
                    <img src="${person.image}">
                </div>
                
                <div class="profile-details">
                    <div class="form-group">
                        <label for="id">ID: ${user.id}</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email: ${user.email}</label>
                    </div>
                
                    <div class="form-group">
                        <label for="phone">Phone: ${person.phone}</label>
                    </div>
                    
                    <div class="form-group">
                    	<label for="address1">주소: ${person.address1}</label>
                	</div>
                
               	 	<div class="form-group">
                    	<label for="address2">상세주소: ${person.address2}</label>
                	</div>
                
                    <div class="form-group">
                        <label for="nickname">Nickname: ${person.nickname}</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="point">포인트: ${person.point}</label>
                    </div>
                    
                <button type="submit">정보수정</button>
                <input type="button" value="취소" id="goList">
                
                </div>
                
                 </form>
                 
            </div>
        </div>
    </div>
    
    <script>
        const goListEl = document.getElementById('goList');
        goListEl.addEventListener('click', function(e) {
            location.href = '/';
        });
    </script>

</body1>
</html>
