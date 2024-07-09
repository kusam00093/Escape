<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
/* html과 body 요소가 전체 높이를 차지하도록 설정 */
html, body {
    height: 100%; /* 전체 높이를 100%로 설정 */
    margin: 0; /* 기본 여백 제거 */
    padding: 0; /* 기본 패딩 제거 */
    box-sizing: border-box; /* 패딩과 테두리를 요소의 전체 크기에 포함 */
}

/* 컨테이너 요소를 중앙에 배치 */
.main_container {
    width: 80%; /* 컨테이너 너비를 화면의 80%로 설정 */
    margin: 0 auto; /* 수평 중앙에 배치 */
    display: flex; /* 플렉스박스를 사용하여 자식 요소 정렬 */
    justify-content: space-between; /* 자식 요소 사이에 공간을 추가 */
}

/* section과 aside 요소 스타일 */
section, aside {
    flex: 1; /* 두 요소가 동일한 너비를 차지하도록 설정 */
    padding: 20px; /* 내부 여백 추가 */
    box-sizing: border-box; /* 패딩과 테두리를 요소의 전체 크기에 포함 */
}

/* section 요소의 배경 색상 */
section {
    background-color: #f0f0f0; /* 예시 배경 색상 */
}

/* aside 요소의 배경 색상 */
aside {
    background-color: #e0e0e0; /* 예시 배경 색상 */
}
/* ------------------------------------------------------------------------------ */
.div_search1_trip1 {
    border: 1px solid #ccc; /* 테두리 스타일 및 색상 설정 */
    border-radius: 5px; /* 테두리 모서리를 둥글게 만듭니다. */
    padding: 10px; /* 테두리 내부 여백 설정 */
}

legend {
    display: none; /* legend 요소를 숨깁니다. */
}
/* ------------------------------------------------------------------------------ */
.main_container .section_1 li input.input_radio {
	/* display: none; */
	opacity: 0; /* 버튼을 보이지 않게 만듦 */
    position: absolute; /* 화면에서 완전히 숨김 */
	width: 0;
	height: 0;
	margin-right: 5px;
}

label, input[type="checkbox"], input[type="radio"], button, select {
	cursor: pointer;
}

.main_container .section_1 li input.input_radio:checked + label {
    color: #FFF;
    opacity: 1;
    font-weight: 600;
    font-size: 15px;
    background-color: #141719;
    border-radius: 10px; /* 모서리를 둥글게 만듦 */
}
.main_container .section_1 li label {
    display: inline-block; /* 블록 요소로 변환하여 쉽게 스타일 적용 */
    padding: 10px 20px; /* 내부 여백 추가 */
    margin-right: 10px; /* 항목 간의 간격 추가 */
    border: 1px solid #ddd; /* 외부 테두리 추가 */
    border-radius: 10px; /* 모서리를 둥글게 만듦 */
}
/* ------------------------------------------------------------------------------ */

/* section 부분 flex 나열 */
.section_2_li {
	display: flex;
}

/* section 부분 항목별 테두리 설정 */
.section_2_1,
.section_2_2,
.section_2_3 {
	border: 1px solid #ccc;
    border-radius: 15px;
    padding: 10px;
    margin-right: 5px;
}

/* section 부분 항목 input 테두리 없애기 */
.section_2_1_1,
.section_2_1_2,
.section_2_1_3,
.section_2_2_1,
.section_2_2_2,
.section_2_2_3,
.section_2_2_4,
.section_2_2_5 {
	cursor: pointer;
	border: 0px;
	background-color: #f0f0f0;
}

/* ------------------------------------------------------------------------------ */

