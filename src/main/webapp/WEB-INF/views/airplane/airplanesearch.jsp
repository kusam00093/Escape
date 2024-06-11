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

	<c:forEach items="${airSearchList}" var="airSearchList">
	<div>
		<div>
			<ul>
				<li>
					<div>
						<div>
							<div>
								<span>
									<img src="${ airSearchList.LOGO }" alt="logo">
								</span>
								<span>
									<em>${ airSearchList.AIRPORT_NAME }</em>
								</span>
								<span>
									<span>
										<span>${ airSearchList.START_TIME }
											<em>${ airSearchList.DEPCITY_ENAME }
												<span>
													<span>
														<span>${ airSearchList.DEPCITY_NAME }</span>
													</span>
												</span>
											</em>
										</span>
									</span>
								</span>
								<span>
									<span>→</span>
									<em>${ firstFlight.DURATIONHOUR }시간 ${ firstFlight.DURATIONMINUTE }분</em>
								</span>
								<span>
									<span>
										<span>${ airSearchList.END_TIME }</span>
									</span>
									<span>
										<em>${ airSearchList.ARRCITY_ENAME }
											<span>
												<span>
													<span>${ airSearchList.ARRCITY_NAME }</span>
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

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>