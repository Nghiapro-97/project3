<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Result for ${keyword} - Online Books Store</title>
	<link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper" id="top">
		<jsp:include page="header.jsp"></jsp:include>
		
		<!--main container start-->
		<div class="main-container">
		    <!--start aside-->
		    <div class="aside">
		    
		    </div>
		    <!--end aside-->
		    <c:if test="${fn:length(result) == 0}">
		        <h2 class="pageheading" align="center">No result for "${keyword}"</h2>
		    </c:if>
		    <c:if test="${fn:length(result) > 0}">
			     <div class="page-wrapper">
			        <div class="category-name">
	                   	<h3 class="title-level2">Result for "${keyword}" :</h3>
	               	</div>
		            <div class="table-listbook">
		                <table>
		                    <c:forEach items="${result}" var="book">
		                        <tr>
		                            <td class="border-bot col col1">
		                                <div class="book-img">
		                                    <a href="view_book?id=${book.bookId}">
		                                        <img class="slider-img" src="data:image/jpg;base64,${book.base64Image}" alt="">
		                                    </a>
		                                </div>
		                            </td>
		                            <td class="border-bot col2">
		                                <div class="book-info">
		                                    <div>
		                                        <span class="book-title">
		                                            <a href="view_book?id=${book.bookId}">${book.title}</a>
		                                        </span>
		                                        <span class="book-author"> by ${book.author}</span>
		                                    </div>
		                                    <div class="number-book">
		                                        <div class="item_row">
		                                            <div class="item_col">
		                                                <span class="book-ratting">
		                                                    <jsp:directive.include file="book_rating.jsp" />
		                                                </span>
		                                            </div>
		                                            <div class="item_col">
		                                                <span><a href="">${fn:length(book.reviews)} ratings</a></span>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="item_row book-price price-detail price-btnadd">
		                                        <span class="price"><fmt:formatNumber value="${book.price}" type="currency" /></span>
		                                        <button class="fas fa-shopping-cart submit" id="${book.bookId}" type="button">&emsp;<span>Add to Cart</span></button>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                    </c:forEach>
		                </table>
		            </div>
		        </div>
		    </c:if>
		</div>
		<!--main container end-->
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(document).ready(function () {	
			$(".submit").each(function(){
				$(this).on("click", function(){
					bookId=$(this).attr("id");
					window.location = 'add_to_cart?book_id=' + bookId;
				});
			});

		});
	</script>
</body>
</html>