/* 승객 수 선택 */
.passenger-selector {
	margin-top: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
.passenger-count {
	display: flex;
    align-items: center;
    margin-bottom: 10px;
}
.passenger-count span {
	margin: 0 10px;
}
.passenger-class {
	margin-top: 10px;
}
.passenger-selector .btn-complete {
	margin-top: 10px;
}

/* ------------------------------------------------------------------------------ */
.section_2_4 {
	border: 1px solid #ccc;
    border-radius: 15px;
    padding: 10px;
    margin-left: 15px;
    background-color: blue;
}
.searchBtn {
    color: white;
    border: none; /* 테두리 제거 */
    background: none; /* 배경색 제거 */
    background-color: blue;
}
/* ------------------------------------------------------------------------------ */

.plusBtn {
	color: white;
    border: none; /* 테두리 제거 */
    background: none; /* 배경색 제거 */
    background-color: blue;
}

</style>
</head>
<body>

<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>


<!-- <form id="myForm" action="/Airplane/Search" method="Post"> -->

<div class="main_container">
	<section>
		<ul class="section_1">
			<li class="interval_select">
				<input type="radio" id="initFormCode1" name="initform" onclick="openscriptCode1()" checked="checked" value="RT" class="input_radio">
				<label for="initFormCode1">왕복</label>
				<input type="radio" id="initFormCode2" name="initform" onclick="openscriptCode2()" value="OW" class="input_radio">
				<label for="initFormCode2">편도</label>
				<!-- <input type="radio" id="initFormCode3" name="initform" onclick="openscriptCode3()" value="MT" class="input_radio">
				<label for="initFormCode3">다구간</label> -->
			</li>
		</ul>
		
		<!-- ================================================================================================================================= -->
		<!-- 왕복 -->
		<div id="tab1" class="section_2 div_search1 tab-content" style="display: block;">
			<fieldset class="div_search1_trip1">
				<legend>출국 귀국 선택</legend>
				<ul class="section_2_ul">
					<li class="section_2_li">
					
						<!-- 출발지/도착지 검색 -->
						<div class="section_2_1">
							<!-- 출발지 검색 -->
							<!-- <input class="depCtyCodeSearch section_2_1_1" onclick="clickDepCity();" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL"> -->
							<input class="depCtyCodeSearch section_2_1_1" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL">
							<div class="modalBackground1" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="depCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
							    <h2>출발지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('서울', 'SEL', 'KR');">서울</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('김포', 'GMP', 'KR');">김포</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('제주', 'CJU', 'KR');">제주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대구', 'TAE', 'KR');">대구</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('세부', 'CEB', 'PH');">세부</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('파리', 'PAR', 'FR');">파리</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('런던', 'LON', 'GB');">런던</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로마', 'ROM', 'IT');">로마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('괌', 'GUM', 'GU');">괌</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도하', 'DOH', 'QA');">도하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('북경', 'BJS', 'CN');">북경</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청도', 'TAO', 'CN');">청도</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							    <!-- 출발지 모달 닫기 버튼 -->
								<button class="closeBtn" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
							
							<!-- 출발/도착지 교체 -->
							<button type="button" class="section_2_1_2" id="btn_arrDepChange" onclick="javascript:airfn_arrDepChange_0100100010();">↔</button>
							
							<!-- 도착지 검색 -->
							<!-- <input class="ariCtyCodeSearch section_2_1_3" onclick="clickAriCity();" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO"> -->
							<input class="ariCtyCodeSearch section_2_1_3" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO">
							<div class="modalBackground2" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="ariCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
								<h2>도착지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('서울', 'SEL', 'KR');">서울</a></td>
											<td><a href="#_modal" onclick="setDepCity2('김포', 'GMP', 'KR');">김포</a></td>
											<td><a href="#_modal" onclick="setDepCity2('제주', 'CJU', 'KR');">제주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대구', 'TAE', 'KR');">대구</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a href="#_modal" onclick="setDepCity2('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a href="#_modal" onclick="setDepCity2('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a href="#_modal" onclick="setDepCity2('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a href="#_modal" onclick="setDepCity2('세부', 'CEB', 'PH');">세부</a></td>
											<td><a href="#_modal" onclick="setDepCity2('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a href="#_modal" onclick="setDepCity2('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a href="#_modal" onclick="setDepCity2('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a href="#_modal" onclick="setDepCity2('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a href="#_modal" onclick="setDepCity2('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a href="#_modal" onclick="setDepCity2('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a href="#_modal" onclick="setDepCity2('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('파리', 'PAR', 'FR');">파리</a></td>
											<td><a href="#_modal" onclick="setDepCity2('런던', 'LON', 'GB');">런던</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로마', 'ROM', 'IT');">로마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a href="#_modal" onclick="setDepCity2('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a href="#_modal" onclick="setDepCity2('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a href="#_modal" onclick="setDepCity2('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a href="#_modal" onclick="setDepCity2('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a href="#_modal" onclick="setDepCity2('괌', 'GUM', 'GU');">괌</a></td>
											<td><a href="#_modal" onclick="setDepCity2('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a href="#_modal" onclick="setDepCity2('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a href="#_modal" onclick="setDepCity2('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a href="#_modal" onclick="setDepCity2('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('도하', 'DOH', 'QA');">도하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a href="#_modal" onclick="setDepCity2('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a href="#_modal" onclick="setDepCity2('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a href="#_modal" onclick="setDepCity2('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a href="#_modal" onclick="setDepCity2('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a href="#_modal" onclick="setDepCity2('북경', 'BJS', 'CN');">북경</a></td>
											<td><a href="#_modal" onclick="setDepCity2('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청도', 'TAO', 'CN');">청도</a></td>
											<td><a href="#_modal" onclick="setDepCity2('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							<!-- 도착지 모달 닫기 버튼 -->
							<button class="closeBtn2" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
						</div>
						
						<!-- 출국일자 / 입국일자 -->
						<div class="section_2_2" id="div_day_selector1" role="calendarPopTxt" style="cursor: pointer;">
							<input id="txt_depDt" class="section_2_2_1 depDatePicker" type="hidden" title="가는날 선택" placeholder="가는날 선택" readonly="readonly">
							<input id="txt_depDt_view" class="section_2_2_1 depDatePickerView" type="text" title="가는날 선택" placeholder="가는날 선택" readonly="readonly" role="calendarPopInput" style="cursor: pointer;" value="">
							<span class="hyphen" id="hyphen">-</span> <!-- 편도검색할 경우 hide 추가 -->
							<input id="txt_arrDt" class="section_2_2_2 arrDatePicker" type="hidden" title="오는날 선택" placeholder="오는날 선택" readonly="readonly">
							<input id="txt_arrDt_view" class="section_2_2_2 arrDatePickerView" type="text" title="오는날 선택" placeholder="오는날 선택" readonly="readonly" role="calendarPopInput" style="cursor: pointer;" value="">
						</div>
						
						<!-- 승객수, 좌석등급 -->
						<div id="section_2_3_RT" class="section_2_3">
					        <a href="javascript:void(0);" onclick="showPassengerOptions('RT')" class="">
					            <span class="txt bin_people">승객 1명, 일반석</span>
					        </a>
					    </div>
						
						<div id="passengerOptionsRT" class="passenger-selector" style="display:none;">
					        <!-- 성인 명수 선택 -->
					        <div class="passenger-count">
					            <label for="adultCount">성인:</label>
					            <button onclick="adjustCount('adultCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="adultCount">1</span>
					            <button onclick="adjustCount('adultCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <!-- 소아 명수 선택 -->
					        <div class="passenger-count">
					            <label for="childCount">소아:</label>
					            <button onclick="adjustCount('childCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="childCount">0</span>
					            <button onclick="adjustCount('childCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <!-- 유아 명수 선택 -->
					        <div class="passenger-count">
					            <label for="infantCount">유아:</label>
					            <button onclick="adjustCount('infantCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="infantCount">0</span>
					            <button onclick="adjustCount('infantCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <hr>
					
					        <!-- 좌석 클래스 선택 -->
					        <div class="passenger-class">
					            <label><input type="radio" name="seatClass" value="economy" checked> 일반석</label>
					            <label><input type="radio" name="seatClass" value="premium-economy"> 프리미엄 일반석</label>
					            <label><input type="radio" name="seatClass" value="business"> 비즈니스석</label>
					            <label><input type="radio" name="seatClass" value="first-class"> 일등석</label>
					        </div>
					
					        <!-- 선택 완료 버튼 -->
					        <button type="button" onclick="completeSelection(event, 'RT')" class="btn btn-primary btn-complete">선택 완료</button>
					    </div>
					    
					    <!-- 항공권 검색 -->
					    <div class="section_2_4">
							<button type="submit" onclick="sendSelectionToController()" class="searchBtn" title="검색">항공권 검색</button>
						</div>
							
					</li>
				</ul>
			</fieldset>
		</div>
		<!-- 왕복 End -->
		<!-- ================================================================================================================================= -->
		
		<!-- 편도 -->
		<div id="tab2" class="section_2 div_search2 tab-content" style="display: none;">
			<fieldset class="div_search1_trip1">
				<legend>출국 귀국 선택</legend>
				<ul class="section_2_ul">
					<li class="section_2_li">
					
						<!-- 출발지/도착지 검색 -->
						<div class="section_2_1">
							<!-- 출발지 검색 -->
							<!-- <input class="depCtyCodeSearch section_2_1_1" onclick="clickDepCity();" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL"> -->
							<input class="depCtyCodeSearch section_2_1_1" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL">
							<div class="modalBackground1" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="depCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
							    <h2>출발지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('서울', 'SEL', 'KR');">서울</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('김포', 'GMP', 'KR');">김포</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('제주', 'CJU', 'KR');">제주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대구', 'TAE', 'KR');">대구</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('세부', 'CEB', 'PH');">세부</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('파리', 'PAR', 'FR');">파리</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('런던', 'LON', 'GB');">런던</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로마', 'ROM', 'IT');">로마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('괌', 'GUM', 'GU');">괌</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도하', 'DOH', 'QA');">도하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('북경', 'BJS', 'CN');">북경</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청도', 'TAO', 'CN');">청도</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							    <!-- 출발지 모달 닫기 버튼 -->
								<button class="closeBtn" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
							
							<!-- 출발/도착지 교체 -->
							<button type="button" class="section_2_1_2" id="btn_arrDepChange" onclick="javascript:airfn_arrDepChange_0100100010();">↔</button>
							
							<!-- 도착지 검색 -->
							<!-- <input class="ariCtyCodeSearch section_2_1_3" onclick="clickAriCity();" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO"> -->
							<input class="ariCtyCodeSearch section_2_1_3" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO">
							<div class="modalBackground2" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="ariCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
								<h2>도착지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('서울', 'SEL', 'KR');">서울</a></td>
											<td><a href="#_modal" onclick="setDepCity2('김포', 'GMP', 'KR');">김포</a></td>
											<td><a href="#_modal" onclick="setDepCity2('제주', 'CJU', 'KR');">제주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대구', 'TAE', 'KR');">대구</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a href="#_modal" onclick="setDepCity2('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a href="#_modal" onclick="setDepCity2('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a href="#_modal" onclick="setDepCity2('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a href="#_modal" onclick="setDepCity2('세부', 'CEB', 'PH');">세부</a></td>
											<td><a href="#_modal" onclick="setDepCity2('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a href="#_modal" onclick="setDepCity2('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a href="#_modal" onclick="setDepCity2('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a href="#_modal" onclick="setDepCity2('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a href="#_modal" onclick="setDepCity2('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a href="#_modal" onclick="setDepCity2('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a href="#_modal" onclick="setDepCity2('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('파리', 'PAR', 'FR');">파리</a></td>
											<td><a href="#_modal" onclick="setDepCity2('런던', 'LON', 'GB');">런던</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로마', 'ROM', 'IT');">로마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a href="#_modal" onclick="setDepCity2('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a href="#_modal" onclick="setDepCity2('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a href="#_modal" onclick="setDepCity2('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a href="#_modal" onclick="setDepCity2('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a href="#_modal" onclick="setDepCity2('괌', 'GUM', 'GU');">괌</a></td>
											<td><a href="#_modal" onclick="setDepCity2('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a href="#_modal" onclick="setDepCity2('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a href="#_modal" onclick="setDepCity2('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a href="#_modal" onclick="setDepCity2('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('도하', 'DOH', 'QA');">도하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a href="#_modal" onclick="setDepCity2('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a href="#_modal" onclick="setDepCity2('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a href="#_modal" onclick="setDepCity2('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a href="#_modal" onclick="setDepCity2('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a href="#_modal" onclick="setDepCity2('북경', 'BJS', 'CN');">북경</a></td>
											<td><a href="#_modal" onclick="setDepCity2('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청도', 'TAO', 'CN');">청도</a></td>
											<td><a href="#_modal" onclick="setDepCity2('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							<!-- 도착지 모달 닫기 버튼 -->
							<button class="closeBtn2" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
						</div>
						
						<!-- 출국일자 -->
						<div class="section_2_2" id="div_day_selector2" role="calendarPopTxt" style="cursor: pointer;">
							<input id="txt_depDt" class="section_2_2_1 depDatePicker" type="hidden" title="가는날 선택" placeholder="가는날 선택" readonly="readonly">
							<input id="txt_depDt_view" class="section_2_2_1 depDatePickerView" type="text" title="가는날 선택" placeholder="가는날 선택" readonly="readonly" role="calendarPopInput" style="cursor: pointer;" value="">
						</div>
						
						<!-- 승객수, 좌석등급 -->
						<div id="section_2_3_OW" class="section_2_3">
					        <a href="javascript:void(0);" onclick="showPassengerOptions('OW')" class="">
					            <span class="txt bin_people">승객 1명, 일반석</span>
					        </a>
					    </div>
						
						<div id="passengerOptionsOW" class="passenger-selector" style="display:none;">
					        <!-- 성인 명수 선택 -->
					        <div class="passenger-count">
					            <label for="adultCount">성인:</label>
					            <button onclick="adjustCount('adultCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="adultCount">1</span>
					            <button onclick="adjustCount('adultCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <!-- 소아 명수 선택 -->
					        <div class="passenger-count">
					            <label for="childCount">소아:</label>
					            <button onclick="adjustCount('childCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="childCount">0</span>
					            <button onclick="adjustCount('childCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <!-- 유아 명수 선택 -->
					        <div class="passenger-count">
					            <label for="infantCount">유아:</label>
					            <button onclick="adjustCount('infantCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="infantCount">0</span>
					            <button onclick="adjustCount('infantCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <hr>
					
					        <!-- 좌석 클래스 선택 -->
					        <div class="passenger-class">
					            <label><input type="radio" name="seatClass" value="economy" checked> 일반석</label>
					            <label><input type="radio" name="seatClass" value="premium-economy"> 프리미엄 일반석</label>
					            <label><input type="radio" name="seatClass" value="business"> 비즈니스석</label>
					            <label><input type="radio" name="seatClass" value="first-class"> 일등석</label>
					        </div>
					
					        <!-- 선택 완료 버튼 -->
					        <button type="button" onclick="completeSelection(event, 'OW')" class="btn btn-primary btn-complete">선택 완료</button>
					    </div>
					    
					    <!-- 항공권 검색 -->
					    <div class="section_2_4">
							<button type="submit" onclick="sendSelectionToController()" class="searchBtn" title="검색">항공권 검색</button>
						</div>
							
					</li>
				</ul>
			</fieldset>
		</div>
		<!-- 편도 End -->
		<!-- ================================================================================================================================= -->
		
		<!-- 다구간 -->
		<div id="tab3" class="section_2 div_search3 tab-content" style="display: none;">
			<fieldset class="div_search1_trip1">
				<legend>출국 귀국 선택</legend>
				<ul class="dakukan1 section_2_ul">
					<li class="section_2_li">
					
						<!-- 출발지/도착지 검색 -->
						<div class="section_2_1">
							<!-- 출발지 검색 -->
							<!-- <input class="depCtyCodeSearch section_2_1_1" onclick="clickDepCity();" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL"> -->
							<input class="depCtyCodeSearch section_2_1_1" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL">
							<div class="modalBackground1" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="depCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
							    <h2>출발지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('서울', 'SEL', 'KR');">서울</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('김포', 'GMP', 'KR');">김포</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('제주', 'CJU', 'KR');">제주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대구', 'TAE', 'KR');">대구</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('세부', 'CEB', 'PH');">세부</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('파리', 'PAR', 'FR');">파리</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('런던', 'LON', 'GB');">런던</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로마', 'ROM', 'IT');">로마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('괌', 'GUM', 'GU');">괌</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도하', 'DOH', 'QA');">도하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('북경', 'BJS', 'CN');">북경</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청도', 'TAO', 'CN');">청도</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							    <!-- 출발지 모달 닫기 버튼 -->
								<button class="closeBtn" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
							
							<!-- 출발/도착지 교체 -->
							<button type="button" class="section_2_1_2" id="btn_arrDepChange" onclick="javascript:airfn_arrDepChange_0100100010();">↔</button>
							
							<!-- 도착지 검색 -->
							<!-- <input class="ariCtyCodeSearch section_2_1_3" onclick="clickAriCity();" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO"> -->
							<input class="ariCtyCodeSearch section_2_1_3" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO">
							<div class="modalBackground2" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="ariCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
								<h2>도착지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('서울', 'SEL', 'KR');">서울</a></td>
											<td><a href="#_modal" onclick="setDepCity2('김포', 'GMP', 'KR');">김포</a></td>
											<td><a href="#_modal" onclick="setDepCity2('제주', 'CJU', 'KR');">제주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대구', 'TAE', 'KR');">대구</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a href="#_modal" onclick="setDepCity2('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a href="#_modal" onclick="setDepCity2('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a href="#_modal" onclick="setDepCity2('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a href="#_modal" onclick="setDepCity2('세부', 'CEB', 'PH');">세부</a></td>
											<td><a href="#_modal" onclick="setDepCity2('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a href="#_modal" onclick="setDepCity2('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a href="#_modal" onclick="setDepCity2('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a href="#_modal" onclick="setDepCity2('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a href="#_modal" onclick="setDepCity2('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a href="#_modal" onclick="setDepCity2('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a href="#_modal" onclick="setDepCity2('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('파리', 'PAR', 'FR');">파리</a></td>
											<td><a href="#_modal" onclick="setDepCity2('런던', 'LON', 'GB');">런던</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로마', 'ROM', 'IT');">로마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a href="#_modal" onclick="setDepCity2('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a href="#_modal" onclick="setDepCity2('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a href="#_modal" onclick="setDepCity2('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a href="#_modal" onclick="setDepCity2('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a href="#_modal" onclick="setDepCity2('괌', 'GUM', 'GU');">괌</a></td>
											<td><a href="#_modal" onclick="setDepCity2('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a href="#_modal" onclick="setDepCity2('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a href="#_modal" onclick="setDepCity2('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a href="#_modal" onclick="setDepCity2('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('도하', 'DOH', 'QA');">도하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a href="#_modal" onclick="setDepCity2('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a href="#_modal" onclick="setDepCity2('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a href="#_modal" onclick="setDepCity2('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a href="#_modal" onclick="setDepCity2('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a href="#_modal" onclick="setDepCity2('북경', 'BJS', 'CN');">북경</a></td>
											<td><a href="#_modal" onclick="setDepCity2('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청도', 'TAO', 'CN');">청도</a></td>
											<td><a href="#_modal" onclick="setDepCity2('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							<!-- 도착지 모달 닫기 버튼 -->
							<button class="closeBtn2" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
						</div>
						
						<!-- 다구간 탑승일 -->
						<div class="section_2_2" id="div_day_selector3" role="calendarPopTxt" style="cursor: pointer;">
							<input id="txt_BoardingDt1" class="section_2_2_3 boardingDatePicker" type="hidden" title="탑승일 선택" placeholder="탑승일 선택" readonly="readonly">
							<input id="txt_BoardingDt_view1" class="section_2_2_3 boardingDatePickerView" role="calendarPopInput" type="text" title="탑승일 선택" placeholder="탑승일 선택" readonly="readonly" role="calendarPopInput" style="cursor: pointer;" value="">
						</div>
						
						<!-- 승객수, 좌석등급 -->
						<div id="section_2_3_MT" class="section_2_3">
					        <a href="javascript:void(0);" onclick="showPassengerOptions('MT')" class="">
					            <span class="txt bin_people">승객 1명, 일반석</span>
					        </a>
					    </div>
						
						<div id="passengerOptionsMT" class="passenger-selector" style="display:none;">
					        <!-- 성인 명수 선택 -->
					        <div class="passenger-count">
					            <label for="adultCount">성인:</label>
					            <button onclick="adjustCount('adultCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="adultCount">1</span>
					            <button onclick="adjustCount('adultCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <!-- 소아 명수 선택 -->
					        <div class="passenger-count">
					            <label for="childCount">소아:</label>
					            <button onclick="adjustCount('childCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="childCount">0</span>
					            <button onclick="adjustCount('childCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <!-- 유아 명수 선택 -->
					        <div class="passenger-count">
					            <label for="infantCount">유아:</label>
					            <button onclick="adjustCount('infantCount', -1, this)" class="btn btn-outline-secondary btn-sm">-</button>
					            <span class="infantCount">0</span>
					            <button onclick="adjustCount('infantCount', 1, this)" class="btn btn-outline-secondary btn-sm">+</button>
					        </div>
					
					        <hr>
					
					        <!-- 좌석 클래스 선택 -->
					        <div class="passenger-class">
					            <label><input type="radio" name="seatClass" value="economy" checked> 일반석</label>
					            <label><input type="radio" name="seatClass" value="premium-economy"> 프리미엄 일반석</label>
					            <label><input type="radio" name="seatClass" value="business"> 비즈니스석</label>
					            <label><input type="radio" name="seatClass" value="first-class"> 일등석</label>
					        </div>
					
					        <!-- 선택 완료 버튼 -->
					        <button type="button" onclick="completeSelection(event, 'MT')" class="btn btn-primary btn-complete">선택 완료</button>
					    </div>
					    
					    <!-- 항공권 검색 -->
					    <div class="section_2_5">
							<span>
								<button type="button" onclick="sendSelectionToController()" class="section_2_4 searchBtn" title="검색">항공권 검색</button><br/>
							</span>
						</div>
					</li>
				</ul>
				<ul class="dakukan2 section_2_ul">
					<li class="section_2_li">
					
						<!-- 출발지/도착지 검색 -->
						<div class="section_2_1">
							<!-- 출발지 검색 -->
							<!-- <input class="depCtyCodeSearch section_2_1_1" onclick="clickDepCity();" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL"> -->
							<input class="depCtyCodeSearch section_2_1_1" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL">
							<div class="modalBackground1" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="depCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
							    <h2>출발지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('서울', 'SEL', 'KR');">서울</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('김포', 'GMP', 'KR');">김포</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('제주', 'CJU', 'KR');">제주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대구', 'TAE', 'KR');">대구</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('세부', 'CEB', 'PH');">세부</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('파리', 'PAR', 'FR');">파리</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('런던', 'LON', 'GB');">런던</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로마', 'ROM', 'IT');">로마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('괌', 'GUM', 'GU');">괌</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도하', 'DOH', 'QA');">도하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('북경', 'BJS', 'CN');">북경</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청도', 'TAO', 'CN');">청도</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							    <!-- 출발지 모달 닫기 버튼 -->
								<button class="closeBtn" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
							
							<!-- 출발/도착지 교체 -->
							<button type="button" class="section_2_1_2" id="btn_arrDepChange" onclick="javascript:airfn_arrDepChange_0100100010();">↔</button>
							
							<!-- 도착지 검색 -->
							<!-- <input class="ariCtyCodeSearch section_2_1_3" onclick="clickAriCity();" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO"> -->
							<input class="ariCtyCodeSearch section_2_1_3" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO">
							<div class="modalBackground2" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="ariCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
								<h2>도착지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('서울', 'SEL', 'KR');">서울</a></td>
											<td><a href="#_modal" onclick="setDepCity2('김포', 'GMP', 'KR');">김포</a></td>
											<td><a href="#_modal" onclick="setDepCity2('제주', 'CJU', 'KR');">제주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대구', 'TAE', 'KR');">대구</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a href="#_modal" onclick="setDepCity2('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a href="#_modal" onclick="setDepCity2('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a href="#_modal" onclick="setDepCity2('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a href="#_modal" onclick="setDepCity2('세부', 'CEB', 'PH');">세부</a></td>
											<td><a href="#_modal" onclick="setDepCity2('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a href="#_modal" onclick="setDepCity2('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a href="#_modal" onclick="setDepCity2('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a href="#_modal" onclick="setDepCity2('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a href="#_modal" onclick="setDepCity2('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a href="#_modal" onclick="setDepCity2('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a href="#_modal" onclick="setDepCity2('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('파리', 'PAR', 'FR');">파리</a></td>
											<td><a href="#_modal" onclick="setDepCity2('런던', 'LON', 'GB');">런던</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로마', 'ROM', 'IT');">로마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a href="#_modal" onclick="setDepCity2('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a href="#_modal" onclick="setDepCity2('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a href="#_modal" onclick="setDepCity2('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a href="#_modal" onclick="setDepCity2('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a href="#_modal" onclick="setDepCity2('괌', 'GUM', 'GU');">괌</a></td>
											<td><a href="#_modal" onclick="setDepCity2('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a href="#_modal" onclick="setDepCity2('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a href="#_modal" onclick="setDepCity2('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a href="#_modal" onclick="setDepCity2('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('도하', 'DOH', 'QA');">도하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a href="#_modal" onclick="setDepCity2('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a href="#_modal" onclick="setDepCity2('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a href="#_modal" onclick="setDepCity2('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a href="#_modal" onclick="setDepCity2('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a href="#_modal" onclick="setDepCity2('북경', 'BJS', 'CN');">북경</a></td>
											<td><a href="#_modal" onclick="setDepCity2('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청도', 'TAO', 'CN');">청도</a></td>
											<td><a href="#_modal" onclick="setDepCity2('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							<!-- 도착지 모달 닫기 버튼 -->
							<button class="closeBtn2" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
						</div>
						
						<!-- 다구간 탑승일 -->
						<div class="section_2_2" id="div_day_selector4" role="calendarPopTxt" style="cursor: pointer;">
							<input id="txt_BoardingDt2" class="section_2_2_4 boardingDatePicker" type="hidden" title="탑승일 선택" placeholder="탑승일 선택" readonly="readonly">
							<input id="txt_BoardingDt_view2" class="section_2_2_4 boardingDatePickerView" role="calendarPopInput" type="text" title="탑승일 선택" placeholder="탑승일 선택" readonly="readonly" role="calendarPopInput" style="cursor: pointer;" value="">
						</div>
					    <div class="section_2_5">
							<span>
								<button type="button" onclick="plusTrip()" class="section_2_4 plusBtn" title="추가">여정 추가</button>
							</span>
						</div>
					</li>
				</ul>
				<ul class="dakukan3 section_2_ul" style="display: none;">
					<li class="section_2_li">
					
						<!-- 출발지/도착지 검색 -->
						<div class="section_2_1">
							<!-- 출발지 검색 -->
							<!-- <input class="depCtyCodeSearch section_2_1_1" onclick="clickDepCity();" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL"> -->
							<input class="depCtyCodeSearch section_2_1_1" placeholder="출발지가 어디인가요?" type="text" readonly="readonly" value="서울 SEL">
							<div class="modalBackground1" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="depCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
							    <h2>출발지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('서울', 'SEL', 'KR');">서울</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('김포', 'GMP', 'KR');">김포</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('제주', 'CJU', 'KR');">제주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대구', 'TAE', 'KR');">대구</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('세부', 'CEB', 'PH');">세부</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('파리', 'PAR', 'FR');">파리</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('런던', 'LON', 'GB');">런던</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('로마', 'ROM', 'IT');">로마</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('괌', 'GUM', 'GU');">괌</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('도하', 'DOH', 'QA');">도하</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('북경', 'BJS', 'CN');">북경</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('청도', 'TAO', 'CN');">청도</a></td>
											<td><a class="deploc" href="#_modal" onclick="setDepCity('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							    <!-- 출발지 모달 닫기 버튼 -->
								<button class="closeBtn" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
							
							<!-- 출발/도착지 교체 -->
							<button type="button" class="section_2_1_2" id="btn_arrDepChange" onclick="javascript:airfn_arrDepChange_0100100010();">↔</button>
							
							<!-- 도착지 검색 -->
							<!-- <input class="ariCtyCodeSearch section_2_1_3" onclick="clickAriCity();" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO"> -->
							<input class="ariCtyCodeSearch section_2_1_3" placeholder="도착지가 어디인가요?" type="text" readonly="readonly" value="도쿄 TYO">
							<div class="modalBackground2" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
							<div class="ariCityModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; z-index: 1000;">
								<h2>도착지 선택</h2>
								<p class="">
									<input type="text" id="" class="" onkeydown="javascript:if (event.keyCode == 13){ airfn_citySearch_0100010070(event); } " onkeyup="gfn_onlyformat(this, 'notspec'); airfn_citySearch_0100010070(event);" placeholder="도시명을 입력하세요">
									<button class="btn btn-info" type="button" id="btn_search">검색</button>
								</p>							    
							    <p class="">주요도시 바로 선택</p>
							    <table class="" id="maincitylist">
									<caption style="display: none;">주요도시 바로 선택</caption>
							    	<tbody>
							    		<tr>
							    			<th scope="row" rowspan="3">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('서울', 'SEL', 'KR');">서울</a></td>
											<td><a href="#_modal" onclick="setDepCity2('김포', 'GMP', 'KR');">김포</a></td>
											<td><a href="#_modal" onclick="setDepCity2('제주', 'CJU', 'KR');">제주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('부산', 'PUS', 'KR');">부산</a></td>
							    		</tr>
							    		<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('광주', 'KWJ', 'KR');">광주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대구', 'TAE', 'KR');">대구</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청주', 'CJJ', 'KR');">청주</a></td>
											<td><a href="#_modal" onclick="setDepCity2('여수', 'RSU', 'KR');">여수</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">국내</th>
											<td><a href="#_modal" onclick="setDepCity2('무안', 'MWX', 'KR');">무안</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('도쿄', 'TYO', 'JP');">도쿄</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오사카', 'OSA', 'JP');">오사카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('후쿠오카', 'FUK', 'JP');">후쿠오카</a></td>
											<td><a href="#_modal" onclick="setDepCity2('삿포로', 'SPK', 'JP');">삿포로</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('오키나와', 'OKA', 'JP');">오키나와</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나고야', 'NGO', 'JP');">나고야</a></td>
											<td><a href="#_modal" onclick="setDepCity2('구마모토', 'KMJ', 'JP');">구마모토</a></td>
											<td><a href="#_modal" onclick="setDepCity2('키타큐슈', 'KKJ', 'JP');">키타큐슈</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">일본</th>
											<td><a href="#_modal" onclick="setDepCity2('마쓰야마', 'MYJ', 'JP');">마쓰야마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('요나고', 'YGJ', 'JP');">요나고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('히로시마', 'HIJ', 'JP');">히로시마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('오이타', 'OIT', 'JP');">오이타</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('다낭', 'DAD', 'VN');">다낭</a></td>
											<td><a href="#_modal" onclick="setDepCity2('방콕/수완나품', 'BKK', 'TH');">방콕/수완나품</a></td>
											<td><a href="#_modal" onclick="setDepCity2('세부', 'CEB', 'PH');">세부</a></td>
											<td><a href="#_modal" onclick="setDepCity2('싱가포르', 'SIN', 'SG');">싱가포르</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('코타키나발루', 'BKI', 'MY');">코타키나발루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('나트랑/캄란', 'CXR', 'VN');">나트랑/캄란</a></td>
											<td><a href="#_modal" onclick="setDepCity2('호치민', 'SGN', 'VN');">호치민</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/타오위안', 'TPE', 'TW');">대만/타오위안</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('치앙마이', 'CNX', 'TH');">치앙마이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('울란바토르', 'UBN', 'MN');">울란바토르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하노이', 'HAN', 'VN');">하노이</a></td>
											<td><a href="#_modal" onclick="setDepCity2('푸켓', 'HKT', 'TH');">푸켓</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('마닐라', 'MNL', 'PH');">마닐라</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프놈펜', 'PNH', 'KH');">프놈펜</a></td>
											<td><a href="#_modal" onclick="setDepCity2('알마티', 'ALA', 'KZ');">알마티</a></td>
											<td><a href="#_modal" onclick="setDepCity2('대만/송산', 'TSA', 'TW');">대만/송산</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">아시아</th>
											<td><a href="#_modal" onclick="setDepCity2('자카르타/수카르노하타', 'CGK', 'ID');">자카르타/수카르노하타</a></td>
											<td><a href="#_modal" onclick="setDepCity2('마카오', 'MFM', 'MO');">마카오</a></td>
											<td><a href="#_modal" onclick="setDepCity2('쿠알라룸푸르', 'KUL', 'MY');">쿠알라룸푸르</a></td>
											<td><a href="#_modal" onclick="setDepCity2('몰디브/말레', 'MLE', 'MV');">몰디브/말레</a></td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('하와이/호놀룰루', 'HNL', 'US');">하와이/호놀룰루</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로스앤젤레스', 'LAX', 'US');">로스앤젤레스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('뉴욕', 'NYC', 'US');">뉴욕</a></td>
											<td><a href="#_modal" onclick="setDepCity2('샌프란시스코', 'SFO', 'US');">샌프란시스코</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('라스베이거스', 'LAS', 'US');">라스베이거스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('댈러스', 'DFW', 'US');">댈러스</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밴쿠버', 'YVR', 'CA');">밴쿠버</a></td>
											<td><a href="#_modal" onclick="setDepCity2('토론토', 'YTO', 'CA');">토론토</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">미주</th>
											<td><a href="#_modal" onclick="setDepCity2('워싱턴/덜레스', 'IAD', 'US');">워싱턴/덜레스</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" rowspan="5">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('파리', 'PAR', 'FR');">파리</a></td>
											<td><a href="#_modal" onclick="setDepCity2('런던', 'LON', 'GB');">런던</a></td>
											<td><a href="#_modal" onclick="setDepCity2('로마', 'ROM', 'IT');">로마</a></td>
											<td><a href="#_modal" onclick="setDepCity2('바르셀로나', 'BCN', 'ES');">바르셀로나</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('프랑크푸르트', 'FRA', 'DE');">프랑크푸르트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('프라하', 'PRG', 'CZ');">프라하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('암스테르담', 'AMS', 'NL');">암스테르담</a></td>
											<td><a href="#_modal" onclick="setDepCity2('이스탄불', 'IST', 'TR');">이스탄불</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('헬싱키', 'HEL', 'FI');">헬싱키</a></td>
											<td><a href="#_modal" onclick="setDepCity2('취리히', 'ZRH', 'CH');">취리히</a></td>
											<td><a href="#_modal" onclick="setDepCity2('리스본', 'LIS', 'PT');">리스본</a></td>
											<td><a href="#_modal" onclick="setDepCity2('밀라노/말펜사', 'MXP', 'IT');">밀라노/말펜사</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('부다페스트', 'BUD', 'HU');">부다페스트</a></td>
											<td><a href="#_modal" onclick="setDepCity2('자그레브', 'ZAG', 'HR');">자그레브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두브로브니크', 'DBV', 'HR');">두브로브니크</a></td>
											<td><a href="#_modal" onclick="setDepCity2('베니스', 'VCE', 'IT');">베니스</a></td>
										</tr>
										<tr>
											<th scope="row" style="display: none;">유럽</th>
											<td><a href="#_modal" onclick="setDepCity2('비엔나', 'VIE', 'AT');">비엔나</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th scope="row">대양주</th>
											<td><a href="#_modal" onclick="setDepCity2('괌', 'GUM', 'GU');">괌</a></td>
											<td><a href="#_modal" onclick="setDepCity2('사이판', 'SPN', 'MP');">사이판</a></td>
											<td><a href="#_modal" onclick="setDepCity2('시드니', 'SYD', 'AU');">시드니</a></td>
											<td><a href="#_modal" onclick="setDepCity2('멜버른', 'MEL', 'AU');">멜버른</a></td>
										</tr>
										<tr>
											<th scope="row">중동</th>
											<td><a href="#_modal" onclick="setDepCity2('아부다비', 'AUH', 'AE');">아부다비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('텔아비브', 'TLV', 'IL');">텔아비브</a></td>
											<td><a href="#_modal" onclick="setDepCity2('도하', 'DOH', 'QA');">도하</a></td>
											<td><a href="#_modal" onclick="setDepCity2('두바이', 'DXB', 'AE');">두바이</a></td>
										</tr>
										<tr>
											<th scope="row">중남미</th>
											<td><a href="#_modal" onclick="setDepCity2('상파울로', 'SAO', 'BR');">상파울로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('칸쿤', 'CUN', 'MX');">칸쿤</a></td>
											<td><a href="#_modal" onclick="setDepCity2('산티아고', 'SCL', 'CL');">산티아고</a></td>
											<td><a href="#_modal" onclick="setDepCity2('하바나', 'HAV', 'CU');">하바나</a></td>
										</tr>
										<tr>
											<th scope="row">아프리카</th>
											<td><a href="#_modal" onclick="setDepCity2('나이로비', 'NBO', 'KE');">나이로비</a></td>
											<td><a href="#_modal" onclick="setDepCity2('케이프타운', 'CPT', 'ZA');">케이프타운</a></td>
											<td><a href="#_modal" onclick="setDepCity2('카이로', 'CAI', 'EG');">카이로</a></td>
											<td><a href="#_modal" onclick="setDepCity2('모리셔스', 'MRU', 'MU');">모리셔스</a></td>
										</tr>
										<tr>
											<th scope="row">중국</th>
											<td><a href="#_modal" onclick="setDepCity2('북경', 'BJS', 'CN');">북경</a></td>
											<td><a href="#_modal" onclick="setDepCity2('상해/푸동', 'PVG', 'CN');">상해/푸동</a></td>
											<td><a href="#_modal" onclick="setDepCity2('청도', 'TAO', 'CN');">청도</a></td>
											<td><a href="#_modal" onclick="setDepCity2('성도(솽류)', 'CTU', 'CN');">성도(솽류)</a></td>
										</tr>
							    	</tbody>
								</table>
							<!-- 도착지 모달 닫기 버튼 -->
							<button class="closeBtn2" style="position: absolute; top: 10px; right: 10px; cursor: pointer; background: none; border: none; font-size: 40px;">&times;</button>
							</div>
						</div>
						
						<!-- 다구간 탑승일 -->
						<div class="section_2_2" id="div_day_selector5" role="calendarPopTxt" style="cursor: pointer;">
							<input id="txt_BoardingDt3" class="section_2_2_5 boardingDatePicker" type="hidden" title="탑승일 선택" placeholder="탑승일 선택" readonly="readonly">
							<input id="txt_BoardingDt_view3" class="section_2_2_5 boardingDatePickerView" role="calendarPopInput" type="text" title="탑승일 선택" placeholder="탑승일 선택" readonly="readonly" role="calendarPopInput" style="cursor: pointer;" value="">
						</div>
					</li>
				</ul>
			</fieldset>
		</div>
		<!-- 다구간 End -->
		
	</section>
