<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }" >
	<form method="post">
		<p><input type="text" name="userId" placeholder="ID 입력" required autofocus></p>
		<p><input type="password" name="userPw" placeholder="PW 입력" required></p>
		<p><input type="text" name="userName" placeholder="이름 입력" required></p>
		<p><input type="email" name="email" placeholder="email 입력" required></p>
		<p><input type="text" name="pNum" placeholder="전화번호 입력 (-를 추가해 주세요)" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }" >
	<jsp:useBean id="input" class="account.AccountDTO" />
	<jsp:setProperty property="*" name="input"/>
	<jsp:setProperty property="ipaddr" value="${pageContext.request.remoteAddr}" name="input"/>
	
	<c:set var="result" value="${accountDAO.insert(input) }" />
	
	<c:if test="${result != 0 }">
		<script>
			alert('회원가입 성공');
			location.href='${cpath}/index.jsp';
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script>
			alert('회원가입 실패');
			history.go(-1);
		</script>
	</c:if>
</c:if>
</body>
</html>