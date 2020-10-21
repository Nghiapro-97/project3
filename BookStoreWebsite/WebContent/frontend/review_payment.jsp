<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Review payment - Online Book Store</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="header.jsp"></jsp:include>

		<!--main container start-->
		<div class="main-container">
		    <!--start list book by category-->
		    <div class="page-wrapper">
		        <div class="payreview">
		            <h4 class="center" style="color: red; padding: 10px 0;">please carefully review the following information before making
		                payment.</h4>
		            <div class="table-payreview">
		                <table>
		                    <tr>
		                        <th class="th item">Payer Information</th>
		                        <th class="th">Receipt Information</th>
		                    </tr>
		                    <tr>
		                        <td class="item">
		                            <div class="table-payerinf">
		                                <table>
		                                    <tr>
		                                        <td>
		                                            <th>First Name:</th>
		                                            <td class="border-bot">${payer.firstName}</td>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>
		                                            <th>Last Name:</th>
		                                            <td class="border-bot">${payer.lastName}</td>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>
		                                            <th>Email</th>
		                                            <td class="border-bot">${payer.email}</td>
		                                        </td>
		                                    </tr>
		                                </table>
		                            </div>
		                        </td>
		                        <td>
		                            <div class="table-receipinf">
		                                <table>
		                                    <tr>
		                                        <td>
		                                            <th>Receipt Name:</th>
		                                            <td class="border-bot">${recipient.recipientName}</td>
		                                        </td>
		                                        <td>
		                                            <th>State:</th>
		                                            <td class="border-bot">${recipient.state}</td>
		                                        </td>
		                                        <td>
		                                            <th>Postal Code</th>
		                                            <td class="border-bot">${recipient.postalCode}</td>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>
		                                            <th>Address Line 1:</th>
		                                            <td class="border-bot">${recipient.line1}</td>
		                                        </td>
		                                        <td>
		                                            <th>City:</th>
		                                            <td class="border-bot">${recipient.city}</td>
		                                        </td>
		                                        <td>
		                                            <th></th>
		                                            <td></td>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>
		                                            <th>Address Line 2:</th>
		                                            <td class="border-bot">${recipient.line2}</td>
		                                        </td>
		                                        <td>
		                                            <th>Country Code:</th>
		                                            <td class="border-bot">${recipient.countryCode}</td>
		                                        </td>
		                                        <td>
		                                            <th></th>
		                                            <td></td>
		                                        </td>
		                                    </tr>
		                                </table>
		                            </div>
		                        </td>
		                    </tr>
		                </table>
		            </div>
		        </div>
		        <div class="table-orderbook">
		            <table>
		                <tr class="border-bot">
		                    <th>No</th>
		                    <th>Name</th>
		                    <th>Quantity</th>
		                    <th>Price</th>
		                    <th>Subtotal</th>
		                </tr>
		                <c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
		                    <tr class="border-bot">
		                        <td class="col">${status.index + 1}</td>
		                        <td>
		                            <div class="thumbnail-title">
		                                <span>${item.name}</span>
		                            </div>
		                        </td>
		                        <td class="col">${item.quantity}</td>
		                        <td class="col"><fmt:formatNumber value="${item.price}" type="currency"/></td>
		                        <td class="col"><fmt:formatNumber value="${item.price * item.quantity}" type="currency"/></td>
		                    </tr>
		                </c:forEach>
		                <tr>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td class="total"><b>Total:</b></td>
		                    <td><b>${transaction.amount.details.subtotal}</b></td>
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
		                            <a href="javascript:void();" class="item_col total">Total(2 item): <fmt:formatNumber value="${transaction.amount.total}" type="currency" /></a>
		                            <div class="total-table">
		                                <table>
		                                    <tr>
		                                        <td>Sub total: </td>
		                                        <td><fmt:formatNumber value="${transaction.amount.details.subtotal}" type="currency" /></td>
		                                    </tr>
		                                    <tr>
		                                        <td>Tax: </td>
		                                        <td><fmt:formatNumber value="${transaction.amount.details.tax}" type="currency" /></td>
		                                    </tr>
		                                    <tr>
		                                        <td>Shipping Fee:</td>
		                                        <td><fmt:formatNumber value="${transaction.amount.details.shipping}" type="currency" /></td>
		                                    </tr>
		                                    <tr>
		                                        <td><b>Total:</b></td>
		                                        <td><b><fmt:formatNumber value="${transaction.amount.total}" type="currency" /></b></td>
		                                    </tr>
		                                </table>
		                            </div>
		                        </div>
		                    </td>
		                </tr>
		                <tr></tr>
		                <tr>
		                    <td>
		                        <form action="execute_payment" method="post">					
		                            <input type="hidden" name="paymentId" value="${param.paymentId}"/>			
		                            <input type="hidden" name="PayerID" value="${param.PayerID}"/>			
		                            <button type="submit">Pay Now</button>			
		                        </form>
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
		                        <img class="icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/mastercard.svg"
		                            alt="">
		                        <img class="icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/cash.svg"
		                            alt=""><br />
		                        <img class="icon"
		                            src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/internet-banking.svg" alt="">
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

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>