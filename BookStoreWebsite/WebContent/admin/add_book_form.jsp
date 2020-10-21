<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Book To Order</title>
	<link rel="stylesheet" href="../css/admin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<!--wrapper start-->
	<div class="wrapper3">
	    <div>
	        <div class="func-group">
	            <h3>Add Book To Order ID: ${order.orderId}</h3>
	        </div>
	        <fieldset class="fieldset">
	            <legend class="legend">
	                <img class="img"
	                    src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
	                    alt="">
	            </legend>
	            <div class="table-form">
	                <form action="add_book_to_order" method="post">
	                    <table>
	                        <tr>
	                            <td>
	                                <label>Select A Book:</label>
	                                <select name="bookId">
	                                    <c:forEach items="${listBooks}" varStatus="status" var="book">
	                                        <option value="${book.bookId}">${book.title} - ${book.author}</option>
	                                    </c:forEach>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <label>Number Of Copies:</label>
	                                <input type="number" value="1" name="quantity">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="btn-group">
	                                    <div>
	                                        <button class="btn btn-green" type="submit">Add</button>
	                                    </div>
	                                    <div>
	                                        <button class="btn btn-white" type="button" onclick="javascript: self.close();">Cancel</button>
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
	<!--wrapper end-->
</body>
</html>