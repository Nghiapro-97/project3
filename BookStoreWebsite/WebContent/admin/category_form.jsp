<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create New Category</title>
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
		            <c:if test="${category != null}">
		                <h3>Edit Category</h3>
		            </c:if>
		            <c:if test="${category == null}">
		                <h3>Create New Category</h3>
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
		                	<form method="post" name="categoryForm">
		                    	<input type="hidden" name="categoryId" value="${category.categoryId}" />	                 
			                    <table>
			                        <tr>
			                            <td><span>Name</span></td>
			                        </tr>
			                        <tr>
			                            <td>
			                                <input type="text" name="name" id="name" size="20" value="${category.name}" placeholder="Email" required>
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
			if (${category != null}) {
				document.categoryForm.action = "update_category";
			}else {
				document.categoryForm.action = "create_category";
			}
		};
	
		$(document).ready(function(){
			$("#cancel").click(function(){
				history.go(-1);
			});
			
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
		});
	</script>
</body>
</html>