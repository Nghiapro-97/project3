<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>EvergreenBook - Store Web</title>
	<link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>

<body>
    <div class="wrapper">
        <jsp:include page="header.jsp"></jsp:include>
        <!--main container start-->
        <div class="main-container">
            <!--start aside-->
            <div class="aside">
				
            </div>
            <!--end aside-->
            <!--start page main-->
            <div class="page-wrapper">
                <div class="advertise">
                    <img class="img"
                        src="https://images-na.ssl-images-amazon.com/images/G/01/kindle/apub/summerreading/merch/phase3/20200731_US_P38038708_KC-Merch-Summer-Reading-Assets_1500x300-BHP.jpg"
                        alt="">
                </div>
				<div class="listBook-all">
				    <div class="tab">
				        <button class="tablinks" onclick="openTab(event, 'Home')" id="defaultOpen">Home</button>
				        <button class="tablinks" onclick="openTab(event, 'New-Book')">New Book</button>
				        <button class="tablinks" onclick="openTab(event, 'Best-Selling-Book')">Best-Selling
				            Book</button>
				        <button class="tablinks" onclick="openTab(event, 'Most-Favored-Book')">Most-Favored
				            Book</button>
				    </div>
				
				    <div id="Home" class="tabcontent">
				        <div class="content">
				            <div class="row1">
				                <c:forEach items="${listBook}" var="book">
				                    <jsp:directive.include file="book_group.jsp" />
				                </c:forEach>
				            </div>
				        </div>
				        <div class="pagination">
				            <div>
				            	<c:if test="${currentPage != 1}">
				                	<a href="?page=${currentPage - 1}">&laquo;</a>
				                </c:if>
				                
				                <c:forEach begin="1" end="${noOfPages}" var="i">
				                	<c:choose>
				                		<c:when test="${currentPage eq i}">
				                			<a style="color: black;">${i}</a>
				                		</c:when>
                    					<c:otherwise>
                    						<a href="?page=${i}" style="color: #3d77f3;">${i}</a>
                    					</c:otherwise>
				                    </c:choose>
				               </c:forEach>
				               
				               <c:if test="${currentPage lt noOfPages}">
				                	<a href="?page=${currentPage + 1}">&raquo;</a>
				               </c:if>
				            </div>
				        </div>
				    </div>
				
				    <div id="New-Book" class="tabcontent">
				        <div class="content">
				            <div class="row1">
				                <c:forEach items="${listNewBooks}" var="book">
				                    <jsp:directive.include file="book_group.jsp" />
				                </c:forEach>
				            </div>
				        </div>
				    </div>
				
				    <div id="Best-Selling-Book" class="tabcontent">
				        <div class="content">
				            <div class="row1">
				                <c:forEach items="${listBestSellingBooks}" var="book">
				                    <jsp:directive.include file="book_group.jsp" />
				                </c:forEach>
				            </div>
				        </div>
				    </div>
				
				    <div id="Most-Favored-Book" class="tabcontent">
				        <div class="content">
				            <div class="row1">
				                <c:forEach items="${listMostFavoreBooks}" var="book">
				                    <jsp:directive.include file="book_group.jsp" />
				                </c:forEach>
				            </div>
				        </div>
				    </div>
				</div>
            </div>
            <!--end page main-->
        </div>
        <!--main container end-->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <!--wrapper end-->

    <script type="text/javascript">
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();

    </script>

</body>

</html>