</div>
<!-- </form> -->

<!-- 달력 jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 달력 jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script>

$(document).ready(() => {
    const sectionEl = document.querySelector('.section_1');
    console.dir(sectionEl);
    const initformEl = document.querySelector('.interval_select');
    console.dir(initformEl);
    
    let radioGroup = document.getElementsByName('initform');
    let selectedValue;
    for (let i = 0; i < radioGroup.length; i++) {
        if (radioGroup[i].checked) {
            selectedValue = radioGroup[i].value;
            break;
        }
    }
    console.dir(selectedValue);
    
    document.querySelector('.div_search1').style.display = 'block';
    document.querySelector('.div_search2').style.display = 'none';
    document.querySelector('.div_search3').style.display = 'none';
    
    const activeTab = document.querySelector('.tab-content[style*="display: block"]');
    console.dir(activeTab);
        
});

//--------------------------------------------------------------------------------

	// 탭 이동 시 값 초기화
	function resetPassengerOptions(tabType) {
	    var parent = document.getElementById('passengerOptions' + tabType);
	    parent.querySelector('.adultCount').innerText = '1';
	    parent.querySelector('.childCount').innerText = '0';
	    parent.querySelector('.infantCount').innerText = '0';

	    var seatClassOptions = parent.querySelectorAll('input[name="seatClass"]');
	    seatClassOptions.forEach(option => {
	        option.checked = (option.value === 'economy');
	    });

	    var datePickers = document.querySelectorAll('.depDatePicker, .depDatePickerView, .arrDatePicker, .arrDatePickerView, .boardingDatePicker, .boardingDatePickerView');
	    datePickers.forEach(picker => {
	        picker.value = '';
	    });

	    updatePassengerSummary(tabType);
	}

	function openscriptCode1() {
        // 왕복 선택 시 실행할 내용
        resetPassengerOptions('RT');
        document.querySelector('.div_search1').style.display = 'block';
        document.querySelector('.div_search2').style.display = 'none';
        document.querySelector('.div_search3').style.display = 'none';
    }

	function openscriptCode2() {
        // 편도 선택 시 실행할 내용
        resetPassengerOptions('OW');
        document.querySelector('.div_search1').style.display = 'none';
        document.querySelector('.div_search2').style.display = 'block';
        document.querySelector('.div_search3').style.display = 'none';
    }

    function openscriptCode3() {
        // 다구간 선택 시 실행할 내용
        resetPassengerOptions('MT');
        document.querySelector('.div_search1').style.display = 'none';
        document.querySelector('.div_search2').style.display = 'none';
        document.querySelector('.div_search3').style.display = 'block';
    }
    
    let currentStep = 2;
    function plusTrip() {
    	
    	currentStep++;
    	
    	if (currentStep > 3) {
            currentStep = 1;
        }
    	
    	document.querySelector('.dakukan' + currentStep).style.display = 'block';
    }

