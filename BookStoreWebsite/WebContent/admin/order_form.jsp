<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Order - EverGreenBook Administration</title>
	<link rel="stylesheet" href="../css/admin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		
		<!--main container start-->
		<div class="main-container">
		    <div class="wrapper2">
		        <div class="func-group">
		            <h3>Edit Order ID: ${order.orderId}</h3>
		        </div>
		        <div class="center">
		            <c:if test="${message != null}">
		                <h5 class="message">${message}</h5>
		            </c:if>
		        </div>
		        <form action="update_order" method="post" id="orderForm">
		            <div class="page-wrapper2">
		                <fieldset class="fieldset">
		                    <legend class="legend">
		                        <img class="img"
		                            src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                            alt="">
		                    </legend>
		                    <div class="table-form">
		                        <div class="order-info">
		                            <div class="table-payInfo">
		                                <fieldset class="fieldset">
		                                    <legend>Payer Info</legend>
		                                    <table>
		                                        <tr>
		                                            <td>
		                                                <label>Order By:</label>
		                                                <input type="text" value="${order.customer.fullname}" readonly>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Order Date:</label>
		                                                <input type="text" value="<fmt:formatDate pattern=" MM/dd/yyyy"
		                                                    value='${order.orderDate}' />" readonly>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Payment Method</label>
		                                                <select name="paymentMethod">
		                                                    <option value="Cash On Delivery" <c:if
		                                                        test="${order.paymentMethod eq 'Cash On Delivery'}">
		                                                        selected='selected'</c:if>>Cash on delivery</option>
		                                                    <option value="paypal" <c:if
		                                                        test="${order.paymentMethod eq 'paypal'}">selected='selected'
		                                                        </c:if>>PayPal or Credit cart</option>
		                                                </select>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Status</label>
		                                                <select name="orderStatus">
		                                                    <option value="Processing" <c:if
		                                                        test="${order.status eq 'Processing'}">selected='selected'
		                                                        </c:if> >Processing</option>
		                                                    <option value="Shipping" <c:if test="${order.status eq 'Shipping'}">
		                                                        selected='selected'</c:if> >Shipping</option>
		                                                    <option value="Delivered" <c:if
		                                                        test="${order.status eq 'Delivered'}">selected='selected'</c:if>
		                                                        >Delivered</option>
		                                                    <option value="Completed" <c:if
		                                                        test="${order.status eq 'Completed'}">selected='selected'</c:if>
		                                                        >Completed</option>
		                                                    <option value="Cancel" <c:if test="${order.status eq 'Cancel'}">
		                                                        selected='selected'</c:if> >Cancel</option>
		                                                </select>
		                                            </td>
		                                        </tr>
		                                    </table>
		                                </fieldset>
		                            </div>
		                            <div class="table-receipInf">
		                                <fieldset class="fieldset">
		                                    <legend>Receipt Info</legend>
		                                    <table style="margin-bottom: 87px;">
		                                        <tr>
		                                            <td style="width: 25%;">
		                                                <label>First Name:</label>
		                                                <input type="text" name="firstname" id="firstname"
		                                                    value="${order.firstname}" required />
		                                            </td>
		                                            <td>
		                                                <label>Address Line 1:</label>
		                                                <input type="text" name="addressLine1" id="addressLine1"
		                                                    value="${order.addressLine1}" required />
		                                            </td>
		                                            <td style="width: 25%;">
		                                                <label>State:</label>
		                                                <input type="text" name="state" id="state" value="${order.state}"
		                                                    required />
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Last Name:</label>
		                                                <input type="text" name="lastname" id="lastname"
		                                                    value="${order.lastname}" required />
		                                            </td>
		                                            <td>
		                                                <label>Address Line 2:</label>
		                                                <input type="text" name="addressLine2" id="addressLine2"
		                                                    value="${order.addressLine2}" required />
		                                            </td>
		                                            <td>
		                                                <label>Country:</label>
		                                                <select name="country" id="country">
		                                                    <c:forEach items="${mapCountries}" var="country">
		                                                        <option value="${country.value}" 
		                                                        <c:if test='${order.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
		                                                    </c:forEach>
		                                                </select>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Phone Number:</label>
		                                                <input type="number" name="phone" id="phone" value="${order.phone}"
		                                                    required />
		                                            </td>
		                                            <td>
		                                                <label>City:</label>
		                                                <input type="text" name="city" id="city" value="${order.city}"
		                                                    required />
		                                            </td>
		                                            <td>
		                                                <label>Zip Code</label>
		                                                <input type="number" name="zipcode" id="zipcode"
		                                                    value="${order.zipcode}" required />
		                                            </td>
		                                        </tr>
		                                    </table>
		                                </fieldset>
		                            </div>
		                        </div>
		                        <div class="table-orderbook">
		                            <table>
		                                <tr class="border-bot">
		                                    <th>Index</th>
		                                    <th>Book Title</th>
		                                    <th>Author</th>
		                                    <th>Price</th>
		                                    <th>Quantity</th>
		                                    <th>Subtotal</th>
		                                    <th></th>
		                                </tr>
		                                <c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
		                                    <tr class="border-bot">
		                                        <td class="col">${status.index + 1}</td>
		                                        <td class="col">${orderDetail.book.title}</td>
		                                        <td class="col">${orderDetail.book.author}</td>
		                                        <td class="col">
		                                            <input type="hidden" name="price" value="${orderDetail.book.price}" />
		                                            <fmt:formatNumber value="${orderDetail.book.price}" type="currency" />
		                                        </td>
		                                        <td class="col">
		                                            <input type="hidden" name="bookId" value="${orderDetail.book.bookId}" />
		                                            <input type="text" name="quantity${status.index + 1}"
		                                                value="${orderDetail.quantity}" />
		                                        </td>
		                                        <td class="col">
		                                            <fmt:formatNumber value="${orderDetail.subtotal}" type="currency" />
		                                        </td>
		                                        <td>
		                                            <a href="javascript:void(0);" class="deleteLink" id="${orderDetail.book.bookId}" >Remove</a>
		                                        </td>
		                                    </tr>
		                                </c:forEach>
		                                <tr>
		                                    <td></td>
		                                    <td></td>
		                                    <td></td>
		                                    <td><b>SubTotal</b></td>
		                                    <td><b><fmt:formatNumber value="${order.subtotal}" type="currency" /></b></td>
		                                </tr>
		                                <tr>
		                                    <td></td>
		                                    <td></td>
		                                    <td></td>
		                                    <td><b>Shipping Fee:</b></td>
		                                    <td><input type="text" size="4" value="${order.shippingFee}" name="shippingFee" id="shippingFee"/></td>
		                                </tr>
		                                <tr>
		                                    <td></td>
		                                    <td></td>
		                                    <td></td>
		                                    <td><b>Tax:</b></td>
		                                    <td><input type="text" value="${order.tax}" size="4" name="tax" id="tax"/></td>
		                                </tr>
		                                <tr>
		                                    <td></td>
		                                    <td></td>
		                                    <td></td>
		                                    <td class="total"><b>Total:</b></td>
		                                    <td><b><fmt:formatNumber value="${order.total}" type="currency" /></b></td>
		                                </tr>
		                            </table>
		                        </div>
		                        <div class="btn-group">
		                            <div>
		                                <button class="btn btn-green" type="button" id="btn-add">Add Book</button>
		                            </div>
		                            <div>
		                                <button class="btn btn-green" type="submit" id="submit">Save</button>
		                            </div>
		                            <div>
		                                <button class="btn btn-white" type="button" id="cancel">Cancel</button>
		                            </div>
		                        </div>
		                    </div>
		                </fieldset>
		            </div>
		        </form>
		    </div>
		</div>
		<!--main container end-->
	
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					bookId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the item book with id ' + bookId + '?')){
						window.location = 'remove_book_from_order?id=' + bookId;
					}
				});
			});

			
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
			
			$("#btn-add").click(function(){
				showAddBookTopUp();
			});
			
			$("#cancel").click(function(){
				window.location.href='list_orders';
			});
			
		});
		
		function showAddBookTopUp() {
			var width=600;
			var height=200;
			var left=(screen.width - width)/2;
			var top=(screen.height - height)/2;
			
			window.open('add_book_form', '_blank', 'width=' + width + ', heigh=' + height + ', top=' + top + ', left=' + left);
		};
	</script>
</body>
</html>