<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${book.title}</title>
	<link rel="stylesheet" href="css/index.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>

	<div class="wrapper" id="top">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="main-container">
			<!--start aside-->
			<div class="aside">
			</div>
			<!--end aside-->
			<!--start page main-->
			<div class="page-wrapper">
				<div class="book-detail">
					<div class="img-book">
						<img class="img1" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" />
					</div>
					<div class="info">
						<span class="item_row book-title title-detail">${book.title}</span>
						<span class="item_row book-author author-detail">by ${book.author} (author)</span>

						<div class="item_row">
							<div class="item_col">
								<span class="book-ratting">
									<jsp:directive.include file="book_rating.jsp" />
								</span>
							</div>
							<div class="item_col">
								<a href="">${fn:length(book.reviews)} ratings</a>
							</div>
						</div>

						<div class="item_row book-price price-detail price-btnadd">
							<span class="price"> <fmt:formatNumber
									value="${book.price}" type="currency" /></span>
							<button class="fas fa-shopping-cart submit" id="btn_addToCart">
								&emsp;<span>Add to Cart</span>
							</button>
						</div>
						<div class="item_row book-description">
							<div class="descript">
								<p>${book.description}</p>
							</div>
                            <i class="item_col fas fa-chevron-left" style="font-size: 10px; margin-top: 14px;"></i>
                            <a href="javascript:void();" class="item_col readMore-btn">read more</a>
						</div>
					</div>
				</div>
				
				<div class="item_row book-same">
					<!--post slider-->
	                <div class="post-slider">
	                    <h2 class="slider-title">
	                        New Book <a href="" class="see-more">See more <i class="fas fa-chevron-right"></i></a>
	                    </h2>
	                    <i class="fas fa-chevron-left prev prev1"></i>
	                    <i class="fas fa-chevron-right next next1"></i>
	                    <div class="post-wrapper post-wrapper1">
	                        <c:forEach items="${listNewBooks}" var="book">
	                            <jsp:directive.include file="book_group.jsp" />
	                        </c:forEach>
	                    </div>
	                </div>
					<!--end post slider-->
				</div>
				
				<div class="review-ratting">
					<div class="sum-ratting">
						<h2 class="item_row">Customer Reviews</h2>
						<span class="item_row book-ratting"> 
							<jsp:directive.include file="book_rating.jsp"/>						
						</span> 
						<span class="item_row number-ratting"><a href="">${fn:length(book.reviews)} customer ratings</a></span>
						<table>
							<tr>
								<td class="col-1"><a href="">5 star</a></td>
								<td class="col-2">
									<div class="progress">
										<div class="progress-bar bg-primary" role="progressbar"
											aria-valuenow="${rating5}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td class="col-3"><a href=""> ${rating5}%</a></td>
							</tr>
							<tr>
								<td class="col-1"><a href="">4 star</a></td>
								<td class="col-2">
									<div class="progress">
										<div class="progress-bar bg-primary" role="progressbar"
											aria-valuenow="${rating4}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td class="col-3"><a href=""> ${rating4}%</a></td>
							</tr>
							<tr>
								<td class="col-1"><a href="">3 star</a></td>
								<td class="col-2">
									<div class="progress">
										<div class="progress-bar bg-primary" role="progressbar"
											aria-valuenow="${rating3}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td class="col-3"><a href=""> ${rating3}%</a></td>
							</tr>
							<tr>
								<td class="col-1"><a href="">2 star</a></td>
								<td class="col-2">
									<div class="progress">
										<div class="progress-bar bg-primary" role="progressbar"
											aria-valuenow="${rating2}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td class="col-3"><a href=""> ${rating2}%</a></td>
							</tr>
							<tr>
								<td class="col-1"><a href="">1 star</a></td>
								<td class="col-2">
									<div class="progress">
										<div class="progress-bar bg-primary" role="progressbar"
											aria-valuenow="${rating1}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td class="col-3"><a href=""> ${rating1}%</a></td>
							</tr>
						</table>

						<div class="item_row ratting-detail"> 
							<i class="item_col fa fa-chevron-down" style="font-size: 10px; margin-top: 10px;"></i> 
							<a href="javascript:void();" class="item_col calculated-btn">How are ratings calculated?</a>
							<p>To calculate the overall star rating and percentage
								breakdown by star, we don't use a simple average. Instead, our
								system considers things like how recent a review is and if the
								reviewer bought the item on Amazon. It also analyzes reviews to
								verify trustworthiness.</p>
						</div>
						<div class="write-review">
							<h4 class="item_row">Review this product</h4>
							<p class="item_row">Share your thoughts with other customers</p>
							<button type="button" class="item_row review-btn" id="btn_writeRevie">Write a customer review</button>
						</div>
					</div>
					<div class="review">
						<c:forEach items="${book.reviews}" var="review">
							<ul>
								<li>
									<div class="item_row user1">
										<div class="profile-avata">
											<img class="img"
												src="https://qxz0lg.sn.files.1drv.com/y4mSmTm0Jl-BE4Z6NwJoNrVDr27zMECjV84fEUubymGGAwrJw1Wn7ckANtrheEn2XB1jASppI6RnzS2FCeiCA6LtdCJrFl9agDpAqF9dp2daeP0Ts-oyERoJF8AX6LLFeZcLRRj8A-L5gMm-9ah5TAhr9JcJeMx6yZfKcM6aHvE3zKlj4F461c58_QQloMz4T5X69ALfAWdhEZZPysvi9EmYA?width=168&height=168&cropmode=none"
												alt="">
										</div>
										<div class="profile-content">
											<span>${review.customer.fullname}</span>
										</div>
									</div>
								</li>
								<li>
									<div class="item_row rating-healine">
										<div class="rating">
											<c:forTokens items="${review.stars}" delims="," var="star">
												<c:if test="${star eq 'on'}">
													<img alt="stars" src="images/rating_on.png">
												</c:if>
												<c:if test="${star eq 'off'}">
													<img alt="stars" src="images/rating_off.png">
												</c:if>
											</c:forTokens>
										</div>
										<div class="review-healine">
											<span>${review.headline}</span>
										</div>
									</div>
								</li>
								<li><span class="item_row review-date">Review on
										${review.reviewTime}</span></li>
								<li><span class="item_row verifyed">Verified
										Purchase</span></li>
								<li><span class="item_row review-content">${review.comment}</span></li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--end page main-->
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
        /*---start read more and less---*/
        $(".readMore-btn").on('click', function () {
            $(this).parent().toggleClass("showContent");
            var replaceText;
            if ($(this).parent().hasClass("showContent")) {
                replaceText = "read less";
                $('.book-description .fa-chevron-left').removeClass('fa-chevron-left').addClass('fa-chevron-right');
            } else {
                replaceText = "read more";
                $('.book-description .fa-chevron-right').removeClass('fa-chevron-right').addClass('fa-chevron-left');
            }
            //var replaceText = $(this).parent().hasClass("showContent") ? "read less" : "read more";
            $(this).text(replaceText);

        });
        $(".calculated-btn").on('click', function () {
            $(this).parent().toggleClass("showContent");
            if ($(this).parent().hasClass("showContent")) {
                $('.ratting-detail .fa-chevron-down').removeClass('fa-chevron-down').addClass('fa-chevron-up');
            } else {
                $('.ratting-detail .fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
            }
            //var replaceText = $(this).parent().hasClass("showContent") ? "read less" : "read more";
        });
        /*---end read more and less---*/

        function topFunction() {
            document.body.scrollTop = 0; // For Safari
            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
        };

        $(document).ready(function () {
        	/*---end read more and less---*/
			$("#btn_writeRevie").click(function() {
				window.location = 'write_review?book_id=' + ${book.bookId};
			});
			
			$("#btn_addToCart").click(function() {
				window.location = 'add_to_cart?book_id=' + ${book.bookId};
			});
        	
            $('.post-wrapper1').slick(
                {
                    slidesToShow: 5,
                    slidesToScroll: 5,
                    autoplay: false,
                    autoplaySpeed: 2000,
                    responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                            dots: true
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }],
                    nextArrow: $('.next1'),
                    prevArrow: $('.prev1'),
                });
        });
    </script>
    <script src="js/rating.js"></script>
    <!--slick carousel-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>