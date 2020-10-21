<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Shopping cart</title>
	<link rel="stylesheet" href="css/index.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:directive.include file="header.jsp"/>
	
		<form action="update_cart" method="post" id="cartForm">
		<!--main container start-->
		<div class="main-container">
		    <c:set var="cart" value="${sessionScope['cart']}"></c:set>
		    <c:if test="${cart.totalItems == 0}">
		        <jsp:directive.include file="empty_cart.jsp"/>
		    </c:if>
		    <c:if test="${cart.totalItems > 0}">
		        <!--start list book by category-->
		        <div class="page-wrapper">
		                <div class="table-shop">
		                    <h3 class="center title-level2">Shopping Cart</h3>
		                    <c:if test="${message != null}">
		                        <h6 class="center error"><i class="fas fa-cat"></i>&nbsp;${message}</h6>
		                    </c:if>
		                    <table>
		                        <tr class="border-bot">
		                            <th class="center">Item</th>
		                            <th></th>
		                            <th class="left">
		                                <div>
		                                    <span>Price</span>
		                                </div>
		                            </th>
		                            <th class="left">
		                                <div>
		                                    <span>Sub Total</span>
		                                </div>
		                            </th>
		                        </tr>
		                        <c:forEach items="${cart.items}" var="item" varStatus="status">
		                            <tr class="border-bot">
		                                <td class="right col1">
		                                    <div class="book-img">
		                                        <img alt="imageBook" src="data:image/jpg;base64,${item.key.base64Image}">
		                                    </div>
		                                </td>
		                                <td class="left col2">
		                                    <div class="book-info">
		                                        <div>
		                                            <span class="book-title">
		                                                <a href="">${item.key.title}</a>
		                                            </span>
		                                            <span class="book-author"> by ${item.key.author}</span>
		                                        </div>
		                                        <div class="number-book">
		                                            <label for="quantitys">Quantity: </label>
		                                            <input type="hidden" name="bookId" value="${item.key.bookId}"/>
		                                            <input type="number" id="quantitys" name="quantity${status.index + 1}" value="${item.value}"/>
		                                        </div>
		                                        <div>
		                                            <a href="remove_from_cart?book_id=${item.key.bookId}">Delete</a>
		                                        </div>
		                                    </div>
		                                </td>
		                                <td class="left col3"><fmt:formatNumber value="${item.key.price}" type="currency"/></td>
		                                <td class="left col3"><fmt:formatNumber value="${item.value * item.key.price}" type="currency"/></td>
		                            </tr>
		                        </c:forEach>
		                        <tr>
		                            <td class="col1"></td>
		                            <td class="right">
		                                <div class="col-sub">
		                                    <h5>Subtotal(${cart.totalQuantity} items):</h5>
		                                </div>
		                            </td>
		                            <td></td>
		                            <td class="left">
		                                <div class="col-sub">
		                                    <h4><b><fmt:formatNumber value="${cart.totalAmount}" type="currency"/></b></h4>
		                                </div>
		                            </td>
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
			                                <a href="javascript:void();" class="item_col total">Total(${cart.totalQuantity} items): <fmt:formatNumber value="${cart.totalAmount}" type="currency"/></a>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr></tr>
			                    <tr>
			                        <td>
			                            <div class="btn_fungroup">
			                                <button class="btn btn-update" type="submit" id="btn_update">Update</button>
			                                <button class="btn btn-clear" type="button" id="btn_clearCart">Clear cart</button>
			                                <button class="btn btn-checkout" type="button" id="btn_checkout">Proceed to checkout</button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <a href="${pageContext.request.contextPath}/" class="continue-shop">Continue Shopping</a>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <img class="icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/visa.svg"
			                                alt="">
			                            <img class="icon"
			                                src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/mastercard.svg" alt="">
			                            <img class="icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/cash.svg"
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
			  </c:if>
		</div>
		<!--main container end-->
		</form>
	
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_clearCart").click(function(){
				window.location = 'clear_cart';
			});
			
			$("#btn_checkout").click(function(){
				window.location = 'checkout';
			});
			
		});
	</script>
</body>
</html>