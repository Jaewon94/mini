<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }" >
	<form method="post">
		<p><input type="text" name="userId" placeholder="ID 입력" value="${cookie.userId.value }" required autofocus ></p> 
		<p><input type="password" name="userPw" placeholder="PW 입력" required ></p> 
		<p><label><input type="checkbox" name="storeId" 
						${not empty cookie.userId ? 'checked' : '' }>ID 저장하기</label></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST'}">
	<jsp:useBean id="input" class="account.AccountDTO" />
	<jsp:setProperty property="*" name="input"/>
	
	<c:set var="user" value="${accountDAO.login(input) }" scope="session"/>
	
	<%
		boolean flag1 = session.getAttribute("user") != null;
		boolean flag2 = request.getParameter("storeId") != null; 	
		
		Cookie c = new Cookie("userId", input.getUserId());
		c.setMaxAge(flag1 && flag2 ? 60 * 60 * 24 * 7 : 0);
		response.addCookie(c);
	%>
	
	<c:if test="${user == null }" >
		<script> 
			alert('로그인 실패');
			history.go(-1);
		</script>
	</c:if>
	
	<c:if test="${not empty user}" >
		<c:redirect url="/"></c:redirect>
	</c:if>

</c:if>

</body>
</html>