<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Order Detail - EverGreenBook Admin</title>
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
		            <div>
		                <button class="add-btn" id="btn-edit">Edit Order</button>
		            </div>
		            <div>
		                <button class="add-btn" id="btn-delete">Delete Order</button>
		            </div>
		            <div>
		                <button class="add-btn" id="cancel">Cancel</button>
		            </div>
		        </div>
		        <div class="center">
		            <c:if test="${message != null}">
		                <h5 class="message">${message}</h5>
		            </c:if>
		        </div>
		        <h3>Detail Of Order ID: ${order.orderId}</h3>
		        <fieldset class="fieldset">
		            <div class="page-wrapper2">
		                <div class="table-form">
		                    <div class="order-info table-receipInf">
		                        <fieldset class="fieldset">
		                            <legend>Receipt Info</legend>
		                            <table>
		                                <tr>
		                                    <td style="width: 25%;">
		                                        <label>First Name:</label>
		                                        <input type="text" value="${order.firstname}" readonly>
		                                    </td>
		                                    <td>
		                                        <label>Address Line 1:</label>
		                                        <input type="text" value="${order.addressLine1}" readonly>
		                                    </td>
		                                    <td style="width: 25%;">
		                                        <label>State:</label>
		                                        <input type="text" value="${order.state}" readonly>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <label>Last Name:</label>
		                                        <input type="text" value="${order.lastname}" readonly>
		                                    </td>
		                                    <td>
		                                        <label>Address Line 2:</label>
		                                        <input type="text" value="${order.addressLine1}" readonly>
		                                    </td>
		                                    <td>
		                                        <label>Country:</label>
		                                        <input type="text" value="${order.countryName}" readonly>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <label>Phone Number:</label>
		                                        <input type="number" value="${order.phone}" readonly>
		                                    </td>
		                                    <td>
		                                        <label>City:</label>
		                                        <input type="text" value="${order.city}" readonly>
		                                    </td>
		                                    <td>
		                                        <label>Zip Code</label>
		                                        <input type="number" value="${order.zipcode}" readonly>
		                                    </td>
		                                </tr>
		                            </table>
		                        </fieldset>
		                    </div>
		                    <div class="table-order-overview">
		                        <fieldset class="fieldset">
		                            <legend>Order Overview</legend>
		                            <div class="order-overview">
		                                <div class="table1">
		                                    <table>
		                                        <tr>
		                                            <td style="width: 25%;">
		                                                <label>Order By:</label>
		                                                <input type="text" value="${order.customer.fullname}" readonly>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Status:</label>
		                                                <input type="text" value="${order.status}" readonly>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Order Date</label>
		                                                <input type="text" value="<fmt:formatDate pattern="MM/dd/yyyy" value='${order.orderDate}'/>" readonly>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label>Payment Method</label>
		                                                <input type="text" value="${order.paymentMethod}" readonly>
		                                            </td>
		                                        </tr>
		                                    </table>
		                                </div>
		                                <div class="table2">
		                                    <table>
		                                        <tr>
		                                            <td>
		                                                <label for="subtotal">Subtotal</label>
		                                            </td>
		                                            <td>
		                                                <span id="subtotal"><fmt:formatNumber value="${order.subtotal}" type="currency" /></span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label for="shipping">Shipping Fee</label>
		                                            </td>
		                                            <td>
		                                                <span id="Shipping"><fmt:formatNumber value="${order.shippingFee}" type="currency" /></span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td class="border-bot">
		                                                <label for="tax">Tax</label>
		                                            </td>
		                                            <td class="border-bot">
		                                                <span id="tax"><fmt:formatNumber value="${order.tax}" type="currency" /></span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td>
		                                                <label for="total">Total</label>
		                                            </td>
		                                            <td>
		                                                <span id="total"><fmt:formatNumber value="${order.total}" type="currency" /></span>
		                                            </td>
		                                        </tr>
		                                    </table>
		                                </div>
		                            </div>
		                        </fieldset>
		                    </div>
							<div class="table-orderbook">
							    <table>
							        <tr class="border-bot">
							            <th>No</th>
							            <th>Book</th>
							            <th>Author</th>
							            <th>Price</th>
							            <th>Quantity</th>
							            <th>SubTotal</th>
							        </tr>
							        <c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
							            <tr class="border-bot">
							                <td class="col">${status.index + 1}</td>
							                <td>
							                    <div style="display: flex;">
							                        <div class="thumbnail-book">
							                            <img class="img" src="data:image/jpg;base64,${orderDetail.book.base64Image}" alt="">
							                        </div>
							                        <div class="thumbnail-title">
							                            <span>${orderDetail.book.title}</span>
							                        </div>
							                    </div>
							                </td>
							                <td class="col">
							                    <span>${orderDetail.book.author}</span>
							                </td>
							                <td class="col">
							                    <fmt:formatNumber value="${orderDetail.book.price}" type="currency" />
							                </td>
							                <td class="col">${orderDetail.quantity}</td>
							                <td class="col">
							                    <fmt:formatNumber value="${orderDetail.subtotal}" type="currency" />
							                </td>
							            </tr>
							        </c:forEach>
							        <tr>
							            <td></td>
							            <td></td>
							            <td></td>
							            <td></td>
							            <td class="total"><b>SubTotal:</b></td>
							            <td><b><fmt:formatNumber value="${order.subtotal}" type="currency" /></b></td>
							        </tr>
							    </table>
							</div>
		                </div>
		            </div>
		        </fieldset>
		    </div>
		</div>
		<!--main container end-->
	</div>
	<script type="text/javascript">
	    $(".sidebar-btn").click( function () {
	        $(".wrapper").toggleClass("collapse");
	    });

		$("#btn-edit").click(function(){
			window.location.href='edit_order?id=${order.orderId}';
		});
		
		$("#cancel").click(function(){
			window.location.href='list_orders';
		});

		$("#btn-delete").each(function(){
			$(this).on("click", function(){
				if(confirm('Are you sure you want to delete the order with id ' + ${order.orderId} + '?')){
					window.location = 'delete_order?id=${order.orderId}';
				}
			});
		});

	
	</script>
</body>
</html>