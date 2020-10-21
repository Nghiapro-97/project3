<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Book Store</title>
	<link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<div class="wrapper">
        <jsp:include page="header.jsp"></jsp:include>
	
		<c:if test="${message != null}">
		    <h4 class="center" style="color: red;"><i class="fas fa-cat"></i>&nbsp;${message}</h4>
		</c:if>
		
		<c:set var="cart" value="${sessionScope['cart']}"></c:set>
		<c:if test="${cart.totalItems == 0}">
		    <jsp:directive.include file="empty_cart.jsp" />
		</c:if>
		<c:if test="${cart.totalItems > 0}">
		    <form action="place_order" method="post" id="orderForm">
		        <!--main container start-->
		        <div class="main-container">
		            <!--start list book by category-->
		            <div class="page-wrapper">
		                <div class="table-receipInf">
		                    <h4 class="center">Receipt Information</h4>
		                    <table>
		                        <tr>
		                            <td style="width: 15%;">
		                                <label>First Name:</label>
		                                <input type="text" name="firstname" value="${loggedCustomer.firstname}" required="required" />
		                            </td>
		                            <td>
		                                <label>Address Line 1:</label>
		                                <input type="text" name="addressLine1" value="${loggedCustomer.addressLine1}" required="required" />
		                            </td>
		                            <td>
		                                <label>State:</label>
		                                <input type="text" name="state" value="${loggedCustomer.state}" required="required" />
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <label>Last Name:</label>
		                                <input type="text" name="lastname" value="${loggedCustomer.lastname}" required="required" />
		                            </td>
		                            <td>
		                                <label>Address Line 2:</label>
		                                <input type="text" name="addressLine2" value="${loggedCustomer.addressLine2}" required="required" />
		                            </td>
		                            <td>
		                                <label>Country:</label>
		                                <select name="country" id="country">
		                                    <c:forEach items="${mapCountries}" var="country">
		                                        <option value="${country.value}" 
		                                        <c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
		                                    </c:forEach>
		                                </select>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <label>Phone Number:</label>
		                                <input type="number" name="phone" value="${loggedCustomer.phone}" required="required" />
		                            </td>
		                            <td>
		                                <label>City:</label>
		                                <input type="text" name="city" value="${loggedCustomer.city}" required="required" />
		                            </td>
		                            <td>
		                                <label>Zip Code</label>
		                                <input type="number" name="zipcode" value="${loggedCustomer.zipcode}" required="required" />
		                            </td>
		                        </tr>
		                    </table>
		                </div>
		                <div class="table-orderbook">
		                    <table>
		                        <tr class="border-bot">
		                            <th>No</th>
		                            <th>Book</th>
		                            <th>Author</th>
		                            <th>Price</th>
		                            <th>Quantity</th>
		                            <th>Subtotal</th>
		                        </tr>
		                        <c:forEach items="${cart.items}" var="item" varStatus="status">
		                            <tr class="border-bot">
		                                <td class="col">${status.index + 1}</td>
		                                <td>
		                                    <div style="display: flex;">
		                                        <div class="thumbnail-book">
		                                            <img class="img" src="data:image/jpg;base64,${item.key.base64Image}" alt="">
		                                        </div>
		                                        <div class="thumbnail-title">
		                                            <span>${item.key.title}</span>
		                                        </div>
		                                    </div>
		                                </td>
		                                <td class="col">
		                                    <span>${item.key.author}</span>
		                                </td>
		                                <td class="col"><fmt:formatNumber value="${item.key.price}" type="currency" /></td>
		                                <td class="col">${item.value}</td>
		                                <td class="col"><fmt:formatNumber value="${item.value * item.key.price}" type="currency" /></td>
		                            </tr>
		                        </c:forEach>
		                        <tr>
		                            <td></td>
		                            <td></td>
		                            <td></td>
		                            <td class="total"><b>Total:</b></td>
		                            <td><b>${cart.totalQuantity}</b></td>
		                            <td><b><fmt:formatNumber value="${cart.totalAmount}" type="currency" /></b></td>
		                        </tr>
		                    </table>
		                </div>
		            </div>
		            <!--end list book by category-->
		            <!--start aside-->
		            <div class="aside1">
		                <div class="payment">
		                    <div class="center border-bot">
		                        <h4>Payment</h4>
		                    </div>
		                    <table>
		                        <tr>
		                            <td>
		                                <div class="total-detail">
		                                    <a href="javascript:void();" class="item_col total">Total(${cart.totalQuantity} items): <fmt:formatNumber value="${total}" type="currency" /></a>
		                                    <div class="total-table">
		                                        <table>
		                                            <tr>
		                                                <td>Number of copies:</td>
		                                                <td>${cart.totalQuantity}</td>
		                                            </tr>
		                                            <tr>
		                                                <td>Sub total: </td>
		                                                <td><fmt:formatNumber value="${cart.totalAmount}" type="currency" /></td>
		                                            </tr>
		                                            <tr>
		                                                <td>Tax: </td>
		                                                <td><fmt:formatNumber value="${tax}" type="currency" /></td>
		                                            </tr>
		                                            <tr>
		                                                <td>Shipping Fee:</td>
		                                                <td><fmt:formatNumber value="${shippingFee}" type="currency" /></td>
		                                            </tr>
		                                            <tr>
		                                                <td><b>Total:</b></td>
		                                                <td><b><fmt:formatNumber value="${total}" type="currency" /></b></td>
		                                            </tr>
		                                        </table>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr></tr>
		                        <tr>
		                            <td><i>Choose your payment method:</i></td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <select name="paymentMethod">
		                                    <option value="Cash On Delivery">Cash On Delivery</option>
		                                    <option value="paypal">PayPal or Credit cart</option>
		                                </select>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <button type="button" id="btn_editorder">Edit Order</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <button type="submit" id="btn_placeorder">Place Order</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <a href="${pageContext.request.contextPath}/" class="continue-shop">Continue Shopping</a>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                <img class="icon"
		                                    src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/visa.svg" alt="">
		                                <img class="icon"
		                                    src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/mastercard.svg"
		                                    alt="">
		                                <img class="icon"
		                                    src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/cash.svg"
		                                    alt=""><br />
		                                <img class="icon"
		                                    src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/internet-banking.svg"
		                                    alt="">
		                                <img class="icon"
		                                    src="https://abcpcw.sn.files.1drv.com/y4mUpqGKZMPmXD9rxWVkv8EPp_J32__F6w73JgyRor2bOUE1rcTMVBv2AHrAyhyXNv2QI-7fLT8H-fTXQ2RwQUKbsPBEBBuSaxszAx_WsV2-GkjJl3VTlPcx02T_yT6h7lKw18YKiAQ_wZizIc2H4f-r0OzMbdQxgNBJ7_exlhZMJ7BvHFsvhHTnKx0p--Xsnc2xBLTvq4zCYtKuSZLOZGuXQ?width=101&height=68&cropmode=none"
		                                    alt="">
		                            </td>
		                        </tr>
		                    </table>
		                </div>
		            </div>
		            <!--end aside-->
		        </div>
		        <!--main container end-->
		    </form>
		</c:if>
	      
	    <jsp:include page="footer.jsp"></jsp:include>
    </div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_editorder").click(function(){
				window.location = 'view_cart';
			});
			
		});
	</script>
</body>
</html>