//--------------------------------------------------------------------------------
		
	// 모달-출발지
	document.querySelectorAll('.section_2_ul').forEach(function(ul) {
		ul.addEventListener('click', function(event) {
			if (event.target.classList.contains('depCtyCodeSearch')) {
				const tab = event.target.closest('.section_2_li');
			    const depCityModalEl = tab.querySelector('.depCityModal');
			    const modalBackground1El = tab.querySelector('.modalBackground1');
			    depCityModalEl.style.display = 'block';
			    modalBackground1El.style.display = 'block';
			}
		});
	});

	// 출발지 선택
	function setDepCity(cityName, cityCode, cityCountry) {
		const activeTab = document.querySelector('.section_2_li .depCityModal[style*="display: block"]').closest('.section_2_li');
		const setDepCityEl = activeTab.querySelector('.depCtyCodeSearch');
		console.dir(setDepCityEl);
		setDepCityEl.value = cityName + ' ' + cityCode;
		console.dir(setDepCityEl.value);
	}

	// 모달-도착지
	document.querySelectorAll('.section_2_ul').forEach(function(ul) {
		ul.addEventListener('click', function(event) {
			if (event.target.classList.contains('ariCtyCodeSearch')) {
				const tab = event.target.closest('.section_2_li');
			    const depCityModalEl = tab.querySelector('.ariCityModal');
			    const modalBackground1El = tab.querySelector('.modalBackground2');
			    depCityModalEl.style.display = 'block';
			    modalBackground1El.style.display = 'block';
			}
		});
	});

	// 도착지 선택
	function setDepCity2(cityName, cityCode, cityCountry) {
	    const activeTab = document.querySelector('.section_2_li .ariCityModal[style*="display: block"]').closest('.section_2_li');
		const setAriCityEl = activeTab.querySelector('.ariCtyCodeSearch');
		console.dir(setAriCityEl);
		setAriCityEl.value = cityName + ' ' + cityCode;
		console.dir(setAriCityEl.value);
	}


	// 출발지, 도착지 선택 시 모달 닫기
	document.querySelectorAll('.section_2_ul').forEach(function(ul) {
	    const modalItems = ul.querySelectorAll('li td');
	    modalItems.forEach(function(item) {
	        item.addEventListener('click', function() {
	            ul.querySelector('.modalBackground1').style.display = 'none';
	            ul.querySelector('.depCityModal').style.display = 'none';
	            ul.querySelector('.modalBackground2').style.display = 'none';
	            ul.querySelector('.ariCityModal').style.display = 'none';
	        });
	    });
	});

	// 출발지 모달 닫기
	document.querySelectorAll('.section_2_ul').forEach(function(ul) {
	    const closeModalBtn = ul.querySelector('.closeBtn');
	    closeModalBtn.addEventListener('click', function() {
	        closeModal(ul);
	    });
	});
	
	function closeModal(ul) {
	    event.preventDefault(); // 모달 닫을 때 항공권 검색 이동 막음
	    ul.querySelector('.modalBackground1').style.display = 'none';
	    ul.querySelector('.depCityModal').style.display = 'none';
	}
	
	// 도착지 모달 닫기
	document.querySelectorAll('.section_2_ul').forEach(function(ul) {
	    const closeModalBtn2 = ul.querySelector('.closeBtn2');
	    closeModalBtn2.addEventListener('click', function() {
	        closeModal2(ul);
	    });
	});
	
	function closeModal2(ul) {
	    event.preventDefault(); // 모달 닫을 때 항공권 검색 이동 막음
	    ul.querySelector('.modalBackground2').style.display = 'none';
	    ul.querySelector('.ariCityModal').style.display = 'none';
	}

