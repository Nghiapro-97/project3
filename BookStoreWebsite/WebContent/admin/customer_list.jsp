<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Customer - EverGreenBook Admin</title>
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
		            <button class="add-btn" id="btn-newCustomer">New Customer</button>
		        </div>
		    </div>
		    <div class="center">
		        <c:if test="${message != null}">
		            <h5 class="message">${message}</h5>
		        </c:if>
		    </div>		    
		    <h3>Manager Customer</h3>
		    <div class="page-wrapper">
		        <table class="tablelist">
		            <tr>
		                <th>Index</th>
		                <th>Id</th>
		                <th>Email</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>City</th>
		                <th>Country</th>
		                <th>Register Date</th>
		                <th>Action</th>
		            </tr>
		            <c:forEach var="customer" items="${listCustomers}" varStatus="status">
		                <tr class="even">
		                    <td>${status.index +1}</td>
		                    <td>${customer.customerId}</td>
		                    <td>${customer.email}</td>
		                    <td>${customer.firstname}</td>
		                    <td>${customer.lastname}</td>
		                    <td>${customer.city}</td>
		                    <td>${customer.countryName}</td>
		                    <td>
		                        <fmt:formatDate pattern="MM/dd/yyyy" value='${customer.registerDate}' />
		                    </td>
		                    <td>
		                        <div class="action-group">
		                            <div>
		                                <a href="edit_customer?id=${customer.customerId}" class="edit-btn">Edit</a>
		                            </div>
		                            <div>
		                                <a href="javascript:void(0);" class="deleteLink" id="${customer.customerId}">Delete</a>
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
	
	<script>
		$(document).ready(function(){
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					customerId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the customer with id ' + customerId + '?')){
						window.location = 'delete_customer?id=' + customerId;
					}
				});
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