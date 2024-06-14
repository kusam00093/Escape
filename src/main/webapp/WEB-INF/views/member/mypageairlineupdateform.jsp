<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Airline 마이페이지</title>
    <style>
        /* 스타일링을 위한 CSS */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            overflow-y: auto;
        }
        .register-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px; /* 전체 가로 길이를 소폭 줄임 */
            margin: 20px 0;
            transition: transform 0.3s ease-in-out;
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
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }
        .form-group span, input {
        	width: 95%;
            display: block;
            padding: 12px; /* 텍스트 내용이 돋보이도록 패딩을 조금 더 추가 */
            border-radius: 8px;
            background: #f9f9f9;
            color: #333;
            font-size: 16px; /* 텍스트 크기를 키움 */
            margin-top: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 텍스트를 돋보이게 하기 위해 그림자 효과 추가 */
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
         input[type="button"] {
        	width: 120px;
            padding: 10px;
            border: none;
            border-radius: 10px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: #fff;
        }
        input[type="button"]:hover{
            background: linear-gradient(135deg, #0072ff, #00c6ff);
            transform: scale(1.05);
        }
    </style>
    
    <script>
function checkIdExists() {
    var id = document.getElementById("id").value;
    if (!id) {
        document.getElementById("id_alert").innerText = "ID를 입력하세요.";
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/checkIdExists", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response) {
                var idAlert = document.getElementById("id_alert");
                idAlert.innerText = "ID가 이미 존재합니다.";
                idAlert.style.color = "red"; // ID가 이미 존재할 때 빨간색으로 설정
            } else {
                var idAlert = document.getElementById("id_alert");
                idAlert.innerText = "ID를 사용할 수 있습니다.";
                idAlert.style.color = "green"; // ID를 사용할 수 있을 때 초록색으로 설정
            }
        }
    };
    xhr.send("id=" + id);
}

function checkPasswordMatch() {
    var password = document.getElementById("passwd").value;
    var confirmPassword = document.getElementById("confirm_passwd").value;
    
    if (!password || !confirmPassword) {
        document.getElementById("password_match").innerText = "비밀번호를 입력하세요.";
        return false;
    }

    if (password !== confirmPassword) {
        var passwordMatch = document.getElementById("password_match");
        passwordMatch.innerText = "비밀번호가 일치하지 않습니다. 다시 확인하세요";
        passwordMatch.style.color = "red"; // 비밀번호 불일치 시 빨간색으로 설정
        return false;
    } else {
        var passwordMatch = document.getElementById("password_match");
        passwordMatch.innerText = "비밀번호가 일치합니다. 계속 진행하세요";
        passwordMatch.style.color = "green"; // 비밀번호 일치 시 초록색으로 설정
        return true;
    }
}

function validateForm(event) {
	if (!checkPasswordMatch()) {
		event.preventDefault();
	}
}

</script>


</head>
<body>
    <div class="register-container">
        <h2>Airline 회원정보 수정하기</h2>
        <form action="/mypageAirlineUpdate" method="post" onsubmit="validateForm(event)">
        <input type="hidden" id="user_idx" name="user_idx" value="${user.user_idx}">
        <input type="hidden" id="id" name="id" value="${user.id}">
        <input type="hidden" id="id" name="type" value="${user.type}">
        <input type="hidden" id="airline_idx" name=airline_idx value="${airline.airline_idx}">
            <div class="form-group">
                <label for="id">ID:</label>
                <span>${user.id}</span>
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="passwd" name="passwd" value="${user.passwd}" required>
            </div>
           	<div class="form-group">
  			  	<label for="confirm_password">비밀번호 확인:</label>
      		  	<input type="password" id="confirm_passwd" name="confirm_passwd" value="${user.passwd}" required oninput="checkPasswordMatch()">
      		 	 <p id="password_match"></p> <!-- 비밀번호 일치 확인 알림 -->
			</div>
			
			<div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
            </div>
    
            <div class="form-group">
                <label for="first_name">회사명:</label>
                <input type="text" id="name" name="name" value="${airline.name}" required>
            </div>
            
            <div class="form-group">
                <label for="social_num">사업자등록번호:</label>
                <input type="text" id="cnum" name="cnum" value="${airline.cnum}" required>
            </div>
            <div class="form-group">
                <label for="phone">연락처:</label>
                <input type="text" id="phone" name="phone" value="${airline.phone}" required>
            </div>
            
            <div class="form-group">
                <label for="nickname">로고:</label>
                <input type="text" id="logo" name="logo" value="${airline.logo}">
            </div>
            
            <button type="submit">정보수정</button>
            <input type="button" value="취소" id="goList">
            
        </form>
    </div>
    
<script>
        const goListEl = document.getElementById('goList');
        goListEl.addEventListener('click', function(e) {
            location.href = '/mypage';
        });
</script>


</body>
</html>