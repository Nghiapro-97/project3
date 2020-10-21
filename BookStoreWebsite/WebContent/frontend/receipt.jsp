<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <div class="page-wrapper">
        <div class="payment-receipt">
            <div class="line">
                <h4 id="dates"></h4>
            </div>
            <div class="line info">
                <div class="seller-info">
                    <span class="item">Evergeen Book</span>
                    <span>Email: evergreen@gmail.com</span>
                    <span>Phone: +1 1234 567 891</span>
                </div>
                <div class="buyer-info">
                    <span class="item">Buyer</span>
                    <span>Sold To: ${payer.firstName} ${payer.lastName}</span>
                    <span>Email: ${payer.email}</span>
                </div>
            </div>
            <div class="table-paybook">
                <table>
                    <tr class="border-bot">
                        <th>No</th>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                    <c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
                        <tr class="border-bot">
                            <td class="col">${status.index + 1}</td>
                            <td>
                                <span>${item.name}</span>
                            </td>
                            <td class="col">${item.quantity}</td>
                            <td class="col"><fmt:formatNumber value="${item.price}" type="currency" /></td>
                            <td class="col"><fmt:formatNumber value="${item.price * item.quantity}" type="currency" /></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="subtotal">
                            <span>SubTotal:</span>
                            <span>Tax:</span>
                            <span class="border-bot">Shipping Fee:</span>
                            <span>Total:</span>
                        </td>
                        <td>
                            <span><fmt:formatNumber value="${transaction.amount.details.subtotal}" type="currency" /></span>
                            <span><fmt:formatNumber value="${transaction.amount.details.tax}" type="currency" /></span>
                            <span class="border-bot"><fmt:formatNumber value="${transaction.amount.details.shipping}" type="currency" /></span>
                            <span><fmt:formatNumber value="${transaction.amount.total}" type="currency" /></span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
	<script>
		function getDateReceipt() {
	        var d = new Date();
	        var str_date = d.toDateString();
	        document.getElementById("dates").innerHTML = "Receipt - " + str_date;
	    };
	    getDateReceipt();
	</script>