//---------------------------------------------------------------------------------------------------

// 달력 코드
$(function() {
        // 가는날과 오는날을 선택할 input 요소들의 id
        //var depDatePicker = $("#txt_depDt_view");
        var depDatePicker = $(".section_2_2_1");
        //var arrDatePicker = $("#txt_arrDt_view");
        var arrDatePicker = $(".section_2_2_2");

        var boardingDatePicker1 = $(".section_2_2_3");
        console.dir(boardingDatePicker1);
        var boardingDatePicker2 = $(".section_2_2_4");
        console.dir(boardingDatePicker2);
        var boardingDatePicker3 = $(".section_2_2_5");
        
        // 선택된 가는날과 오는날을 저장할 변수
        var depDateSelected = false;
        var arrDateSelected = false;
        var boardingDateSelected1 = false;
        var boardingDateSelected2 = false;
        var boardingDateSelected3 = false;

        // 출발날짜 Datepicker 초기화
        depDatePicker.datepicker({
            dateFormat: 'yy-mm-dd', // 날짜 형식 설정
            minDate: 0, // 오늘 이후의 날짜만 선택 가능하도록 설정
            numberOfMonths: 2, // 두 개의 월을 표시
            onSelect: function(selectedDate) {
                // 선택한 날짜를 input 요소에 표시
                depDatePicker.val(selectedDate);
                
             	// Datepicker로부터 선택한 날짜 가져오기
                var selectedDate = depDatePicker.datepicker( "getDate" );

                // 선택한 날짜를 원하는 형식의 문자열로 변환
                var depdateString = $.datepicker.formatDate( "yy-mm-dd", selectedDate );

                console.log(depdateString); // 선택한 날짜의 문자열 표현 출력
                
                // 가는날을 선택했으므로 변수를 true로 설정
                depDateSelected = true;
                
                // 오는날을 선택한 경우에만 달력을 닫음
                if (arrDateSelected) {
                    depDatePicker.datepicker("hide");
                    arrDateSelected = false;
                }
            }
        });

     	// 도착날짜 Datepicker 초기화
        arrDatePicker.datepicker({
            dateFormat: 'yy-mm-dd', // 날짜 형식 설정
            minDate: 0, // 오늘 이후의 날짜만 선택 가능하도록 설정
            numberOfMonths: 2, // 두 개의 월을 표시
            onSelect: function(selectedDate) {
                // 선택한 날짜를 input 요소에 표시
                arrDatePicker.val(selectedDate);
                
             	// Datepicker로부터 선택한 날짜 가져오기
                var selectedDate = arrDatePicker.datepicker( "getDate" );
                console.log(selectedDate); // 선택한 날짜의 문자열 표현 출력

                // 선택한 날짜를 원하는 형식의 문자열로 변환
                var arrdateString = $.datepicker.formatDate( "yy-mm-dd", selectedDate );

                console.log(arrdateString); // 선택한 날짜의 문자열 표현 출력
                
                // 오는날을 선택했으므로 변수를 true로 설정
                arrDateSelected = true;
                
                // 가는날을 선택한 경우에만 달력을 닫음
                if (depDateSelected) {
                    arrDatePicker.datepicker("hide");
                    depDateSelected = false;
                }
            }
        });

        
        // 가는날과 오는날 input 요소를 클릭하면 Datepicker 팝업이 나타나게 설정
        depDatePicker.add(arrDatePicker).on("click", function() {
            $(this).datepicker("show");
        });
        
	    // 편도 선택 시 오는날과 가는날을 동일하게 설정
	    $("#initFormCode2").click(function() {
	        arrDatePicker.val(depDatePicker.val());
	    });
	    
    });
    
