<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
		            <c:if test="${customer != null}">
		                <h3>Edit customer</h3>
		            </c:if>
		            <c:if test="${customer == null}">
		                <h3>Create New customer</h3>
		            </c:if>
		        </div>
		        <div class="page-wrapper">
		            <fieldset class="fieldset">
		                <legend class="legend">
		                    <img class="img"
		                        src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                        alt="">
		                </legend>

		                    <c:if test="${customer != null}">
						        <form action="update_customer" method="post" id="customerForm">
						        <input type="hidden" name="customerId" value="${customer.customerId}" />
						    </c:if>
						    <c:if test="${customer == null}">
						        <form action="create_customer" method="post" id="customerForm">
						    </c:if>

		                    <div class="tab table-form">
		                        <h4>Basic Info:</h4>
		                        <table>
		                            <tr>
		                                <td><span>First Name</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" id="firstName" value="${customer.firstname}" placeholder="First Name..." oninput="this.className = ''" name="firstName" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Last Name</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" id="lastName" value="${customer.lastname}" placeholder="Last Name..." oninput="this.className = ''" name="lastName" required>
		                                </td>
		                            </tr>
		                        </table>
		                    </div>
		                    <div class="tab table-form">
		                        <h4>Contact Info:</h4>
		                        <table>
		                            <tr>
		                                <td><span>Phone Number</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="number" name="phone" id="phone" value="${customer.phone}" placeholder="Phone Number..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Address Line 1</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" name="address1" id="address1" value="${customer.addressLine1}" placeholder="Address Line 1..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Address Line 2</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" name="address2" id="address2" value="${customer.addressLine2}" placeholder="Address Line 2..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                        </table>
		                    </div>
		                    <div class="tab table-form">
		                        <h4>Contact Info:</h4>
		                        <table>
		                            <tr>
		                                <td><span>City</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" name="city" id="city" value="${customer.city}" placeholder="City..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>State</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="text" name="state" id="state" value="${customer.state}" placeholder="State..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Zip Code</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="number" name="zipcode" id="zipcode" value="${customer.zipcode}" placeholder="Zip Code..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Country</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <select name="country" id="country">
		                                        <c:forEach items="${mapCountries}" var="country">
		                                            <option value="${country.value}"
		                                                <c:if test='${customer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
		                                        </c:forEach>
		                                    </select>
		                                </td>
		                            </tr>
		                        </table>
		                    </div>
		                    <div class="tab table-form">
		                        <h4>Login Details:</h4>
		                        <table>
		                            <tr>
		                                <td><span>Email</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="email" name="email" id="email" value="${customer.email}" placeholder="Email..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Password</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="password" name="password" id="password" value="${customer.password}" placeholder="Password..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td> <span>Confirm Password</span></td>
		                            </tr>
		                            <tr>
		                                <td>
		                                    <input type="password" name="confirmPassword" id="confirmPassword" value="${customer.password}" placeholder="Confirm Password..." oninput="this.className = ''" required>
		                                </td>
		                            </tr>
		                        </table>
		                    </div>
		                    <div class="btn-group table-form">
		                        <div>
		                            <button class="btn btn-white" type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
		                        </div>
		                        <div>
		                            <button class="btn btn-green" type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
		                        </div>
		                    </div>
		                    <div class="table-form circles">
		                        <div class="step"></div>
		                        <div class="step"></div>
		                        <div class="step"></div>
		                        <div class="step"></div>
		                    </div>
		                </form>
		            </fieldset>
		        </div>
		    </div>
		</div>
		<!--main container end-->
	</div>
	
	<script>
		$(document).ready(function(){     	
            $(".sidebar-btn").click( function () {
                $(".wrapper").toggleClass("collapse");
            });
		});
	</script>
	<script src="../js/customer_form.js"></script>
	
</body>
</html>