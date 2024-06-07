<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="/"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<img id="headerlogo" src="/images/rocket.png" alt="제작예정">
		</a>
		<nav class="navbar navbar-light " style="background-color: #fff;">
			<div class="container-fluid">
				<form class="d-flex">
					<input class="form-control package_search_1" type="search"
						placeholder="검색어를 입력하세요" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">검색</button>
				</form>
			</div>
		</nav>


		<div class="col-md-3 text-end">
			<a type="button" class="btn btn-primary me-2" href="/LoginForm">로그인</a>
			<!-- <span class="" style="margin-right: 20px;">님 환영합니다. </span> -->
			<a type="button" class="btn btn-secondary" href="/Logout">로그아웃</a>

		</div>
	</header>
</div>