<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Order Detail - EverGreenBook Customer</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		
		<c:if test="${order == null}">
			<h2 class="center">Sorry, you are not authorized to view this order! </h2>
		</c:if>
		
		<c:if test="${order != null}">
			<jsp:directive.include file="../common/common_order_detail.jsp"/>
		</c:if>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>