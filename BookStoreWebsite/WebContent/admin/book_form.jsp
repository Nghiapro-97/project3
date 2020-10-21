<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <!-- library rich text -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/richtext.min.css">
    <script src="../js/jquery.richtext.min.js"></script>
    <!-- library date time picker -->
	<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"rel = "stylesheet">
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
	
		<!--main container start-->
		<div class="main-container">
		    <div class="wrapper1">
		        <div class="func-group">
		            <c:if test="${book != null}">
		                <h3>Edit Book</h3>
		            </c:if>
		            <c:if test="${book == null}">
		                <h3>Create New Book</h3>
		            </c:if>
		        </div>
		        <div class="page-wrapper">
		            <fieldset class="fieldset">
		                <legend class="legend">
		                    <img class="img"
		                        src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                        alt="">
		                </legend>
		                <div class="table-form">
		                	<form method="post" id="bookForm" name="bookForm" enctype="multipart/form-data">
		                        <input type="hidden" name="bookId" value="${book.bookId}"/>		              
		                        <table>
		                            <tr>
		                                <td><span>Category</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <select name="category">
		                                        <c:forEach items="${listCategorys}" var="category">
		                                            <option value="${category.categoryId}" <c:if test="${category.categoryId eq book.category.categoryId}">selected='selected'</c:if>>
		                                            ${category.name}</option>
		                                        </c:forEach>
		                                    </select>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Title</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" maxlength="128" name="title" id="title" value="${book.title}" placeholder="Book title..." required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Author</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" maxlength="64" name="author" id="author" value="${book.author}" placeholder="Book author..." required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>ISBN</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="number" name="isbn" id="isbn" value="${book.isbn}" placeholder="ISBN..." required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Public Date</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" name="publishDate" id="publishDate" value="<fmt:formatDate pattern="MM/dd/yyyy" value='${book.publishDate}' />" placeholder="Public date..." required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Book Image</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="file" name="bookImage" id="bookImage" <c:if test="${book == null}">required='required'</c:if>/>
		                                    <img id="thumbnai" alt="image preview" style="width: 30%;" src="data:image/jpg;base64,${book.base64Image}">
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Price</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="number" step="0.01" min="0" name="price" id="price" value="${book.price}" placeholder="Price book..." required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Description</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <div class="review-content">
		                                        <textarea name="description" maxlength="16777215" id="description" cols="70" rows="10" required="required" >${book.description}</textarea>
		                                    </div>
		                                </td>
		                            </tr>
		                            <tr></tr>
		                            <tr>
		                                <td>
		                                    <div class="btn-group">
		                                        <div>
		                                            <button class="btn btn-green" type="submit" id="submit" onclick="return fun()">Save</button>
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

	<script type="text/javascript">
		function fun() {
			if (${book != null}) {
				document.bookForm.action = "update_book";
			}else {
				document.bookForm.action = "create_book";
			}
		};
	
        $('#description').richText({
        	maxlength: 16777215,
        });	
        	
		$(document).ready(function(){
			$("#publishDate").datepicker();
			
			$("#bookImage").change(function() {
				showImageThumbnai(this);
			});
			
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
			
			$("#cancel").click(function(){
				history.go(-1);
			});
								
			function showImageThumbnai(fileInput) {
				var file=fileInput.files[0];
				var reader=new FileReader();
				
				reader.onload = function (e) {
					$("#thumbnai").attr('src', e.target.result);
				};
				
				reader.readAsDataURL(file);
			};
		});
	
	</script>
</body>
</html>