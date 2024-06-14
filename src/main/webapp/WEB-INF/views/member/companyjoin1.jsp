<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행사 회원가입</title>
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
            min-height: 100vh;
            overflow-y: auto;
        }
        .register-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 400px;
            margin: 20px 0;
        }
        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
            font-weight: 600;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        
        .form-group-inline {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
     
        .form-group label {
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
        }
       
/* 다른 입력 필드의 스타일 */
		input[type="text"],
		input[type="password"],
		input[type="email"] {
   		 	padding: 10px 15px;
   		 	margin: 5px 0;
    		border: 1px solid #ccc;
    		border-radius: 10px;
    		box-sizing: border-box;
    		font-size: 14px;
}
        
        input[type="submit"], button[type="submit"], #goList {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            border: none;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
            margin-top: 20px;
        }
        input[type="submit"]:hover, button[type="submit"]:hover, #goList:hover {
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
        <h2>여행사 회원가입</h2>
        <form action="/companyjoin" method="post" enctype="multipart/form-data" onsubmit="validateForm(event)">
        
            <div class="form-group">
                <label for="id">ID:</label>
                    <input type="text" id="id" name="id" required oninput="checkIdExists()">
                    <span id="id_alert" ></span> <!-- ID 중복 확인 알림 -->
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="passwd" name="passwd" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">비밀번호 확인:</label>
                  <input type="password" id="confirm_passwd" name="confirm_passwd" required oninput="checkPasswordMatch()">
                <span id="password_match"></span> <!-- 비밀번호 일치 확인 알림 -->
            </div>
            
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="first_name">회사명:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="social_num">사업자등록번호:</label>
                <input type="text" id="cnum" name="cnum" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
            </div>
           
           <div class="form-group">
    			<label for="logo">로고:</label>
    			<input type="file" id="logo" name="file">
			</div>
            <input type="hidden" id="type" name="type" value="2">
            <button type="submit">회원가입</button>
            <input type="button" value="취소" id="goList">
        </form>
    </div>
    
<script>
        const goListEl = document.getElementById('goList');
        goListEl.addEventListener('click', function(e) {
            location.href = '/';
        });
</script>
    
       
    
    
</body>
</html>