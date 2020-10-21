<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>EverGreenBook Adminstration</title>
	<link rel="stylesheet" href="../css/admin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
    <!--wrapper start-->
    <div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
	
		<!--main container start-->
		<div class="main-container">
		    <div class="wrapper1">
		        <div class="func-group">
		            <div>
		                <button id="btn-newBook" class="add-btn">New Book</button>
		            </div>
		            <div>
		                <button id="btn-newUser" class="add-btn">New User</button>
		            </div>
		            <div>
		                <button id="btn-newCategory" class="add-btn">New Category</button>
		            </div>
		            <div>
		                <button id="btn-newCustomer" class="add-btn">New Customer</button>
		            </div>
		        </div>
		    </div>
		    <h3>Recent Sales</h3>
		    <div class="page-wrapper">
		        <div>
		            <table class="tablelist">
		                <tr>
		                    <th>Id</th>
		                    <th>Order By</th>
		                    <th>Quantity</th>
		                    <th>Total</th>
		                    <th>Payment Method</th>
		                    <th>Status</th>
		                    <th>Order Date</th>
		                </tr>
		                <c:forEach var="order" items="${listMostRecentSales}" varStatus="status">
		                    <tr class="even">
		                        <td><a href="view_order?id=${order.orderId}">${order.orderId}</a></td>
		                        <td>${order.customer.fullname}</td>
		                        <td>${order.bookCopies}</td>
		                        <td><fmt:formatNumber value="${order.total}" type="currency" /></td>
		                        <td>${order.paymentMethod}</td>
		                        <td>${order.status}</td>
		                        <td>${order.orderDate}</td>
		                    </tr>
		                </c:forEach>
		            </table>
		        </div>
		    </div>
		    <h3>Recent Reviews</h3>
		    <div class="page-wrapper">
		        <div>
		            <table class="tablelist">
		                <tr>
		                    <th>No</th>
		                    <th>Book</th>
		                    <th>Rating</th>
		                    <th>Headline</th>
		                    <th>Customer</th>
		                    <th>Review On</th>
		                </tr>
		                <c:forEach var="review" items="${listMostRecentReviews}" varStatus="status">
		                    <tr class="even">
		                        <td>${status.index +1}</td>
		                        <td>${review.book.title}</td>
		                        <td>${review.rating}</td>
		                        <td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
		                        <td>${review.customer.fullname}</td>
		                        <td><fmt:formatDate pattern="MM/dd/yyyy" value='${review.reviewTime}' /></td>
		                    </tr>
		                </c:forEach>
		            </table>
		        </div>
		    </div>
		    <h3>Statistics</h3>
		    <div class="page-wrapper">
		        <div class="statis">
		            <div>
		                <span>Total Users: ${totalUser}</span>
		            </div>
		            <div>
		                <span>Total Books: ${totalBook}</span>
		            </div>
		            <div>
		                <span>Total Customers: ${totalCustomer}</span>
		            </div>
		            <div>
		                <span>Total Reviews: ${totalReview}</span>
		            </div>
		            <div>
		                <span>Total Orders: ${totalOrder}</span>
		            </div>
		        </div>
		    </div>
		</div>
		<!--main container end-->
	</div>
    <!--wrapper end-->
    
	<script type="text/javascript">
        $(document).ready(function () {
			$("#btn-newBook").click(function() {
				window.location = 'new_book';
			});

			$("#btn-newUser").click(function() {
				window.location = 'user_form.jsp';
			});

			$("#btn-newCategory").click(function() {
				window.location = 'category_form.jsp';
			});

			$("#btn-newCustomer").click(function() {
				window.location = 'new_customer';
			});
     	
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });

        });
    </script>	
</body>
</html>