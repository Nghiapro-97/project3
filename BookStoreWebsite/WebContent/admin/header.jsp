<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--header menu start-->
<div class="header">
    <div class="header-menu">
        <div class="sidebar-btn">
            <i class="fas fa-bars"></i>
        </div>
        <div class="title">
            <a href="${pageContext.request.contextPath}/admin/" class="home">
                <span class="title" style="margin-left: 60px; color: dodgerblue;">Ever<span
                        style="color: green;">green</span></span>
            </a>
        </div>
    </div>
</div>
<!--header menu end-->
<!--sidebar start-->
<div class="sidebar">
    <div class="sidebar-menu">
        <div class="profile">
            <img src="https://qxz0lg.sn.files.1drv.com/y4mSmTm0Jl-BE4Z6NwJoNrVDr27zMECjV84fEUubymGGAwrJw1Wn7ckANtrheEn2XB1jASppI6RnzS2FCeiCA6LtdCJrFl9agDpAqF9dp2daeP0Ts-oyERoJF8AX6LLFeZcLRRj8A-L5gMm-9ah5TAhr9JcJeMx6yZfKcM6aHvE3zKlj4F461c58_QQloMz4T5X69ALfAWdhEZZPysvi9EmYA?width=168&height=168&cropmode=none" alt="">
            <p><c:out value="${sessionScope.useremail}"></c:out></p>
        </div>
        <div class="item">
            <a href="${pageContext.request.contextPath}/admin/" class="menu-btn">
                <i class="fas fa-desktop"></i><span>Dashboard</span>
            </a>
        </div>
        <div class="item" id="manage">
            <a href="#manage" class="menu-btn">
                <i class="fas fa-cog"></i><span>Manage<i class="fas fa-chevron-down drop-down"></i></span>
            </a>
            <div class="sub-menu">
                <a href="list_user"><i class="fas fa-image"></i><span>User</span></a>
                <a href="list_category"><i class="fas fa-address-card"></i><span>Category</span></a>
                <a href="list_books"><i class="fas fa-address-card"></i><span>Book</span></a>
                <a href="list_customer"><i class="fas fa-address-card"></i><span>Customers</span></a>
                <a href="list_reviews"><i class="fas fa-address-card"></i><span>Reviews</span></a>
                <a href="list_orders"><i class="fas fa-address-card"></i><span>Orders</span></a>
            </div>
        </div>
        <div class="item">
            <a href="#" class="menu-btn">
                <i class="fas fa-info-circle"></i><span>Help</span>
            </a>
        </div>
        <div class="item">
            <a href="#" class="menu-btn">
                <i class="far fa-envelope"></i><span>Contact</span>
            </a>
        </div>
        <div class="item">
            <a href="logout" class="menu-btn">
                <i class="fas fa-sign-out-alt"></i><span>Sign Out</span>
            </a>
        </div>
    </div>
</div>
<!--sidebar end-->
