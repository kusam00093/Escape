<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
<style>




</style> 
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-97/variables.css">
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/169963/mixins.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />

<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">

</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>



<form action="/Package/Reservation/Insert">

<input type="hidden" value="${ package_idx }" name="package_idx">
<input type="hidden" value="${ user_idx }" name="user_idx">

<input type="hidden"name="reservation_price" value="${ reservation_price }">
<input type="hidden"name="reservation_su"value="${ reservation_su }">
<p>${ reservation_su }</p>
<p>${ reservation_price }</p>

<p>${ packageVo.title }</p>
<p>${ packageVo.start_date }</p>
<p>${ packageVo.zip_code }</p>
<p>${ packageVo.address1 }</p>
<p>${ packageVo.address2 }</p>
<input type="submit" value="결제하기" class="btn btn-primary">
</form>

</body>

</html>