//-----------------다구간 달력---------------------
$(function() {
    $(".boardingDatePickerView").datepicker({
        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
        minDate: 0, // 오늘 이후의 날짜만 선택 가능하도록 설정
        numberOfMonths: 2, // 두 개의 월을 표시
        onSelect: function(selectedDate) {
            var hiddenInputId = $(this).attr('id').replace('_view', '');
            $('#' + hiddenInputId).val(selectedDate); // 선택한 날짜를 hidden input에 설정
        }
    });
});
    
//---------------------------------------------------------------------------------------------------

	// 승객명수 코드
    function showPassengerOptions(tabType) {
    	var passengerOptions = document.getElementById('passengerOptions' + tabType);
        passengerOptions.style.display = passengerOptions.style.display === 'none' ? 'block' : 'none';
        console.dir('==== passengerOptions ====');
        console.dir(passengerOptions);
    }

    function adjustCount(id, delta, element) {
    	event.preventDefault(); // 기본 동작 막기
        var parent = element.closest('.passenger-count');
        var countElement = parent.querySelector('.' + id);
        var currentCount = parseInt(countElement.innerText);
        var newCount = currentCount + delta;
        if (newCount < 0) { newCount = 0 };
        countElement.innerText = newCount;
        console.dir(countElement);
        console.dir(currentCount);
        console.dir(newCount);
    }

    function completeSelection(event, tabType) {
    	event.preventDefault(); // 기본 동작 막기
       	updatePassengerSummary(tabType);
        document.getElementById('passengerOptions' + tabType).style.display = 'none';
    }

    function updatePassengerSummary(tabType) {
     	var parent = document.getElementById('passengerOptions' + tabType);
        var adultCount = parseInt(parent.querySelector('.adultCount').innerText);
        var childCount = parseInt(parent.querySelector('.childCount').innerText);
        var infantCount = parseInt(parent.querySelector('.infantCount').innerText);
        var totalPassengers = adultCount + childCount + infantCount;
        var seatClass = document.querySelector('input[name="seatClass"]:checked').value;
            
        var summaryText = `승객 \${totalPassengers}명, \${seatClass}`;
        var parent2 = document.getElementById('section_2_3_' + tabType);
        parent2.querySelector('.bin_people').innerText = summaryText;
            
        console.log('====adultCount====');
        console.log(adultCount);
        console.log('====childCount====');
        console.dir(childCount);
        console.log('====infantCount====');
        console.dir(infantCount);
        console.log('====totalPassengers====');
        console.dir(totalPassengers);
        console.dir(seatClass);
        console.dir(summaryText);
    }
    
    function getCurrentTabType() {
    	  var tabs = document.getElementsByName('initform');
    	  for (var i = 0; i < tabs.length; i++) {
    	    if (tabs[i].checked) {
    	      return tabs[i].value;
    	    }
    	  }
    	  return 'RT'; // 기본값으로 'RT' 반환
    }

