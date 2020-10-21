<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage User - EverGreenBook Admin</title>
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
		            <button id="btn-newUser" class="add-btn">New User</button>
		        </div>
		    </div>
		    <div class="center">
			    <c:if test="${message != null}">
			        <h5 class="message">${message}</h5>
			    </c:if>
		    </div>		    
		    <h3>Manager User</h3>
		    <div class="page-wrapper">
		        <table class="tablelist">
		            <tr>
		                <th>Index</th>
		                <th>Id</th>
		                <th>Email</th>
		                <th>Fullname</th>
		                <th>Action</th>
		            </tr>
		            <c:forEach var="user" items="${listUsers}" varStatus="status">
		                <tr class="even">
		                    <td>${status.index +1}</td>
		                    <td>${user.userId}</td>
		                    <td>${user.email}</td>
		                    <td>${user.fullName}</td>
		                    <td>
		                        <div class="action-group">
		                            <div>
		                                <a href="edit_user?id=${user.userId}" class="edit-btn">Edit</a>
		                            </div>
		                            <div>
		                                <a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete</a>
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
			$("#btn-newUser").click(function() {
				window.location = 'user_form.jsp';
			});
     	
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
			
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					userId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the user with id ' + userId + '?')){
						window.location = 'delete_user?id=' + userId;
					}
				});
			});
		});
	</script>
</body>
</html>