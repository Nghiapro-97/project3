<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin login</title>
	<link rel="stylesheet" href="../css/admin.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <!--wrapper start-->
    <div class="wrapper">
		<!--header menu start-->
        <div class="header">
            <div class="header-menu">
                <div class="sidebar-btn">
                    <i class="fas fa-bars"></i>
                </div>
                <div class="title">
                    <a href="" class="home">
                        <span class="title" style="margin-left: 60px; color: dodgerblue;">Ever<span
                                style="color: green;">green</span></span>
                    </a>
                </div>
            </div>
        </div>
        <!--header menu end-->
        
		<!--main container start-->
        <div class="main-container1">
            <div class="form-page form-login">
                <fieldset class="fieldset">
                    <legend class="legend">
                        <img class="img"
                            src="https://brd0lg.sn.files.1drv.com/y4mnTuQXFBf7bTW6SLIipTu1OxYQQ9p11CiWpFfDlvzws44lHN-3mIex0Rmidjk_pQc-cmcE3OtSuYvFHc1nEfjOyuZmzw0EiLGWCjRszr1pUZBLX7mp3UB7CC1l2gGGp56dKDKPBdrNSHJX-G--gyjsriIwP5Jd8_eOQvrvUDzDTgXtxi8ugk9SfglXYCZkOTUXOO2cb3XmGdsF8c1n1DchQ?width=105&height=101&cropmode=none"
                            alt="">
                    </legend>
                    <div class="container">
                        <form action="login" id="loginForm" method="post">
                            <table class="table-formlogin">
                                <tr>
                                    <c:if test="${message != null}">
                                        <th><h4 class="error"><i class="fas fa-cat"></i>&nbsp;${message}</h4></th>
                                    </c:if>
                                    <c:if test="${message == null}">
                                        <th><span>Log In to Admin Evergreen Account!</span></th>
                                    </c:if>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td>
                                        <div>
                                            <button type="button" class="left fb btn">
                                                <i class="fa fa-facebook fa-fw"></i> Login with Facebook
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <button type="button" class="left google btn"><i
                                                    class="fa fa-google fa-fw">
                                                </i> Login with Google+
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <input class="input" type="email" name="email" id="email"
                                                value="${user.email}" placeholder="Email" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <input class="input" type="password" name="password" id="password" value="${user.password}" placeholder="Password" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <button class="center input btn-login" type="submit" id="submit">Login</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>
                                        <span class="forgot-pass">or <a href="">Forgot Password</a></span>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </fieldset>
            </div>
        </div>
        <!--main container end-->
    </div>
    <!--wrapper end-->
</body>
</html>