<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escape</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- CSS Stylesheets -->
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/accommodation/roomOrderCompleted.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css" />
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Swiper CSS -->
<link href="https://unpkg.com/swiper/swiper-bundle.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.js"></script>
</head>
<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>
<body>
	<div id="Mrt3Payment-react-component-c5d425dd-cea4-4303-ac5a-7455c0f62caf">
	  <div class="css-1kqan2o--Success--Container e3xfm041">
	    <div class="css-1klquwu--OrderResultHeader--Wrapper ex6sdei3">
	      <img src="https://dffoxz5he03rp.cloudfront.net/build/production/7aa3118a49d34926113060cdac22aee0c7c06cc5/aa4f41ac520b3929b24c.png" alt="order result" class="css-oaoegn--OrderResultHeader--Icon ex6sdei2">
	      <h1 class="css-1xroqlq--OrderResultHeader--Title ex6sdei1">예약 완료</h1>
	      <p class="css-1g1gpj9--OrderResultHeader--SubTitle ex6sdei0">설레는 여행 같이 준비해봐요!</p>
	    </div>
	    <div class="css-sa796s--Success--Wrapper e3xfm040">
	      <div class="css-55qnui--OrderResultPaymentInfo--Wrapper e1lhh1p70">
	        <div class="css-ncpb5f--SettledInfo--Container e1hjiljs5">
	          <div class="css-1m3cfk7--SettledInfo--Info--SettledInfo--TotalSalePriceInfo e1hjiljs1">
	            <span class="css-ce8b5w--SettledInfo--Text e1hjiljs3">주문 금액</span>
	            <span class="css-bawng7--SettledInfo--Text--SettledInfo--Price e1hjiljs2"><c:out value="${finalPrice}"/>원</span>
	            <input type="hidden" value="${finalPrice}" id="finalPrice">
	          </div>
	        </div>
	        <div class="css-1ar0af1--TotalPriceInfo--Info e14xhkix2">
	          <span class="css-1ru4963--TotalPriceInfo--Text e14xhkix1">총 결제 금액</span>
	          <span class="css-1ru4963--TotalPriceInfo--Text e14xhkix1"><c:out value="${finalPrice}"/>원</span>
	        </div>
	      </div>
	      <div class="css-1es70uc--OrderResultButtonList--Wrapper efx2r4q0">
	        <span role="button" class="css-13zq7d4--OrderResultButton--button">
	          <button type="button" class="mrt-button css-onylof" onclick="window.location.href='/'">
	            <span class="css-1s4v6ia">홈으로 가기</span>
	          </button>
	        </span>
	        <span role="button" class="css-13zq7d4--OrderResultButton--button">
	          <button type="button" class="mrt-button css-17x5dyz">
	            <span class="css-1s4v6ia">예약상세 보기</span>
	          </button>
	        </span>
	      </div>
	    </div>
	  </div>
	  <div class="css-fwbh4u" style="position: fixed; z-index: 99999999; inset: 0px; pointer-events: none;"></div>
	</div>
	
<script>

</script>	
</body>
</html>