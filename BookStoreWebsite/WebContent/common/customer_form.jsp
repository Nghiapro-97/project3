<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="form">
	<tr>
		<td><label>Email:</label></td>
		<td><input type="text" name="email" id="email"
			value="${customer.email}" /></td>
	</tr>
	<tr>
		<td><label>First Name:</label></td>
		<td><input type="text" name="firstName" id="firstName"
			value="${customer.firstname}" /></td>
	</tr>
	<tr>
		<td><label>Last Name:</label></td>
		<td><input type="text" name="lastName" id="lastName"
			value="${customer.lastname}" /></td>
	</tr>
	<tr>
		<td><label>Password:</label></td>
		<td><input type="password" name="password" id="password"
			value="${customer.password}" /></td>
	</tr>
	<tr>
		<td><label>Confirm Password:</label></td>
		<td><input type="password" name="confirmPassword"
			id="confirmPassword" value="${customer.password}" /></td>
	</tr>
	<tr>
		<td><label>Phone Number:</label></td>
		<td><input type="text" name="phone" id="phone"
			value="${customer.phone}" /></td>
	</tr>
	<tr>
		<td><label>Address Line 1:</label></td>
		<td><input type="text" name="address1" id="address1"
			value="${customer.addressLine1}" /></td>
	</tr>
	<tr>
		<td><label>Address Line 2:</label></td>
		<td><input type="text" name="address2" id="address2"
			value="${customer.addressLine2}" /></td>
	</tr>
	<tr>
		<td><label>City:</label></td>
		<td><input type="text" name="city" id="city"
			value="${customer.city}" /></td>
	</tr>
	<tr>
		<td><label>State:</label></td>
		<td><input type="text" name="state" id="state"
			value="${customer.state}" /></td>
	</tr>
	<tr>
		<td><label>Zip Code:</label></td>
		<td><input type="text" name="zipcode" id="zipcode"
			value="${customer.zipcode}" /></td>
	</tr>
	<tr>
		<td><label>Country:</label></td>
		<td><select name="country" id="country">
				<c:forEach items="${mapCountries}" var="country">
					<option value="${country.value}"
						<c:if test='${customer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
				</c:forEach>
		</select></td>
	</tr>
</table>

