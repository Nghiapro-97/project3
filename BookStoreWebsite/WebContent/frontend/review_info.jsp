<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Customer Write Review</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <!-- library rich text -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/richtext.min.css">
    <script src="js/jquery.richtext.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="header.jsp"></jsp:include>

		<!--main container start-->
		<div class="main-container">
		    <!--start aside-->
		    <div class="aside">
		        <h5 class="title-level3">Popular in Books</h5>
		        <ul class="title-level4">
		            <li>
		                <a href="">award winner</a>
		            </li>
		            <li>
		                <a class="link" href="">award winner</a>
		            </li>
		            <li>
		                <a class="link" href="">award winner</a>
		            </li>
		            <li>
		                <a href="">award winner</a>
		            </li>
		            <li>
		                <a href="">award winner</a>
		            </li>
		        </ul>
		        <h5 class="title-level3">More in Books</h5>
		        <ul class="title-level4">
		            <li>
		                <a href="">award winner</a>
		            </li>
		            <li>
		                <a href="">award winner</a>
		            </li>
		            <li>
		                <a href="">award winner</a>
		            </li>
		            <li>
		                <a href="">award winner</a>
		            </li>
		            <li>
		                <a href="">award winner</a>
		            </li>
		        </ul>
		    </div>
		    <!--end aside-->
		    <!--start page main-->
		    <div class="page-wrapper">
		        <div class="category-name">
		            <h3 class="title-level2">Your already wrote a review for this book!</h3>
		        </div>
			        <div class="book-detail write-review">
			            <div class="img-book">
			                <img class="img1" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" />
			            </div>
			            <div class="info">
					        <form id="reviewForm">
			                <table>
			                    <tr class="cols cols1">
			                        <td>
			                            <span class="item_row book-title title-detail">${book.title}</span>
			                            <span class="item_row book-author author-detail">by ${book.author}</span>
			                        </td>
			                    </tr>
			                    <tr class="cols cols2">
			                        <td>
			                            <h4>--Select rating--</h4>
			                        </td>
			                    </tr>
			                    <tr class="cols cols3">
			                        <td>
			                            <div class="item_row">
			                                <div class="item_col">
			                                    <div class="book-ratting">
			                                        <div id="rateYo"></div>
			                                        <input type="hidden" name="rating" id="rating" />
			                                        <input type="hidden" name="bookId" value="${book.bookId}" />
			                                    </div>
			                                </div>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr class="cols cols4">
			                        <td>
			                            <div class="title">
			                                <span>Title or summary</span>
			                            </div>
			                            <div class="review-healine">
			                                <input type="text" name="headline" readonly="readonly" value="${review.headline}"/>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr class="cols cols5">
			                        <td>
			                            <div class="title">
			                                <span>Details (optional)</span>
			                            </div>
			                            <div class="review-content">
			                                <textarea name="comment" id="review" cols="70" rows="10" readonly="readonly">${review.comment}</textarea>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr class="cols cols6">
			                        <td>
			                        	<div class="btn-group">
				                            <div>
				                            </div>
			                        		<div>
			                        			<button class="btn btn-cancel" type="button" id="cancel">Cancel</button>
			                        		</div>
			                        	</div>
			                        </td>
			                    </tr>
			                </table>
					    	</form>		
			            </div>
			        </div>
		    </div>
		    <!--end page main-->
		</div>
		<!--main container end-->

        <jsp:include page="footer.jsp"></jsp:include>
    </div>	
	<script type="text/javascript">
		$(document).ready(function(){
	        $('#review').richText();

	        function topFunction() {
	            document.body.scrollTop = 0; // For Safari
	            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	        };
			
			$("#cancel").click(function(){
				history.go(-1);
			});
			
			$("#rateYo").rateYo({
				starWidth: "30px",
			    fullStar: true,
			    rating: ${review.rating},
			    readOnly: true
			});
		});
	</script>
</body>
</html>