//---------------------------------------------------------------------------------------------------

// 선택값 컨트롤러 전송
function sendSelectionToController() {
	
	// -----  변수 선언  -----
	const activeTab = document.querySelector('.tab-content[style*="display: block"]');
	const depCityInput = activeTab.querySelector('.depCtyCodeSearch');
	const arrCityInput = activeTab.querySelector('.ariCtyCodeSearch');
	
	const depCity1 = depCityInput ? depCityInput.value.split(' ')[0] : '';
	const depCityCode1 = depCityInput ? depCityInput.value.split(' ')[1] : '';

	const arrCity1 = arrCityInput ? arrCityInput.value.split(' ')[0] : '';
	const arrCityCode1 = arrCityInput ? arrCityInput.value.split(' ')[1] : '';
    
    // initform, 왕복 편도 다구간 값
    let radioGroup = document.getElementsByName('initform');
    let selectedValue;
    for (let i = 0; i < radioGroup.length; i++) {
        if (radioGroup[i].checked) {
            selectedValue = radioGroup[i].value;
            break;
        }
    }
    
    // 승객 명수 값
    var currentTabType = getCurrentTabType();
    let adultCount = parseInt(document.querySelector(`#passengerOptions\${currentTabType} .adultCount`).innerText);
    let childCount = parseInt(document.querySelector(`#passengerOptions\${currentTabType} .childCount`).innerText);
    let infantCount = parseInt(document.querySelector(`#passengerOptions\${currentTabType} .infantCount`).innerText);
    
    let totalPassengers = adultCount + childCount + infantCount;

    // -----  폼 생성  -----
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = '/Airplane/Search?id=${ sessionScope.login.id }';

    // -----  데이터 추가  -----
    
    // 출발지
    var inputDepCity = document.createElement('input');
    inputDepCity.type = 'hidden';
    inputDepCity.name = 'depCity1';
    inputDepCity.value = depCity1;
    form.appendChild(inputDepCity);

    // 출발지 코드(ENAME)
    var inputDepCityCode = document.createElement('input');
    inputDepCityCode.type = 'hidden';
    inputDepCityCode.name = 'depCityCode1';
    inputDepCityCode.value = depCityCode1;
    form.appendChild(inputDepCityCode);

    // 도착지
    var inputArrCity = document.createElement('input');
    inputArrCity.type = 'hidden';
    inputArrCity.name = 'arrCity1';
    inputArrCity.value = arrCity1;
    form.appendChild(inputArrCity);

    // 도착지 코드(ENAME)
    var inputArrCityCode = document.createElement('input');
    inputArrCityCode.type = 'hidden';
    inputArrCityCode.name = 'arrCityCode1';
    inputArrCityCode.value = arrCityCode1;
    form.appendChild(inputArrCityCode);
    
    // initform, 왕복, 편도, 다구간
    var inputSelectedValue = document.createElement('input');
    inputSelectedValue.type = 'hidden';
    inputSelectedValue.name = 'initform';
    inputSelectedValue.value = selectedValue;
    form.appendChild(inputSelectedValue);

    // 승객명수 - 성인
    var inputAdultCount = document.createElement('input');
    inputAdultCount.type = 'hidden';
    inputAdultCount.name = 'adultCount';
    inputAdultCount.value = adultCount;
    form.appendChild(inputAdultCount);
	
    // 승객명수 - 소아
    var inputChildCount = document.createElement('input');
    inputChildCount.type = 'hidden';
    inputChildCount.name = 'childCount';
    inputChildCount.value = childCount;
    form.appendChild(inputChildCount);
    
    // 승객명수 - 유아
    var inputInfantCount = document.createElement('input');
    inputInfantCount.type = 'hidden';
    inputInfantCount.name = 'infantCount';
    inputInfantCount.value = infantCount;
    form.appendChild(inputInfantCount);

	// 좌석 등급 값
    let seatClass = document.querySelector('input[name="seatClass"]:checked').value;
    
	var inputSeatClass = document.createElement('input');
    inputSeatClass.type = 'hidden';
    inputSeatClass.name = 'seatClass';
    inputSeatClass.value = seatClass;
    form.appendChild(inputSeatClass);
    
    let stype;
    switch (seatClass) {
      case 'economy':
        stype = 1;
        break;
      case 'premium-economy':
        stype = 2;
        break;
      case 'business':
        stype = 3;
        break;
      case 'first-class':
        stype = 4;
        break;
      default:
        stype = 1; // 기본값 설정 (필요한 경우)
    }

    var inputStype = document.createElement('input');
    inputStype.type = 'hidden';
    inputStype.name = 'stype';
    inputStype.value = stype;
    form.appendChild(inputStype);

    // 왕복 일 경우 오는날 전송
    const initform = form.elements['initform'].value;
    var inputInitform = document.createElement('input');
    inputInitform.type = 'hidden';
    inputInitform.name = 'initform';
    inputInitform.value = initform;
    form.appendChild(inputInitform);
    
    if (initform === 'RT') {
    
		// 출발지 - 왕복
		const depCity2 = arrCityInput ? arrCityInput.value.split(' ')[0] : '';
		const depCityCode2 = arrCityInput ? arrCityInput.value.split(' ')[1] : '';
		
		var inputDepCity2 = document.createElement('input');
	    inputDepCity2.type = 'hidden';
	    inputDepCity2.name = 'depCity2';
	    inputDepCity2.value = depCity2;
	    form.appendChild(inputDepCity2);

	    var inputDepCityCode2 = document.createElement('input');
	    inputDepCityCode2.type = 'hidden';
	    inputDepCityCode2.name = 'depCityCode2';
	    inputDepCityCode2.value = depCityCode2;
	    form.appendChild(inputDepCityCode2);
	    
		// 도착지 - 왕복
		const arrCity2 = depCityInput ? depCityInput.value.split(' ')[0] : '';
		const arrCityCode2 = depCityInput ? depCityInput.value.split(' ')[1] : '';
    	
	    var inputArrCity2 = document.createElement('input');
	    inputArrCity2.type = 'hidden';
	    inputArrCity2.name = 'arrCity2';
	    inputArrCity2.value = arrCity2;
	    form.appendChild(inputArrCity2);

	    var inputArrCityCode2 = document.createElement('input');
	    inputArrCityCode2.type = 'hidden';
	    inputArrCityCode2.name = 'arrCityCode2';
	    inputArrCityCode2.value = arrCityCode2;
	    form.appendChild(inputArrCityCode2);
	    
	 	// 출발 날짜 값
	    let depDatePicker = $("#txt_depDt_view");
	    let selectedDate1 = depDatePicker.datepicker( "getDate" );
	    let depdateString = $.datepicker.formatDate( "yy-mm-dd", selectedDate1 );
	    
	    // 출발날짜
	    var inputDepDate = document.createElement('input');
	    inputDepDate.type = 'hidden';
	    inputDepDate.name = 'depDate';
	    inputDepDate.value = depdateString;
	    form.appendChild(inputDepDate);
	    
    	// 오는 날짜 값 - 왕복
    	let arrDatePicker = $("#txt_arrDt_view");
	    let selectedDate2 = arrDatePicker.datepicker( "getDate" );
	    let arrdateString = $.datepicker.formatDate( "yy-mm-dd", selectedDate2 );
    	
	    var inputArrDate = document.createElement('input');
	    inputArrDate.type = 'hidden';
	    inputArrDate.name = 'arrDate';
	    inputArrDate.value = arrdateString;
	    form.appendChild(inputArrDate);
	    
    } else {
        // 왕복이 아닌 경우 오는 날짜 필드를 비움
        
        // 출발 날짜 값
	    let depDatePicker = $("#txt_depDt_view");
	    let selectedDate = depDatePicker.datepicker( "getDate" );
	    let depdateString = $.datepicker.formatDate( "yy-mm-dd", selectedDate );
	    
	    // 출발날짜
	    var inputDepDate = document.createElement('input');
	    inputDepDate.type = 'hidden';
	    inputDepDate.name = 'depDate';
	    inputDepDate.value = depdateString;
	    form.appendChild(inputDepDate);
        
        const depCity2 = '';
        const depCityCode2 = '';
        const arrCity2 = '';
        const arrCityCode2 = '';
        const arrDate = '';
    }
    
    // 폼 제출
    document.body.appendChild(form);
    form.submit();
}  

</script>

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>