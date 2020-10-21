<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Review</title>
	<link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <!-- library rich text -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/richtext.min.css">
    <script src="../js/jquery.richtext.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>

		<!--main container start-->
		<div class="main-container">
		    <div class="wrapper1">
		        <div class="func-group">
		            <h3>Edit Review</h3>
		        </div>
		        <div class="page-wrapper">
		            <fieldset class="fieldset">
		                <legend class="legend">
		                    <img class="img"
		                        src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                        alt="">
		                </legend>
		                <div class="table-form">
		                	<form action="update_review" method="post" id="reviewForm">
        						<input type="hidden" name="reviewId" value="${review.reviewId}" />

		                        <table>
		                            <tr>
		                                <td><span>Book</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" value="${review.book.title}" readonly>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Rating</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="number" value="${review.rating}" readonly>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Customer</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" value="${review.customer.fullname}" readonly>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>HeadLine</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" name="headline" id="headline" size="20" value="${review.headline}" placeholder="Headline or summary for your review(required)" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Details (optional)</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <div class="review-content">
		                                        <textarea rows="5" cols="70" name="comment" id="comment" required>${review.comment}</textarea>
		                                    </div>
		                                </td>
		                            </tr>
		                            <tr></tr>
		                            <tr>
		                                <td>
		                                    <div class="btn-group">
		                                        <div>
		                                            <button class="btn btn-green" type="submit" id="submit">Save</button>
		                                        </div>
		                                        <div>
		                                            <button class="btn btn-white" type="button" id="cancel">Cancel</button>
		                                        </div>
		                                    </div>
		                                </td>
		                            </tr>
		                        </table>
		                    </form>
		                </div>
		            </fieldset>
		        </div>
		    </div>
		</div>
		<!--main container end-->
	</div>
	
	<script>
        $('#comment').richText();
            
		$(document).ready(function(){
			$("#cancel").click(function(){
				history.go(-1);
			});
			

            $(".sidebar-btn").click(function () {
                $(".wrapper").toggleClass("collapse");
            });
		});
	</script>
</body>
</html>