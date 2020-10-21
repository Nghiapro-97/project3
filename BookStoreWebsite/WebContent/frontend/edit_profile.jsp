<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Edit profile customer</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <style type="text/css">
    	.form-outer input.invalid {
		  background-color: #ffdddd;
		}
		.form-outer input.finish {
		  background-color: white;
		}
    </style>    
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>

		<!--main container start-->
		<div class="main-container">
		    <div class="form-page form-signup">
		        <fieldset>
		            <legend>
		                <img class="img"
		                    src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
		                    alt="">
		            </legend>
		            <div class="container">
		                <div class="progress-bar">
		                    <div class="step">
		                        <p>Step 1</p>
		                        <div class="bullet">
		                            <span>1</span>
		                        </div>
		                        <div class="check fas fa-check"></div>
		                    </div>
		                    <div class="step">
		                        <p>Step 2</p>
		                        <div class="bullet">
		                            <span>2</span>
		                        </div>
		                        <div class="check fas fa-check"></div>
		                    </div>
		                    <div class="step">
		                        <p>Step 3</p>
		                        <div class="bullet">
		                            <span>3</span>
		                        </div>
		                        <div class="check fas fa-check"></div>
		                    </div>
		                    <div class="step">
		                        <p>Step 4</p>
		                        <div class="bullet">
		                            <span>4</span>
		                        </div>
		                        <div class="check fas fa-check"></div>
		                    </div>
		                </div>
		                <div class="form-outer">
		                    <form action="update_profile" method="post" id="customerProfile_form">
		                        <div class="page slide-page">
		                            <div class="center title1">
		                                <h2>Sign up</h2>
		                            </div>
		                            <div class="title">Basic Info:</div>
		                            <div class="field">
		                                <div class="label">First Name</div>
		                                <input type="text" name="firstName" id="firstName" value="${loggedCustomer.firstname}" placeholder="First name" />
		                            </div>
		                            <div class="field">
		                                <div class="label">Last Name</div>
		                                <input type="text" name="lastName" id="lastName" value="${loggedCustomer.lastname}" placeholder="Last name" />
		                            </div>
		                            <div class="field btns"><button type="button" class="firstNext next">Next</button>
		                            </div>
		                        </div>
		                        <div class="page">
		                            <div class="title">Contact Info:</div>
		                            <div class="field">
		                                <div class="label">Phone Number</div>
		                                <input type="number" name="phone" id="phone" value="${loggedCustomer.phone}" placeholder="phone number">
		                            </div>
		                            <div class="field">
		                                <div class="label">Address Line 1</div>
		                                <input type="text" name="address1" id="address1" value="${loggedCustomer.addressLine1}" placeholder="Address line 1">
		                            </div>
		                            <div class="field">
		                                <div class="label">Address Line 2</div>
		                                <input type="text" name="address2" id="address2" value="${loggedCustomer.addressLine2}" placeholder="Address line 2">
		                            </div>
		                            <div class="field btns">
		                                <button type="button" class="prev-1 prev">Previous</button>
		                                <button type="button" class="next-1 next">Next</button>
		                            </div>
		                        </div>
		                        <div class="page">
		                            <div class="title">Contact Info:</div>
		                            <div class="field">
		                                <div class="label">City</div>
		                                <input type="text" name="city" id="city" value="${loggedCustomer.city}" placeholder="City">
		                            </div>
		                            <div class="field">
		                                <div class="label">State</div>
		                                <input type="text" name="state" id="state" value="${loggedCustomer.state}" placeholder="State">
		                            </div>
		                            <div class="field">
		                                <div class="label">Zip Code</div>
		                                <input type="number" name="zipcode" id="zipcode" value="${loggedCustomer.zipcode}" placeholder="Zip code">
		                            </div>
		                            <div class="field">
		                                <div class="label">Country</div>
		                                <select name="country" id="country">
		                                    <c:forEach items="${mapCountries}" var="country">
		                                        <option value="${country.value}" <c:if
		                                            test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if>
		                                            >${country.key}</option>
		                                    </c:forEach>
		                                </select>
		                            </div>
		                            <div class="field btns">
		                                <button type="button" class="prev-2 prev">Previous</button>
		                                <button type="button" class="next-2 next">Next</button>
		                            </div>
		                        </div>
		                        <div class="page">
		                            <div class="title">Login Details:</div>
		                            <div class="field">
		                                <div class="label">Email</div>
		                                <input type="email" name="email" id="email" value="${loggedCustomer.email}" readonly>
		                            </div>
		                            <div class="field">
		                                <h6><i>(leave password fields blank if you don's want to chance password)</i></h6>
		                            </div>
		                            <div class="field">
		                                <div class="label">New Password</div>
		                                <input type="password" name="newpassword" id="newpassword" placeholder="Password">
		                            </div>
		                            <div class="field">
		                                <div class="label">Confirm Password</div>
		                                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password">
		                            </div>
		                            <div class="field btns">
		                                <button type="button" class="prev-3 prev">Previous</button>
		                                <button class="submit" type="submit">Submit</button>
		                            </div>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </fieldset>
		    </div>
		</div>
		<!--main container end-->
	
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script src="js/edit_profile.js"></script>
	
</body>
</html>