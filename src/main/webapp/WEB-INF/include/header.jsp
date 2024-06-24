<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header with Buttons</title>
    <style>
        /* 스타일링을 위한 CSS */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }
        .navbar {
            background-color: #fff;
        }
        .form-control {
            padding: 10px;
            margin-right: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        .btn {
            padding: 10px 15px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
        }
        .btn-outline-success {
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: #fff;
        }
        .btn-outline-success:hover {
            background: linear-gradient(135deg, #a777e3, #6e8efb);
            transform: scale(1.05);
        }
        .btn-nav {
            margin-left: 10px;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: #fff;
            text-decoration: none;
            display: inline-block;
            padding: 10px 15px;
            border-radius: 10px;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
        }
        .btn-nav:hover {
            background: linear-gradient(135deg, #a777e3, #6e8efb);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <img id="headerlogo" src="/images/rocket.png" alt="제작예정">
            </a>
            <nav class="navbar navbar-light" style="background-color: #fff;">
                <div class="container-fluid package_search_1">
                    <form class="d-flex">
                        <input class="form-control" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">검색</button>
                    </form>
                </div>
            </nav>
            <div>
					<c:choose>
					<c:when test="${not empty sessionScope.login}">
				        <ul class="nav col-12 col-lg-auto me-3 mb-2 justify-content-center mb-md-0">
				            <li><a href="/profile" class="btn-nav">마이페이지</a></li>
				            <li><a href="/logout" class="btn-nav">로그아웃</a></li>
				        </ul>
				    </c:when>
				    <c:otherwise>
				        <ul class="nav col-12 col-lg-auto me-3 mb-2 justify-content-center mb-md-0">
				            <li><a href="/personlogin" class="btn-nav">로그인</a></li>
				            <li><a href="/join" class="btn-nav">회원가입</a></li>
				        </ul>
				    </c:otherwise>
				</c:choose>
            </div>
        </header>
    </div>
</body>
</html>


    </header>
  </div>
