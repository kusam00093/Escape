<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Person 마이페이지</title>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일 경우 조합형 주소 조합
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형 주소가 있을 경우 마지막에 붙여줌
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합형 주소를 최종 주소에 추가
                    fullAddr += extraAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 입력              
                document.getElementById('zip_code').value = data.zonecode;;
                
                // 주소 정보를 해당 필드에 입력
                document.getElementsByName('address1')[0].value = fullAddr; // 주소

                // 커서를 상세주소 필드로 이동
                document.getElementsByName('address2')[0].focus();
            }
        }).open();
    }
</script>


</head>
<body>
    <div class="register-container">
        <h2>Person 회원정보 수정하기</h2>
        <form action="/mypageUpdate" method="post" onsubmit="validateForm(event)">
        <input type="hidden" id="user_idx" name="user_idx" value="${user.user_idx}">
        <input type="hidden" id="id" name="id" value="${user.id}">
        <input type="hidden" id="id" name="type" value="${user.type}">
        <input type="hidden" id="person_idx" name="person_idx" value="${person.person_idx}">
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
                <label for="first_name">First Name:</label>
                <input type="text" id="first_name" name="first_name" value="${person.first_name}" required>
            </div>
            <div class="form-group">
                <label for="last_name">Last Name:</label>
                <input type="text" id="last_name" name="last_name" value="${person.last_name}" required>
            </div>
            <div class="form-group">
                <label for="social_num">Social Number:</label>
                <input type="text" id="social_num" name="social_num" value="${person.social_num}" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="${person.phone}" required>
            </div>
            
            <div class="form-group">
            	 <div class="form-group-inline">
                 	<label for="주소찾기">주소찾기:</label> 
               	 	<input type="button" value="주소검색" required onclick="daumPost()">
               	 </div>
            </div>
            <div class="form-group">
                <label for="zip_code">우편번호:</label>
                <input type="text" id="zip_code" name="zip_code" value="${person.zip_code}" required>
            </div>
            <div class="form-group">
                <label for="address1">주소:</label>
            	<input type="text" id="address1" name="address1" value="${person.address1}" required>
            </div>
            <div class="form-group">
                <label for="address2">상세주소:</label>
                <input type="text" id="address2" name="address2" value="${person.address2}" required>
            </div>
            <div class="form-group">
                <label for="nickname">Nickname:</label>
                <input type="text" id="nickname" name="nickname" value="${person.nickname}">
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