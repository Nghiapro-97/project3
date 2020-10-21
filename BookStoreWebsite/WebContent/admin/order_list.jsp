<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Book Orders Management- EverGreenBook Admin</title>
	<link rel="stylesheet" href="../css/admin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		
		<!--main container start-->
		<div class="main-container">
		    <div class="wrapper1">
		        <div class="func-group">
		        </div>
		    </div>
		    <div class="center">
		        <c:if test="${message != null}">
		            <h5 class="message">${message}</h5>
		        </c:if>
		    </div>		    
		    <h3>Manager Order</h3>
		    <div class="page-wrapper">
		        <table class="tablelist">
		            <tr>
		                <th>No</th>
		                <th>ID</th>
		                <th>Order By</th>
		                <th>Quantity</th>
		                <th>Total</th>
		                <th>Payment Method</th>
		                <th>Status</th>
		                <th>Order Date</th>
		                <th>Action</th>
		            </tr>
		            <c:forEach var="order" items="${listOrders}" varStatus="status">
		                <tr class="even">
		                    <td>${status.index + 1}</td>
		                    <td>${order.orderId}</td>
		                    <td>${order.customer.fullname}</td>
		                    <td>${order.bookCopies}</td>
		                    <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
		                    <td>${order.paymentMethod}</td>
		                    <td>${order.status}</td>
		                    <td>${order.orderDate}</td>
		                    <td>
		                        <div class="action-group">
		                            <div>
		                                <a href="view_order?id=${order.orderId}" class="edit-btn">Details</a>
		                            </div>
		                            <div>
		                                <a href="edit_order?id=${order.orderId}" class="edit-btn">Edit</a>
		                            </div>
		                            <div>
		                                <a href="javascript:void(0);)" class="deleteLink" id="${order.orderId}">Delete</a>
		                            </div>
		                        </div>
		                    </td>
		                </tr>
		            </c:forEach>
		        </table>
		    </div>
		</div>
		<!--main container end-->
	</div>
	<script type="text/javascript">
		$(document).ready(function(){	
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
			
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					orderId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the order with id ' + orderId + '?')){
						window.location = 'delete_order?id=' + orderId;
					}
				});
			});
		});
	</script>
</body>
</html>