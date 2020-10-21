<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Customer profile - EverGreenBook</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:directive.include file="header.jsp"/>
		<!--main container start-->
		<div class="main-container">
		    <div class="form-page form-profile">
		        <fieldset>
		            <legend>
		                <img class="img"
		                    src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                    alt="">
		            </legend>
		            <div class="container">
		                    <h2>Personal information</h2>
		                    <div class="form-page table-formfile">
		                        <table>
		                            <tr class="border-bot">
		                                <td>
		                                    <h3>File</h3>
		                                </td>
		                                <td></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>First Name</span></td>
		                                <td><span>${loggedCustomer.firstname}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Last Name</span></td>
		                                <td><span>${loggedCustomer.lastname}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Address Line 1</span></td>
		                                <td>
		                                    <address>${loggedCustomer.addressLine1}</address>
		                                </td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Address Line 2</span></td>
		                                <td>
		                                    <address>${loggedCustomer.addressLine2}</address>
		                                </td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>City</span></td>
		                                <td><span>${loggedCustomer.city}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>State</span></td>
		                                <td><span>${loggedCustomer.state}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Country</span></td>
		                                <td><span>${loggedCustomer.countryName}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Zip code</span></td>
		                                <td><span>${loggedCustomer.zipcode}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Register date</span></td>
		                                <td><span>${loggedCustomer.registerDate}</span></td>
		                            </tr>
		                        </table>
		                    </div>
		                    <div class="form-page table-formcontac">
		                        <table>
		                            <tr class="border-bot">
		                                <td>
		                                    <h3>Contact information</h3>
		                                </td>
		                                <td></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Email</span></td>
		                                <td><span>${loggedCustomer.email}</span></td>
		                            </tr>
		                            <tr class="border-bot">
		                                <td class="titles"><span>Phone number</span></td>
		                                <td><span>${loggedCustomer.phone}</span></td>
		                            </tr>
		                        </table>
		                    </div>
		                    <div class="center" style="margin-bottom: 20px;">
		                        <a href="edit_profile">Edit Personal information</a>
		                    </div>
		            </div>
		        </fieldset>
		    </div>
		</div>
		<!--main container end-->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>