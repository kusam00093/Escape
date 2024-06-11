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
</head>
<body>

<%@include file="/WEB-INF/include/header.jsp"%>
<%@include file="/WEB-INF/include/nav.jsp"%>


	<c:choose>
	    <c:when test="${not empty returnSearchList}">
	    	<!-- 왕복일 경우 -->
	        <c:forEach items="${returnSearchList}" var="flight">
			        <div>
						<div>
							<ul>
								<li>
									<div>
										<div>
											<div>
												<span>
													<img src="${ flight.LOGO }" style="width: 150px; height: 150px;" alt="logo">
												</span>
												<span>
													<em>${ flight.AIRLINE_NAME }</em>
												</span>
												<span>
													<span>
														<span>${ flight.START_TIME }
															<em>${ flight.DEPCITY_ENAME }
																<span>
																	<span>
																		<span>${ flight.DEPCITY_NAME }</span>
																	</span>
																</span>
															</em>
														</span>
													</span>
												</span>
												<span>
													<span>→</span>
													<em>${ flight.DURATIONHOUR }시간 ${ flight.DURATIONMINUTE }분</em>
												</span>
												<span>
													<span>
														<span>${ flight.END_TIME }</span>
													</span>
													<span>
														<em>${ flight.ARRCITY_ENAME }
															<span>
																<span>
																	<span>${ flight.ARRCITY_NAME }</span>
																</span>
															</span>
														</em>
													</span>
												</span>
												<span>직항</span>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
	        </c:forEach>
	    </c:when>
	    <c:otherwise>
	        <!-- 편도일 경우 -->
	        <c:forEach items="${airSearchList}" var="flight">
			        <div>
						<div>
							<ul>
								<li>
									<div>
										<div>
											<div>
												<span>
													<img src="${ flight.LOGO }" style="width: 150px; height: 150px;" alt="logo">
												</span>
												<span>
													<em>${ flight.AIRLINE_NAME }</em>
												</span>
												<span>
													<span>
														<span>${ flight.START_TIME }
															<em>${ flight.DEPCITY_ENAME }
																<span>
																	<span>
																		<span>${ flight.DEPCITY_NAME }</span>
																	</span>
																</span>
															</em>
														</span>
													</span>
												</span>
												<span>
													<span>→</span>
													<em>${ flight.DURATIONHOUR }시간 ${ flight.DURATIONMINUTE }분</em>
												</span>
												<span>
													<span>
														<span>${ flight.END_TIME }</span>
													</span>
													<span>
														<em>${ flight.ARRCITY_ENAME }
															<span>
																<span>
																	<span>${ flight.ARRCITY_NAME }</span>
																</span>
															</span>
														</em>
													</span>
												</span>
												<span>직항</span>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
	        </c:forEach>
	    </c:otherwise>
	</c:choose>
<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>