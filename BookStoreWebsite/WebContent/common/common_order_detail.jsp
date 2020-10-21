<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--main container start-->
<div class="main-container">
    <!--start list book by category-->
    <div class="page-wrapper">
        <div class="table-receipInf">
            <h4 class="center">Receipt Information</h4>
            <table>
                <tr>
                    <td>
                        <th>First Name:</th>
                        <td class="border-bot">${order.firstname}</td>
                    </td>
                    <td>
                        <th>Address Line 1:</th>
                        <td class="border-bot">${order.addressLine1}</td>
                    </td>
                    <td>
                        <th>State:</th>
                        <td class="border-bot">${order.state}</td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <th>Last Name:</th>
                        <td class="border-bot">${order.lastname}</td>
                    </td>
                    <td>
                        <th>Address Line 2:</th>
                        <td class="border-bot">${order.addressLine2}</td>
                    </td>
                    <td>
                        <th>Country:</th>
                        <td class="border-bot">${order.countryName}</td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <th>Phone Number:</th>
                        <td class="border-bot">${order.phone}</td>
                    </td>
                    <td>
                        <th>City:</th>
                        <td class="border-bot">${order.city}</td>
                    </td>
                    <td>
                        <th>Zip Code</th>
                        <td class="border-bot">${order.zipcode}</td>
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
                        <td class="col"><fmt:formatNumber value="${orderDetail.book.price}" type="currency" /></td>
                        <td class="col">${orderDetail.quantity}</td>
                        <td class="col"><fmt:formatNumber value="${orderDetail.subtotal}" type="currency" /></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="total"><b>Total:</b></td>
                    <td><b>${order.bookCopies}</b></td>
                    <td><b><fmt:formatNumber value="${order.subtotal}" type="currency" /></b></td>
                </tr>
            </table>
        </div>
    </div>
    <!--end list book by category-->
    <!--start aside-->
    <div class="aside1">
        <div class="Receipt">
            <div class="center border-bot">
                <h4>Order Overview</h4>
            </div>
            <table>
                <tr>
                    <th class="left">By:</th>
                    <td>${order.customer.fullname}</td>
                </tr>
                <tr>
                    <th class="left">Status:</th>
                    <td>${order.status}</td>
                </tr>
                <tr>
                    <th class="left">Date:</th>
                    <td>${order.orderDate}</td>
                </tr>
                <tr>
                    <th class="left">Payment:</th>
                    <td>${order.paymentMethod}</td>
                </tr>
                <tr>
                    <th class="left">Quantity:</th>
                    <td>${order.bookCopies}</td>
                </tr>
                <tr>
                    <th class="left">SubTotal:</th>
                    <td><fmt:formatNumber value="${order.subtotal}" type="currency" /></td>
                </tr>
                <tr>
                    <th class="left">Shipping Fee:</th>
                    <td><fmt:formatNumber value="${order.shippingFee}" type="currency" /></td>
                </tr>
                <tr>
                    <th class="left">Tax:</th>
                    <td><fmt:formatNumber value="${order.tax}" type="currency" /></td>
                </tr>
                <tr>
                    <th class="left">Total:</th>
                    <td><fmt:formatNumber value="${order.total}" type="currency" /></td>
                </tr>
            </table>
        </div>
    </div>
    <!--end aside-->
</div>
<!--main container end-->
