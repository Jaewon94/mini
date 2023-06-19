<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:if test="${empty user}">
	<div class="frame">
		<div class="main">
			<div class="header">
				<div class="nickname">현재 유저 : ${user.userName }</div>
				<div class="logout">
					<a href="${cpath }/account/login.jsp"><button>로그인</button></a> <a
						href="${cpath }/account/join.jsp"><button>회원가입</button></a>
				</div>
			</div>
			<div class="body">
				<div class="logo">로고</div>
				<div class="search-wrap">
					<select name="category" id="category">
						<option value="음식" selected>음식</option>
						<option value="의류">의류</option>
						<option value="가전제품">가전제품</option>
						<option value="애완동물 용품">애완용품</option>
					</select> <input id="search" type="text" placeholder="검색어를 입력하세요">
				</div>
				<div class="btn">
					<div class="mypage"></div>
					<div class="basket"></div>
				</div>
			</div>
			<div class="nav">
				<h3>음식</h3>
				<h3>의류</h3>
				<h3>가전제품</h3>
				<h3>애완동물 용품</h3>
			</div>
		</div>
		<div class="side-banner"></div>
	</div>

</c:if>

<c:if test="${not empty user}">

	<div class="frame">
		<div class="main">
			<div class="header">
				<div class="nickname">현재 유저 : ${user.userName }</div>
				<div class="logout">
					<a href="${cpath }/account/logout.jsp"><button>로그아웃</button></a>
				</div>
			</div>
			<div class="body">
				<div class="logo">로고</div>
				<div class="search-wrap">
					<select name="category" id="category">
						<option value="음식" selected>음식</option>
						<option value="의류">의류</option>
						<option value="가전제품">가전제품</option>
						<option value="애완동물 용품">애완용품</option>
					</select> <input id="search" type="text" placeholder="검색어를 입력하세요">
				</div>
				<div class="btn">
					<div class="mypage"></div>
					<div class="basket"></div>
				</div>
			</div>
			<div class="nav">
				<h3>음식</h3>
				<h3>의류</h3>
				<h3>가전제품</h3>
				<h3>애완동물 용품</h3>
			</div>
		</div>
		<div class="side-banner"></div>
	</div>
</c:if>