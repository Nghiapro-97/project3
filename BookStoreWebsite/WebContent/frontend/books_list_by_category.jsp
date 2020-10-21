<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books in ${category.name} - Online book store</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	charset="utf-8"></script>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>

		<div class="main-container">
			<!--start aside-->
			<div class="aside">
			</div>
			<!--end aside-->
			<!--start list book by category-->
			<div class="page-wrapper">
				<div class="category-name">
					<h3 class="title-level2">${category.name}</h3>
				</div>
				<div class="table-listbook">
					<div class="row">
						<c:forEach items="${listBooks}" var="book" varStatus="status">
							<div class="column">
								<span class="id-book">${status.index +1}</span>
								<figure>
									<a href="view_book?id=${book.bookId}"> <img alt="imageBook"
										src="data:image/jpg;base64,${book.base64Image}"
										class="slider-img" />
									</a>
									<figcaption>
										<a href="view_book?id=${book.bookId}"><span
											class="book-title">${book.title}</span></a> <span
											class="book-author">by ${book.author}</span> <span
											class="book-price"><fmt:formatNumber
												value="${book.price}" type="currency" /></span> <span
											class="book-ratting"> <jsp:directive.include
												file="book_rating.jsp" />
										</span>
									</figcaption>
								</figure>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>