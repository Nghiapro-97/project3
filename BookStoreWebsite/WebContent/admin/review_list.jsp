<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Review - EverGreenBook Admin</title>
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
		    <h3>Manager Review</h3>
		    <div class="page-wrapper">
		        <table class="tablelist">
		            <tr>
		                <th>No</th>
		                <th>ID</th>
		                <th>Book</th>
		                <th>Rating</th>
		                <th>Headline</th>
		                <th>Customer</th>
		                <th>Review On</th>
		                <th>Action</th>
		            </tr>
		            <c:forEach var="review" items="${listReviews}" varStatus="status">
		                <tr class="even">
		                    <td>${status.index + 1}</td>
		                    <td>${review.reviewId}</td>
		                    <td>${review.book.title}</td>
		                    <td>${review.rating}</td>
		                    <td>${review.headline}</td>
		                    <td>${review.customer.fullname}</td>
		                    <td>
		                        <fmt:formatDate pattern="MM/dd/yyyy" value='${review.reviewTime}' />
		                    </td>
		                    <td>
		                        <div class="action-group">
		                            <div>
		                                <a href="edit_review?id=${review.reviewId}" class="edit-btn">Edit</a>
		                            </div>
		                            <div>
		                                <a href="javascript:void(0);)" class="deleteLink" id="${review.reviewId}">Delete</a>
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
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					reviewId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the review with id ' + reviewId + '?')){
						window.location = 'delete_review?id=' + reviewId;
					}
				});
			});
		});
	</script>
</body>
</html>