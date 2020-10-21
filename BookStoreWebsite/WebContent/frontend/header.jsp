<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--header menu start-->
<div class="header">
	<div class="header-menu">
		<div class="menu">
			<table>
				<tr>
					<td class="cols-1">
						<div class="img-logo">
							<a href="${pageContext.request.contextPath}/"><img class="img"
								src="images/logoBookStore.PNG" alt=""></a>
						</div>
					</td>
					<td class="cols-2">
						<div class="nav-fill">
							<form action="search" method="get">
								<button type="submit" value="Search" class="fas fa-search"></button>
								<input type="text" name="keyword"
									placeholder="Search for anything" class="search-data" />
							</form>
						</div>
					</td>
					<td class="cols-3">
						<div class="cart-icon">
							<c:if test="${loggedCustomer == null}">
								<a href="view_cart"><i class="fas fa-shopping-cart cart"
									title="Cart"></i></a>
								<button class="btn-login" id="btn_login">Log in</button>
								<button class="btn-signup" id="btn_signup">Sign up</button>
							</c:if>
							<c:if test="${loggedCustomer != null}">
								<div class="user">
									<button class="btn-user">
										<span>${loggedCustomer.fullname.substring(0, 1).toUpperCase()}</span>
									</button>
									<!--function for user-->
									<div class="user-fun">
										<table class="sup-table">
											<tr>
												<td>
													<table class="sub-table">
														<tr>
															<td><button style="margin: 0 !important;"
																	class="btn-user">
																	<span>${loggedCustomer.fullname.substring(0, 1).toUpperCase()}</span>
																</button></td>
															<td><span><a href=""
																	style="font-weight: 700; padding-left: 5px;">${loggedCustomer.fullname}</a></span><br />
																<span style="font-size: smaller; padding-left: 5px;">${loggedCustomer.email}</span>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td><a href="view_cart">My cart</a></td>
											</tr>
											<tr>
												<td><a href="view_order">My Orders</a></td>
											</tr>
											<tr>
												<td><a href="view_profile">My profile</a></td>
											</tr>
											<tr>
												<td><a href="">Payment method</a></td>
											</tr>
											<tr>
												<td><a href="">Help</a></td>
											</tr>
											<tr>
												<td><a href="Logout">Sign out</a></td>
											</tr>
										</table>
									</div>
									<!--function for user end-->
								</div>
								<a href="view_cart" style="margin-right: 60px;"><i class="fas fa-shopping-cart cart" title="Cart"></i></a>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="header-category">
		<span>Shop By Category</span>
		<p>
			<i class="arrow-right"></i>
		</p>
		<div class="category">
			<c:forEach var="category" items="${listCategory}" varStatus="status">
				<a href="view_category?id=${category.categoryId}"> <c:out
						value="${category.name}" />
				</a>
			</c:forEach>
		</div>
	</div>
</div>
<!--header menu end-->

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_login").click(function() {
			window.location = 'login';
		});

		$("#btn_signup").click(function() {
			window.location = 'register';
		});

		$(".btn-user").click(function() {
			window.location = 'view_profile';
		});
	});
</script>