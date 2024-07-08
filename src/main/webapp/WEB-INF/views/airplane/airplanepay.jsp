<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />

<style>

.paycontainer {
	max-width: 600px;
	margin: 50px auto;
	background: #fff;
	padding: 20px;
	/* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
	border: 1px solid #ccc;
	border-radius: 10px;
}

h1 {
	text-align: center;
	color: #333;
}

.flight-info {
	margin-bottom: 20px;
}

.flight-info div {
	margin-bottom: 10px;
}

.flight-info span {
	font-weight: bold;
}

.payment-section {
	border: 1px solid #ccc;
    border-radius: 15px;
    padding: 10px;
    margin-left: 400px;
    background-color: blue;
    width: 100px;
    text-align: center;
}
.payBtn {
    color: white;
    border: none; /* 테두리 제거 */
    background: none; /* 배경색 제거 */
    background-color: blue;
}

</style>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

</head>

<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>

<body>
    <div class="paycontainer">
        <h1>결제 정보</h1>
        <div class="flight-info">
            <div>
                <span>항공편 이름:</span> ${itemName1}
            </div>
            <div>
                <span>좌석 등급:</span> ${seatClass}
            </div>
            <div>
                <span>성인 수:</span> ${adultCount}
                <span>
                    <img src="/images/arrow.jpg" class="arrowImg" alt="arrow" style="width: 40px; height: 20px;">
                </span>
                <span>1인당 가격:</span> ${adultPrice}
            </div>
            <div>
                <span>아동 수:</span> ${childCount}
                <span>
                    <img src="/images/arrow.jpg" class="arrowImg" alt="arrow" style="width: 40px; height: 20px;">
                </span>
                <span>1인당 가격:</span> ${childPrice}
            </div>
            <div>
                <span>유아 수:</span> ${infantCount}
                <span>
                    <img src="/images/arrow.jpg" class="arrowImg" alt="arrow" style="width: 40px; height: 20px;">
                </span>
                <span>1인당 가격:</span> ${infantPrice}
            </div>
        </div>

        <div>
            <span>총 가격:</span> ${totalPrice}
        </div>

        <div class="payment-section">
			<button type="button" class="payBtn"
				data-airplane-time-idx="${ orderId1 }" 
				data-user-id="${ sessionScope.login.id }"
				data-user-idx="${ user_idx }"
				data-airplane-name="${ itemName1 }"
				data-seatClass="${ seatClass }"
				data-adultCount="${ adultCount }"
				data-childCount="${ childCount }"
				data-infantCount="${ infantCount }"
				data-adultPrice="${ adultPrice }"
				data-childPrice="${ childPrice }"
				data-infantPrice="${ infantPrice }"
				data-totalPrice="${ totalPrice }"
			>결제</button>
            <script src="/js/main.js"></script>
		</div>
    </div>

    <%@include file="/WEB-INF/include/footer.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</body>

</html>