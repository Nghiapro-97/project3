<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Payment Receipt - Online Book Store</title>
	<link rel="stylesheet" href="../css/index.css">
</head>
<body onload="window.print();">
	<div class="wrapper">
		<!--main container start-->
		<div class="main-container">
			<jsp:directive.include file="receipt.jsp"/>
		</div>
		<!--main container end-->
	</div>
</body>
</html>