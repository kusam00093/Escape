<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escape</title>
<style>
    <style>
        .reservation-container {
            position: relative;
            width: 200px; /* 필요에 따라 너비를 조정하세요 */
        }

        .reservation-input {
            width: 100%;
            box-sizing: border-box;
            padding-right: 30px; /* 드롭다운 버튼 공간 확보 */
        }

        .dropdown-button {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: 30px; /* 드롭다운 버튼 너비 */
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            border-left: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1;
        }

        .dropdown-button::after {
            content: '▼';
            font-size: 12px;
            color: #333;
        }

        .reservation-select {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            z-index: 2;
            border: 1px solid #ddd;
            border-top: none;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .reservation-select option {
            padding: 10px;
        }

        .show {
            display: block;
        }

        .css-xht1av--re-style--label {
            font-weight: bold;
        }

        .css-1iuiezq--re-style--holdingPoint {
            margin-left: 10px;
        }

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- CSS Stylesheets -->
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/accommodation/roomOrder.css" />
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
	<div id="Mrt3Payment-react-component-acae5f91-949c-443e-9eed-359aaa720e6d">
		<div class="css-17i062k--OrderFormBase--OrderFormContainer eyxr1171">
			<form class="css-d4sm79--OrderFormBase--Form eyxr1170">
				<h1 class="css-17dobcw--OrderForm--Title ed3ree23">예약하기</h1>
<!-- 				전체 큰 박스 -->
				<div class="css-1ch2iob--OrderForm--Content ed3ree22">
					<div class="css-ttzwrq--OrderForm--Wrapper ed3ree21">
						<div class="css-19p5kql--OrderForm--CommonPurchaseContainer ed3ree20">
<!-- 						호텔정보	1번 div -->
							<div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
								<div class="css-z4djww--SectionContainer--Body--ProductInfo--mainContentStyle exjt3m70">
<!-- 									호텔 이름 -->
									<div class="css-9e4tkg--ProductInfoSummary--Container e1m7creq3">
										<div class="css-n2xyg7--ProductInfoSummary--ImageWrapper e1m7creq2">
											<img src="${image}" alt="상품 이미지" class="css-170w93a--ProductInfoSummary--Image e1m7creq1">
										</div>
										<h3 class="css-1hgeeeb--ProductInfoSummary--Title e1m7creq0">${packageVo.title}</h3>
									</div>
<!-- 									체크인 -->
									<p class="css-18inzct--ProductInfoSchedule--ScheduleItem e4bh9q30">
										<span>출발일</span>
										<span>${  packageVo.start_date } </span>
									</p>
<!-- 									체크아웃 -->
									<p class="css-18inzct--ProductInfoSchedule--ScheduleItem e4bh9q30">
										<span>귀국일</span>
										<span>${ packageVo.end_date }</span>
									</p>
								</div>
							</div>
<!-- 						결제금액	2번 div -->
<%-- 							<c:set var="PackageInfo" value="${packageVo.package_idx}" /> --%>
<%-- 							<c:set var="lowestPrice" value="${package_price}" /> --%>
<%-- 							<c:set var="discountRate" value="${hotelInfo.DISCOUNT_RATE}" /> --%>
<%-- 							<c:set var="discountAmount" value="${hotelInfo.DISCOUNT_AMOUNT}" /> --%>
<%-- 							<c:set var="price" value="${package_price}" /> --%>
							
<%-- 							<c:choose> --%>
<%-- 							    <c:when test="${discountRate > 0}"> --%>
<%-- 							        <c:set var="discountedPrice" value="${price - (price * discountRate / 100)}" /> --%>
<%-- 							    </c:when> --%>
<%-- 							    <c:otherwise> --%>
<%-- 							        <c:set var="discountedPrice" value="${price - discountAmount}" /> --%>
<%-- 							    </c:otherwise> --%>
<%-- 							</c:choose> --%>
							
<%-- 							<c:set var="formattedLowestPrice"> --%>
<%-- 							    <fmt:formatNumber value="${lowestPrice}" type="number" pattern="#,###"/> --%>
<%-- 							</c:set> --%>
<%-- 							<c:set var="formattedDiscountedPrice"> --%>
<%-- 							    <fmt:formatNumber value="${discountedPrice}" type="number" pattern="#,###"/> --%>
<%-- 							</c:set> --%>
<%-- 							<c:set var="formattedPrice"> --%>
<%-- 							    <fmt:formatNumber value="${price}" type="number" pattern="#,###"/> --%>
<%-- 							</c:set> --%>
							
							<div class="css-jx2h8f--SectionContainer--Container--Price--containerStyle exjt3m71">
								<div class="css-10zndy8--SectionContainer--Body--Price--mainContentStyle exjt3m70">
									<ul class="css-v6wk68--PriceList--OptionWrapper ew0r5g20">
										<li class="css-1xtyir3--OptionInfoList--Option e1fd4fa03">
											<div class="css-81epwr--OptionInfoList--OptionText e1fd4fa01">
												<span class="css-16q01t6--OptionInfoList--OptionName e1fd4fa02">${packageVo.title}</span>
											</div>
											<div class="css-mnnvnj--OptionInfoList--OptionPrice e1fd4fa00">${package_price}원/1명</div>
										</li>
										<li class="css-qcgeyu--ExtraInfoList--Option el8p7f63">
											<div class="css-1gf28m5--ExtraInfoList--OptionText el8p7f61">
												<span class="css-qb575q--ExtraInfoList--OptionName el8p7f62">여행기간</span>
											</div>
											<div class="css-17r2s3v--ExtraInfoList--OptionPrice el8p7f60">총 ${date}일</div>
										</li>
									</ul>
<!-- 									<div class="css-71xvha--PriceTotal--Container e1o8jsxo4"> -->
<!-- 										<div class="css-wdcz2a--PriceTotal--TotalPriceWrapper e1o8jsxo3"> -->
<!-- 											<div class="css-u0gcr6--PriceTotal--TotalPriceText e1o8jsxo2">상품 금액/(개)</div> -->
<!-- 										    <strong class="css-1qt89sm--PriceTotal--TotalPriceNumber e1o8jsxo1"> -->
<%-- 										        <fmt:formatNumber value="${package_price}" type="number" pattern="#,###"/>원 --%>
<!-- 										    </strong> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</div>	
<!-- 						포인트정보	3번 div -->
							<div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
								<div class="css-13hdby9--SectionContainerHeader--Wrapper e1o4ti5r4">
									<div class="css-1m5d5b0--SectionContainerHeader--Box e1o4ti5r3">
										<h2 class="css-1espa7k--SectionContainerHeader--Title e1o4ti5r2">포인트 사용</h2>
									</div>
								</div>
								<hr class="css-73gmso">
								<div class="css-1xjf2qv--SectionContainer--Body exjt3m70">
    <div class="reservation-container">
        <label class="css-xht1av--re-style--label" for="reservationInput">예약자 수</label>
        <input type="number" id="reservationInput" class="reservation-input css-1iuiezq--re-style--holdingPoint" min="1" value="${reservation_su}" placeholder="명 수 입력">
        <button id="dropdownButton" class="dropdown-button"></button>
        <select id="reservationSelect" class="reservation-select">
            <!-- Options will be dynamically added here -->
        </select>
    </div>				
								
								
									<div class="css-dnxl79--Point-style--labelWrapper">
										<span class="css-xht1av--Point-style--label">내 포인트</span>
										<span class="css-1iuiezq--Point-style--holdingPoint" >${point}원</span>
									</div>

									<div class="css-1ci03y3--Point-style--inputWrapper">
									    <div class="checkout-point-inputbox css-1vqiqg7">
									        <input type="number" id="pointsToUse" placeholder="0" pattern="[0-9]*" class="css-o9jzai" value="0">
									        <span class="css-1fwrkpi">원</span>
									    </div>
									    <span role="button" class="checkout-point-button css-mkihkg">
									        <button type="button" class="mrt-button css-1fq9c2a" id="useAllPoints">
									            <span class="css-1s4v6ia">모두 사용</span>
									        </button>
									    </span>
									</div>							
								</div>
							</div>
<!-- 						예약자정보 4번 div -->
							<div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
								<div class="css-13hdby9--SectionContainerHeader--Wrapper e1o4ti5r4">
									<div class="css-1m5d5b0--SectionContainerHeader--Box e1o4ti5r3">
										<h2 class="css-1espa7k--SectionContainerHeader--Title e1o4ti5r2">예약자</h2>
									</div>
								</div>
								<hr class="css-73gmso">
								<div class="css-1xjf2qv--SectionContainer--Body exjt3m70">
									<div>
										<div class="css-1jsagqa--ReservationPerson--Container e1eynx4r2">
											<div class="css-cv06j6--EditForm--Container e1rcmy85">
												<div class="css-9yldiq--EditForm--KoreanNameWrapper e1rcmy84">
													<span class="css-119aw1b--EditForm--KoreanName--getEllipsisStyle--getEllipsisStyle e1rcmy83">${userInfo.last_name} ${userInfo.first_name}</span>
													<img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_select_arrow_gray_1000.svg" alt="icon">
												</div>
												<div class="css-1qn2m1l--Email--Info--getEllipsisStyle--getEllipsisStyle e1tt4p4k0">${userInfo.email}</div>
												<div class="css-19x6daw--KorName--Info--getEllipsisStyle--getEllipsisStyle e1apmuge0">${userInfo.last_name} ${userInfo.first_name}</div>
												<div class="css-1d7kmj6--Phone--Info e1qr2bi0">${userInfo.phone}</div>
<!-- 												<div class="css-7s5oja--EditForm--WarningWrapper e1rcmy82"> -->
<!-- 													<img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ico_error_16x16.svg" alt="icon"> -->
<!-- 													<span class="css-4q637n--EditForm--WarningDescription e1rcmy81">아래 필수 정보를 모두 입력해주세요.</span> -->
<!-- 												</div> -->
												<div class="css-14dhszq--EngName--Wrapper e212gkd0">
													<div class="css-mexqx--AdditionalInfoContainer--Container--AdditionalInfoContainer--Container e19vw12m2">
														<div class="css-txmszs--AdditionalInfoContainer--Label e19vw12m1">영문 성</div>
															<input type="text" placeholder="HONG" maxlength="50" class="css-15wiu3z--EngLastName--TextInput e6e1ike1" value="">
														</div>
														<div class="css-mexqx--AdditionalInfoContainer--Container--AdditionalInfoContainer--Container e19vw12m2">
															<div class="css-txmszs--AdditionalInfoContainer--Label e19vw12m1">영문 이름</div>
															<input type="text" placeholder="GILDONG" maxlength="50" class="css-yv1h8q--EngFirstName--TextInput e39z6rv1" value="">
														</div>
													</div>
													<span class="css-1oehzqs--EditForm--EditBtn e1rcmy80">
														<u>정보 수정</u>
													</span>
												</div>
										</div>
										<div class="css-19vy8jy--ReservationPerson--NoticeWrapper e1eynx4r1">
											<span class="css-1ibdkp7--ReservationPerson--Notice e1eynx4r0">예약 안내 정보가 예약자의 이메일로 발송됩니다.</span>
										</div>
										<div class="css-kumkj--Companion--Container e1po6iqs2">
									    	<div class="css-2mpmz3--Companion--Title e1po6iqs1">누구와 함께 떠나세요?</div>
									    	<div class="css-1mp7jgw--Companion--SubTitle e1po6iqs0">여행자님에게 꼭 맞는 여행 상품을 추천해드릴게요</div>
										    <div class="css-5suex">
										        <div class="mrt-chip-item css-1y9xciw" data-value="friend">
										            <div class="mrt-chip-item-wrapper css-1o5qkcj">
										                <div class="mrt-chip-item-content css-zstt25">친구와</div>
										            </div>
										        </div>
										        <div class="mrt-chip-item css-1y9xciw" data-value="spouse">
										            <div class="mrt-chip-item-wrapper css-1o5qkcj">
										                <div class="mrt-chip-item-content css-zstt25">배우자와</div>
										            </div>
										        </div>
										        <div class="mrt-chip-item css-1y9xciw" data-value="parents">
										            <div class="mrt-chip-item-wrapper css-1o5qkcj">
										                <div class="mrt-chip-item-content css-zstt25">부모님과</div>
										            </div>
										        </div>
										        <div class="mrt-chip-item css-1y9xciw" data-value="lover">
										            <div class="mrt-chip-item-wrapper css-1o5qkcj">
										                <div class="mrt-chip-item-content css-zstt25">연인과</div>
										            </div>
										        </div>
										        <div class="mrt-chip-item css-1y9xciw" data-value="alone">
										            <div class="mrt-chip-item-wrapper css-1o5qkcj">
										                <div class="mrt-chip-item-content css-zstt25">혼자</div>
										            </div>
										        </div>
										        <div class="mrt-chip-item css-1y9xciw" data-value="child">
										            <div class="mrt-chip-item-wrapper css-1o5qkcj">
										                <div class="mrt-chip-item-content css-zstt25">아이와</div>
										            </div>
										        </div>
										    </div>
										</div>
									</div>
								</div>
								
							</div>
<!-- 						추가 예약 정보 5번 div -->
							<div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
								<div class="css-13hdby9--SectionContainerHeader--Wrapper e1o4ti5r4">
									<div class="css-1m5d5b0--SectionContainerHeader--Box e1o4ti5r3">
										<h2 class="css-1espa7k--SectionContainerHeader--Title e1o4ti5r2">추가 예약 정보</h2>
										<span class="css-1mrjn5z--SectionContainerHeader--Required e1o4ti5r1">(선택)</span>
									</div>
								</div>
								<hr class="css-73gmso">
								<div class="css-1xjf2qv--SectionContainer--Body exjt3m70">
									<div class="css-13jamwz--PartnerCustomInfos--OptionWrapper e1sg07ai2">
										<div class="css-vjrmsf--PartnerCustomInfos--OptionTitle e1sg07ai1">기타 요청 사항</div>
										<div class="css-q0yy64--AdditionalInfoContainer--Container e19vw12m2">
											<div class="css-txmszs--AdditionalInfoContainer--Label e19vw12m1">숙소에 전달할 요청사항을 현지 언어로 작성해주세요.</div>
											<textarea maxlength="3000" placeholder="답변을 입력해 주세요." class="css-uqj3ax--TextArea--TextAreaInput e1xavf0v0"></textarea>
										</div>
										<div class="css-m52mdb--PartnerCustomInfos--GuideText e1sg07ai0">고객님의 요청사항이 전달되나, 간혹 현장 사정에 따라 반영되지 않을 수 있습니다.</div>
									</div>
								</div>
							</div>
<!-- 							결제방법 6번 div-->
							<div>
							    <div class="css-8mjhao--PaymentMethods--RefHolder e1piyscg1"></div>
							    <div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
							        <div class="css-13hdby9--SectionContainerHeader--Wrapper e1o4ti5r4">
							            <div class="css-1m5d5b0--SectionContainerHeader--Box e1o4ti5r3">
							                <h2 class="css-1espa7k--SectionContainerHeader--Title e1o4ti5r2">결제 방법</h2>
							            </div>
							        </div>
							        <hr class="css-73gmso">
							        <div class="css-1xjf2qv--SectionContainer--Body exjt3m70">
							            <div class="css-1tu548c--PaymentBenefits--Container e14memtx0">
							                <div role="button" tabindex="0">
							                    <div class="css-yojrs6--PaymentBenefitCollectionItem--Item e1t707xg0">
							                        <div class="css-1ye5zyg--PaymentBenefitCollectionItem--LogoWrapper e1t707xg1"></div>
							                        <div class="css-1j6vtio--PaymentBenefitCollectionItem--TextWrapper e1t707xg4">
							                            <p type="bold" class="css-cltgrd--PaymentBenefitCollectionItem--Text e1t707xg3">하나카드 5% 즉시할인</p>
							                        </div>
							                    </div>
							                </div>
							                <div role="button" tabindex="0">
							                    <div class="css-yojrs6--PaymentBenefitCollectionItem--Item e1t707xg0">
							                        <div class="css-1ye5zyg--PaymentBenefitCollectionItem--LogoWrapper e1t707xg1"></div>
							                        <div class="css-1j6vtio--PaymentBenefitCollectionItem--TextWrapper e1t707xg4">
							                            <p type="bold" class="css-cltgrd--PaymentBenefitCollectionItem--Text e1t707xg3">우리카드 8% 청구 할인</p>
							                        </div>
							                    </div>
							                </div>
							                <div role="button" tabindex="0">
							                    <div class="css-yojrs6--PaymentBenefitCollectionItem--Item e1t707xg0">
							                        <div class="css-1ye5zyg--PaymentBenefitCollectionItem--LogoWrapper e1t707xg1"></div>
							                        <div class="css-1j6vtio--PaymentBenefitCollectionItem--TextWrapper e1t707xg4">
							                            <p type="bold" class="css-cltgrd--PaymentBenefitCollectionItem--Text e1t707xg3">전북은행(JB카드) 8% 즉시할인</p>
							                        </div>
							                    </div>
							                </div>
							                <div role="button" tabindex="0">
							                    <div class="css-yojrs6--PaymentBenefitCollectionItem--Item e1t707xg0">
							                        <div class="css-1ye5zyg--PaymentBenefitCollectionItem--LogoWrapper e1t707xg1"></div>
							                        <div class="css-1j6vtio--PaymentBenefitCollectionItem--TextWrapper e1t707xg4">
							                            <p type="bold" class="css-cltgrd--PaymentBenefitCollectionItem--Text e1t707xg3">롯데카드 8% 결제일 할인</p>
							                        </div>
							                    </div>
							                </div>
							                <div role="button" tabindex="0">
							                    <div class="css-yojrs6--PaymentBenefitCollectionItem--Item e1t707xg0">
							                        <div class="css-1ye5zyg--PaymentBenefitCollectionItem--LogoWrapper e1t707xg1"></div>
							                        <div class="css-1j6vtio--PaymentBenefitCollectionItem--TextWrapper e1t707xg4">
							                            <p type="bold" class="css-cltgrd--PaymentBenefitCollectionItem--Text e1t707xg3">최대 12개월 무이자 할부 가능</p>
							                        </div>
							                    </div>
							                </div>
							            </div>
							            <div class="css-fw0beg--PaymentMethods--Wrapper e1piyscg0">
							                <div class="css-116ga3z--PaymentMethodItem--Wrapper e1vqb7zb3">
							                    <div class="css-x4i4r9--PaymentMethodItem--Content e1vqb7zb2">
							                        <input type="radio" class="css-1ve8wdd--PaymentMethodItem--RadioButtonCircle--PaymentMethodItem--RadioButtonCircle e1vqb7zb1" name="paymentMethod" value="CREDIT_CARD" checked="" data-gtm-form-interact-field-id="4">
							                        <label class="css-1d0zz7p--PaymentMethodItem--RadioButtonLabel e1vqb7zb0">신용/체크카드</label>
							                    </div>
							                </div>
							                <div class="css-13vtxn4--CreditCardSelectContent--Wrapper e1p85y4w2">
							                    <select class="css-p9ea29--CreditCardSelectContent--Select--CreditCardSelectContent--Select e1p85y4w1">
							                        <option value="">카드를 선택해주세요</option>
							                        <option value="SAMSUNG">삼성카드</option>
							                        <option value="SHINHAN">신한카드 (SOL페이)</option>
							                        <option value="HYUNDAI">현대카드</option>
							                        <option value="KOOKMIN">국민카드 (KB Pay)</option>
							                        <option value="LOTTE">롯데카드</option>
							                        <option value="WOORI">우리카드</option>
							                        <option value="HANA">하나카드</option>
							                        <option value="BC">비씨카드</option>
							                        <option value="NONGHYEOP">NH농협카드</option>
							                        <option value="KAKAOBANK">카카오뱅크</option>
							                        <option value="CITI">씨티카드</option>
							                        <option value="GWANGJUBANK">광주은행</option>
							                        <option value="KDBBANK">KDB산업은행</option>
							                        <option value="SAEMAUL">새마을금고</option>
							                        <option value="SUHYEOP">SH수협은행</option>
							                        <option value="SHINHYEOP">신협</option>
							                        <option value="KBANK">케이뱅크</option>
							                        <option value="SAVINGBANK">저축은행중앙회</option>
							                        <option value="JEONBUKBANK">전북은행</option>
							                        <option value="JEJUBANK">제주은행</option>
							                        <option value="POST">우체국예금보험</option>
							                        <option value="VISA">VISA</option>
							                        <option value="MASTER">마스터카드</option>
							                        <option value="UNIONPAY">유니온페이</option>
							                        <option value="JCB">JCB</option>
							                    </select>
							                </div>
							                <div class="css-lkitu7--PaymentMethodItem--Wrapper e1vqb7zb3">
							                    <div class="css-x4i4r9--PaymentMethodItem--Content e1vqb7zb2">
							                        <input type="radio" class="css-kfke08--PaymentMethodItem--RadioButtonCircle e1vqb7zb1" name="paymentMethod" value="KAKAOPAY" data-gtm-form-interact-field-id="1">
							                        <label class="css-1d0zz7p--PaymentMethodItem--RadioButtonLabel e1vqb7zb0">카카오페이</label>
							                        <div class="css-1sg2lsz">
							                            <img src="https://dffoxz5he03rp.cloudfront.net/icons/kakaopay_logo_v3.svg" class="css-1t940od">
							                        </div>
							                    </div>
							                </div>
							                <div class="css-lkitu7--PaymentMethodItem--Wrapper e1vqb7zb3">
							                    <div class="css-x4i4r9--PaymentMethodItem--Content e1vqb7zb2">
							                        <input type="radio" class="css-kfke08--PaymentMethodItem--RadioButtonCircle e1vqb7zb1" name="paymentMethod" value="PAYCO" data-gtm-form-interact-field-id="2">
							                        <label class="css-1d0zz7p--PaymentMethodItem--RadioButtonLabel e1vqb7zb0">페이코</label>
							                        <div class="css-1sg2lsz">
							                            <img src="https://dffoxz5he03rp.cloudfront.net/icons/payco_logo_v3.svg" class="css-1t940od">
							                        </div>
							                    </div>
							                </div>
							                <div class="css-lkitu7--PaymentMethodItem--Wrapper e1vqb7zb3">
							                    <div class="css-x4i4r9--PaymentMethodItem--Content e1vqb7zb2">
							                        <input type="radio" class="css-kfke08--PaymentMethodItem--RadioButtonCircle e1vqb7zb1" name="paymentMethod" value="NAVERPAY" data-gtm-form-interact-field-id="3">
							                        <label class="css-1d0zz7p--PaymentMethodItem--RadioButtonLabel e1vqb7zb0">네이버페이</label>
							                        <div class="css-1sg2lsz">
							                            <img src="https://dffoxz5he03rp.cloudfront.net/icons/naverpay_logo_v4.svg" class="css-1t940od">
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
<!-- 					결제 정보 끝 -->
						</div>
					</div>

<!-- 				결제정보 -->
					<div class="css-1nr0q3l--FloatingContainer--Container ebjak7v3">
					    <div class="css-2ww8q5--FloatingContainer--Wrapper ebjak7v2">
					        <div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
					            <div class="css-13hdby9--SectionContainerHeader--Wrapper e1o4ti5r4">
					                <div class="css-1m5d5b0--SectionContainerHeader--Box e1o4ti5r3">
					                    <h2 class="css-1espa7k--SectionContainerHeader--Title e1o4ti5r2">결제 정보</h2>
					                </div>
					            </div>
					            <hr class="css-73gmso">
					            <div class="css-1dc0kte--SectionContainer--Body exjt3m70">
	
					                <div class="css-1gf7fex--TotalPriceInfo--Container e1nkrbzh6">
					                    <div class="css-1a4bcnz--TotalPriceInfo--MainTextWrapper e1nkrbzh5">
									        <span class="css-8lm0oe--TotalPriceInfo--Text e1nkrbzh4">총 결제 금액</span>
									        <div class="css-kz1cl5--TotalPriceInfo--PriceWrapper e1nkrbzh3">
									            <span class="css-bla3vs--TotalPriceInfo--Price e1nkrbzh2" id="finalPrice" data-discounted-price="${discountedPrice}" data-total-nights="${totalNights}">
									                <fmt:formatNumber value="${reservation_price}" type="number" pattern="#,###"/>원
									            </span>
									        </div>
					                    </div>
					                </div>
					                <div class="css-1ab299y--PaymentInfo--Wrapper e14vm5k10">
					                    <div class="css-1b76hqd--ProductNoticeInfo--Wrapper e17edfi26">
					                        <span class="css-1t882oi--ProductNoticeInfo--Text--ProductNoticeInfo--Button e17edfi24">상품에 대해 알아두실 사항</span>
					                        <img class="css-pqepq8--ProductNoticeInfo--customIconStyle" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_info_12x12_line_gray_500.svg" alt="icon">
					                    </div>
					                </div>
					            </div>
					        </div>
					        <div class="css-1yqvzrw--SectionContainer--Container exjt3m71">
					            <div class="css-13hdby9--SectionContainerHeader--Wrapper e1o4ti5r4">
					                <div class="css-1m5d5b0--SectionContainerHeader--Box e1o4ti5r3">
					                    <h2 class="css-1espa7k--SectionContainerHeader--Title e1o4ti5r2">약관 안내</h2>
					                </div>
					            </div>
					            <hr class="css-73gmso">
					            <div class="css-1dc0kte--SectionContainer--Body exjt3m70">
					                <div>
					                    <div class="css-rzod1--Term--Container er2oaqx0">
					                        <div>
					                            <div class="mrt-form-item">
					                                <div class="css-1ofmo3h--TermCheckList--Wrapper efe16hw1">
					                                    <div class="mrt-required-term">
					                                        <span aria-hidden="true" class="css-1sgaj0v--CheckTerm--TermTitle e858sef0">개인정보 수집 및 이용 동의 (필수)</span>
					                                        <img class="css-xqn2lt" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg" alt="detail arrow">
					                                    </div>
					                                    <div class="mrt-required-term">
					                                        <span aria-hidden="true" class="css-1sgaj0v--CheckTerm--TermTitle e858sef0">개인정보 제공 동의 (필수)</span>
					                                        <img class="css-xqn2lt" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg" alt="detail arrow">
					                                    </div>
					                                    <div class="mrt-required-term">
					                                        <span aria-hidden="true" class="css-1sgaj0v--CheckTerm--TermTitle e858sef0">개인정보 국외 이전 동의 (필수)</span>
					                                        <img class="css-xqn2lt" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg" alt="detail arrow">
					                                    </div>
					                                </div>
					                                <strong class="css-z6jvpf--TermCheckList--ConfirmStatement efe16hw2">위 약관을 확인하였으며, 회원 본인은 약관 및 결제에 동의합니다.</strong>
					                            </div>
					                        </div>
					                        <div class="css-1rn2pqw--RefundPolicy--Container e1g30hl80">
					                            <div class="css-k4xfv6--RefundPolicy--Text--RefundPolicy--Title e1g30hl81">예약 취소 규정</div>
					                            <div class="css-93wur2--RefundPolicy--Text e1g30hl82">
											        <p class="css-1vct4yp--RenderMultiLineText--Line e4rbi9y0">${packageVo.start_date}까지 취소 <br>(한국시간) : 전액 환불</p>
											        <p class="css-1vct4yp--RenderMultiLineText--Line e4rbi9y0">${packageVo.end_date} 이후 취소 <br>(한국시간) : 환불 불가</p>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
					        <div class="css-13h99hv--PurchaseButton--Wrapper e1dwjai61">
					            <span role="button" class="css-w0pi5v">
							        <button type="button" class="mrt-button css-jgs6n" id="purchaseButton">
							            <span class="css-1s4v6ia" id="purchaseButtonText">
							                <fmt:formatNumber value="${package_price}" type="number" pattern="#,###"/>원 결제하기
							            </span>
							        </button>
					            </span>
					        </div>
							모달
							<div id="paymentModal" class="modal">
							    <div class="modal-content">
							        <span class="close">&times;</span>
							        <iframe id="paymentIframe" style="width: 100%; height: 800px;"></iframe>
							    </div>
							</div>					        
					    </div>
					</div>
				</div>
			</form>
		</div>
	</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 서버에서 전달된 값
    const maxReservationCount = ${reservation_su_count}; // 최대 예약자 수
    const reservationInput = document.getElementById('reservationInput');
    const reservationSelect = document.getElementById('reservationSelect');
    const dropdownButton = document.getElementById('dropdownButton');
    const pointsToUseInput = document.getElementById('pointsToUse');
    const finalPriceElement = document.getElementById('finalPrice');
    const useAllPointsButton = document.getElementById('useAllPoints');
    const purchaseButton = document.getElementById('purchaseButton');
    const purchaseButtonText = document.getElementById('purchaseButtonText');
    const modal = document.getElementById('paymentModal');
    const iframe = document.getElementById('paymentIframe');
    const closeModal = document.querySelector('#paymentModal .close');

    // 필수 요소 확인
    if (!reservationInput || !reservationSelect || !dropdownButton || !pointsToUseInput || !finalPriceElement || !useAllPointsButton || !purchaseButton || !purchaseButtonText || !modal || !iframe || !closeModal) {
        console.error('필수 요소가 누락되었습니다. 확인이 필요합니다.');
        return;
    }

    // 서버에서 전달된 값 파싱
    const discountedPrice = parseInt(finalPriceElement.getAttribute('data-discounted-price'), 10) || 0;
    const totalNights = parseInt(finalPriceElement.getAttribute('data-total-nights'), 10) || 1;  // 기본값 1
    const packagePrice1 = ${package_price};  // 서버에서 전달된 패키지 가격
    const reservationPrice = ${reservation_price};  // 총 결제 금액의 초기값
    const packageIdx = ${package_idx};  // 패키지 아이디

    // 기본값 설정
    const initialReservationCount = ${reservation_su};
    reservationInput.value = initialReservationCount;

    // Set the initial final price to reservationPrice
    finalPriceElement.textContent = new Intl.NumberFormat().format(reservationPrice) + '원';
    purchaseButtonText.textContent = new Intl.NumberFormat().format(reservationPrice) + '원 결제하기';

    // Populate the select options dynamically
    for (let i = 1; i <= maxReservationCount; i++) {
        const option = document.createElement('option');
        option.value = i;
        option.textContent = `${i}명`;
        reservationSelect.appendChild(option);
    }

    // Toggle the visibility of the dropdown
    dropdownButton.addEventListener('click', function() {
        reservationSelect.classList.toggle('show');
        reservationInput.focus();
    });

    // Handle select change
    reservationSelect.addEventListener('change', function() {
        reservationInput.value = reservationSelect.value;
        reservationSelect.classList.remove('show');
        validateReservationCount();
        updateFinalPrice();  // 가격 업데이트
    });

    // Validate the reservation count
    function validateReservationCount() {
        const inputValue = parseInt(reservationInput.value, 10);
        if (inputValue > maxReservationCount) {
            alert('최대 예약자 수는 ' + maxReservationCount + '명입니다.');
            reservationInput.value = maxReservationCount; // 최대값으로 설정
        }
    }

    reservationInput.addEventListener('input', function() {
        validateReservationCount();
        updateFinalPrice();  // 가격 업데이트
    });

    // "모두 사용" 버튼 클릭 이벤트
    useAllPointsButton.addEventListener('click', function() {
        const availablePoints = parseInt(document.querySelector('.css-1iuiezq--Point-style--holdingPoint').textContent.replace(/[^0-9]/g, ''), 10);
        pointsToUseInput.value = availablePoints;
        updateFinalPrice();
    });

    pointsToUseInput.addEventListener('input', function() {
        let pointsToUse = parseInt(this.value.replace(/[^0-9]/g, ''), 10);
        const availablePoints = parseInt(document.querySelector('.css-1iuiezq--Point-style--holdingPoint').textContent.replace(/[^0-9]/g, ''), 10);

        if (isNaN(pointsToUse) || pointsToUse < 0) {
            pointsToUse = 0;
        }

        if (pointsToUse > availablePoints) {
            alert('사용 가능한 포인트를 초과하였습니다.');
            pointsToUse = availablePoints;
        }

        this.value = pointsToUse;
        updateFinalPrice();
    });

    function updateFinalPrice() {
        const pointsToUse = parseInt(pointsToUseInput.value, 10) || 0;
        const reservationCount = parseInt(reservationInput.value, 10) || 1;  // 기본값 1

        // Calculate the original total price based on reservation count
        const originalTotalPrice = packagePrice1 * reservationCount;
        // Calculate the final price
        const finalPrice = (originalTotalPrice - pointsToUse) < 0 ? 0 : (originalTotalPrice - pointsToUse);

        // Update final price display
        finalPriceElement.textContent = new Intl.NumberFormat().format(finalPrice) + '원';

        // Update purchase button text
        purchaseButtonText.textContent = new Intl.NumberFormat().format(finalPrice) + '원 결제하기';
    }

    // 페이지 로드 시 초기 상태 설정
    updateFinalPrice();

    // 선택 상태 처리
    const items = document.querySelectorAll('.mrt-chip-item-wrapper');

    items.forEach(function(item) {
        item.addEventListener('click', function() {
            // 모든 항목의 선택 상태 해제
            items.forEach(function(i) {
                i.classList.remove('selected');
            });

            // 클릭된 항목에 선택 상태 추가
            this.classList.add('selected');
        });
    });

    // 약관 동의 처리
    const termItems = document.querySelectorAll('.mrt-required-term img');

    termItems.forEach(function(img) {
        img.addEventListener('click', function() {
            // 클릭된 항목에 선택 상태 토글
            img.classList.toggle('selected');
        });
    });

    // 결제 모달 관련 변수와 이벤트 핸들러
    purchaseButton.addEventListener('click', function() {
        const selectedPaymentMethodElement = document.querySelector('input[name="paymentMethod"]:checked');
        if (selectedPaymentMethodElement) {
            const selectedPaymentMethod = selectedPaymentMethodElement.value;
            console.log('Selected Payment Method:', selectedPaymentMethod);
        } else {
            console.error('No payment method selected');
            alert('결제 방법을 선택해 주세요.');
            return;  // No payment method selected, stop further execution
        }

        const urlParams = new URLSearchParams(window.location.search);
        const guest = urlParams.get('guest');
        const place = urlParams.get('place');
        const date = urlParams.get('date');
        const room_idx = window.location.pathname.split('/').pop();
        const reservationCount = parseInt(reservationInput.value, 10) || 1;

        // Calculate the original total price based on reservation count
        const originalTotalPrice = packagePrice1 * reservationCount;
        // Subtract the points used from the original total price
        const pointsToUse = parseInt(pointsToUseInput.value, 10) || 0;
        const finalPrice = (originalTotalPrice - pointsToUse) < 0 ? 0 : (originalTotalPrice - pointsToUse);
        const package_idx1 = ${package_idx};

        const paymentData = {
            reservationCount: reservationCount,  // 예약자 수
            reservationPrice: originalTotalPrice,  // 총 결제 금액
            finalPrice: finalPrice,  // 최종 결제 금액
            pointsToUse: pointsToUse,  // 사용한 포인트
            package_idx1: package_idx1,  // 패키지 아이디
            paymentMethod: 'KAKAOPAY'  // 결제 방법
        };

        fetch('/PackageApi/Payment', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(paymentData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('결제 하시겠습니까?');
                if (data.paymentResponse) {
                    iframe.src = data.paymentResponse;
                    modal.style.display = 'block';
                    alert(reservationCount);
                    
                }
                // 결제가 완료되면 지정된 페이지로 리다이렉트
                window.location.href = data.redirectUrl;
            } else {
                alert('결제에 실패했습니다. 다시 시도해 주세요.');
            }
        })
        .catch(error => {
            console.error('결제 요청 중 오류가 발생했습니다.', error);
            alert('결제 요청 중 오류가 발생했습니다. ' + error.message);
        });
    });

    // 모달 창 닫기
    closeModal.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    // 모달 창 외부 클릭 시 닫기
    window.addEventListener('click', function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    // 페이지 로드 시 초기 상태 설정
    updateFinalPrice();
});

</script>






</body>

</html>
