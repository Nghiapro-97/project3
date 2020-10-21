<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>My Order History - EverGreenBook</title>
	<link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		
		<!--main container start-->
		<div class="main-container">
		    <div class="form-page form-profile">
		        <fieldset>
		            <legend>
		                <img class="img"
		                    src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                    alt="">
		            </legend>
		            <div class="container">
		                <h2>Order History</h2>
		                <c:if test="${fn:length(listOrders) == 0}">
		                    <h3 class="center" style="margin: 150px 0;">You have not any placed orders!</h3>
		                </c:if>
		                
		                <c:if test="${fn:length(listOrders) != 0}">
		                    <div class="form-page table-orderhistory">
		                        <table>
		                            <tr class="border-bot">
		                                <th>Index</th>
		                                <th>Order ID</th>
		                                <th>Quantity</th>
		                                <th>Total Amount</th>
		                                <th>Order Date</th>
		                                <th>Status</th>
		                                <th></th>
		                            </tr>
		                            <c:forEach var="order" items="${listOrders}" varStatus="status">
		                                <tr class="border-bot">
		                                    <td class="col">${status.index + 1}</td>
		                                    <td class="col">${order.orderId}</td>
		                                    <td class="col">${order.bookCopies}</td>
		                                    <td class="cols"><span><fmt:formatNumber value="${order.total}" type="currency"/></span></td>
		                                    <td class="cols"><span>${order.orderDate}</span></td>
		                                    <td><span>${order.status}</span></td>
		                                    <td><a href="show_order_detail?id=${order.orderId}">Detail</a></td>
		                                </tr>
		                            </c:forEach>
		                        </table>
		                    </div>
		                </c:if>
		            </div>
		        </fieldset>
		    </div>
		</div>
		<!--main container end-->

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>