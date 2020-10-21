<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>EverGreenBook</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:directive.include file="header.jsp"/>
		<div class="page-wrapper1">
			<div>
				<img src="https://prz0lg.sn.files.1drv.com/y4mkgAp-DYGtYawQ8bENrladt3vijss4u2igSa7K--Dt3rDkF5P7ZHLsVkQvcX2XZPk2e0-XlzVu5QJ-hQ8k3C2H2lmiv43tECAasyThx69_TDpkAL7NbpbQygUl2QK1FgWkKjIfLWL3Pr3zXu58UMV9I5ZJDUJJxsHsC1ukncaOiAmi91PmKgr4ja5lQj43qnDs4QsancKOgNFYb9jxL-Kgg?width=333&height=211&cropmode=none"
					alt="">
			</div>
			<div class="messages">
				<h2>${message}</h2>
				<a href="${pageContext.request.contextPath}/">Shop today's deals</a>
			</div>
		</div>
		
	
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>