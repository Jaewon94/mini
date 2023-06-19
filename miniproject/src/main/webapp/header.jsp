<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="account.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="accountDAO" value="${AccountDAO.getInstance() }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mini project</title>
<style>
</style>
<link rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>


	