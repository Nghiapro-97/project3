<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Payment Receipt - Online Book Store</title>
	<link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="header.jsp"></jsp:include>

		<!--main container start-->
		<div class="main-container">
			<jsp:directive.include file="receipt.jsp"/>
		    <!--start aside-->
		    <div class="aside1">
		        <div class="payment">
		            <div class="center border-bot">
		                <h4>Payment</h4>
		            </div>
		            <table>
		                <tr></tr>
		                <tr>
		                    <td>
		                        <button type="button" onclick="javascript:ShowReceiptPopUp();">Print Receipt</button>
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
		</div>
		<!--main container end-->

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
	<script type="text/javascript">
		function ShowReceiptPopUp() {
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.width - width) / 2;
			
			window.open('frontend/print_receipt.jsp', '_blank', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
		};
	</script>
</body>
</html>