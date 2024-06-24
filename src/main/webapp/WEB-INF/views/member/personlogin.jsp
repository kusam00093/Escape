<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Person Login</title>
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
            height: 100vh;
            overflow: hidden;
        }
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 90%;
            text-align: center;
        }
        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #333;
            font-weight: 600;
        }
        label {
            font-weight: 600;
            color: #555;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="submit"], input[type="button"] {
            width: 48%;
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
        input[type="submit"]:hover, input[type="button"]:hover {
            background: linear-gradient(135deg, #a777e3, #6e8efb);
            transform: scale(1.05);
        }
        p {
            text-align: center;
            margin-top: 20px;
            color: red;
        }
        a {
            font-size: 18px;
            color: #6e8efb;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease-in-out, background-color 0.3s ease-in-out;
            padding: 10px 15px;
            border-radius: 10px;
            display: inline-block;
            margin-top: 20px;
        }
        a:hover {
            color: #fff;
            background-color: #6e8efb;
            text-decoration: none;
        }
    </style>

</head>

<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="/personlogin" method="POST">
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" required>
            
            <label for="passwd">비밀번호</label>
            <input type="password" name="passwd" id="passwd" required>
            
            <div class="form-group">
                <input type="submit" value="로그인">
                <input type="button" value="취소" id="goList">
            </div>
            
            <a href="/join" id="join" style="color: black">회원가입 하러가기</a>
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