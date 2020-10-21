<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Book - EverGreenBook Admin</title>
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
		            <button id="btn-newBook" class="add-btn">New Book</button>
		        </div>
		    </div>
		    <div class="center">
		        <c:if test="${message != null}">
		            <h5 class="message">${message}</h5>
		        </c:if>
		    </div>		    
		    <h3>Manager Books</h3>
		    <div class="page-wrapper">
		        <table class="tablelist">
		            <tr>
		                <th>No</th>
		                <th>Id</th>
		                <th>Images</th>
		                <th>Title</th>
		                <th>Author</th>
		                <th>Category</th>
		                <th>Price</th>
		                <th>Last Update</th>
		                <th>Action</th>
		            </tr>
		            <c:forEach var="book" items="${listBooks}" varStatus="status">
		                <tr class="even">
		                    <td>${status.index +1}</td>
		                    <td>${book.bookId}</td>
		                    <td>
		                        <div class="img-book">
		                            <img class="img" src="data:image/jpg;base64,${book.base64Image}" alt="">
		                        </div>
		                    </td>
		                    <td>
		                        <div class="title-book">
		                            <span>${book.title}</span>
		                        </div>
		                    </td>
		                    <td>
		                        <span>${book.author}</span>
		                    </td>
		                    <td>
		                        <span>${book.category.name}</span>
		                    </td>
		                    <td>
		                        <span><fmt:formatNumber value="${book.price}" type="currency"/></span>
		                    </td>
		                    <td>
		                        <span><fmt:formatDate pattern="MM/dd/yyyy" value='${book.lastUpdateTime}' /></span>
		                    </td>
		                    <td>
		                        <div class="action-group">
		                            <div>
		                                <a href="edit_book?id=${book.bookId}" class="edit-btn">Edit</a>
		                            </div>
		                            <div>
		                                <a href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
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
			$("#btn-newBook").click(function() {
				window.location = 'new_book';
			});
			
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
			
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					bookId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the book with id ' + bookId + '?')){
						window.location = 'delete_book?id=' + bookId;
					}
				});
			});
		});
	</script>
</body>
</html>