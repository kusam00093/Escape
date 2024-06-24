<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 유형 선택</title>
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
        .wrap {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 600px;
            max-width: 90%;
            text-align: center;
        }
        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #333;
            font-weight: 600;
        }
        .category_box {
            margin-top: 20px;
        }
        .box {
            display: flex;
            justify-content: center;
        }
        .category {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: space-around;
            width: 100%;
        }
        .category li {
            margin: 0 10px;
        }
        .btm_image {
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            border: none;
            color: #fff;
            padding: 20px 40px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            font-weight: 600;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
        }
        .btm_image:hover {
            background: linear-gradient(135deg, #a777e3, #6e8efb);
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="wrap">
        <h2>회원가입을 환영합니다</h2>
        <section class="category_box">
            <div class="box">
                <ul class="category">
                    <li>
                        <button type="button" class="btm_image" onclick="location.href='/personjoin'">
                            개인 회원가입
                        </button>
                    </li>
                    <li>
                        <button type="button" class="btm_image" onclick="location.href='/sellerClassification'">
                            기업 회원가입
                        </button>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</body>
</html>
