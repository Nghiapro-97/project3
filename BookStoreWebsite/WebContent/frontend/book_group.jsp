<div class="post">
	<figure>
		<a href="view_book?id=${book.bookId}"> 
			<img alt="imageBook"src="data:image/jpg;base64,${book.base64Image}" class="slider-img" />
		</a>
		<figcaption>
			<a href="view_book?id=${book.bookId}"><span class="book-title">${book.title}</span></a>
			<span class="book-author">by ${book.author}</span> 
			<span class="book-price">$${book.price}</span> 
			<span class="book-ratting">
				<jsp:directive.include file="book_rating.jsp" />
			</span>
		</figcaption>
	</figure>
</div>