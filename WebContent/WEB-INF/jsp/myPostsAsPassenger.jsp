<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
<title>Registration Page</title>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/RegistrationValidator.js"></script>
<style>
select {
	width: 70%;
	padding: 12px 20px;
	margin: 15px 0;
	display: inline-block;
	border: 3px solid #ccc;
	border-radius: 34px;
	box-sizing: border-box;
}
</style>
</head>
<body bgcolor="#F1F6FA">

	<table align="center">
		<tr>
			<td align="right">
				<p class="resultheading">My Posts as Passenger</p>
			</td>
			<td>
				<form action="/CarPool/home">
					<input type="submit" value="Home" style="width: 100%" />
				</form>
			</td>
		</tr>
		<tr>
			<td></td>
			<td align="left">
				<form action="/CarPool/postAsPassenger">
					<input type="submit" value="New Post" style="width: 100%" />
				</form>
			</td>

		</tr>
	</table>
	<p class="error">${error}</p>
	<form name="updateDetails" action="updateDetails" onsubmit=""
		method="post">

		<table align="center" border="1" width="70%">
			<tr>
				<td>Source:</td>
				<td>Destination:</td>
				<td>Search:</td>
			</tr>
			<tr>
				<td><select name="source">
						<c:forEach items="${locations}" var="location">
							<option value="${location}">${location}</option>
						</c:forEach>
				</select></td>
				<td><select name="destination">
						<c:forEach items="${locations}" var="location">
							<option value="${location}">${location}</option>
						</c:forEach>
				</select></td>
				<td nowrap="nowrap">
					<!-- <form action="/CarPool/searchMyPostsAsDriver"> --> <input
					type="submit" value="Search" style="width: 70%"
					onclick="searchClick()" /> <!-- </form> -->
				</td>
			</tr>
		</table>
		<br> <br> <br>
		<table align="center" border="1" width="70%">
			<tr>
				<td>Sl No</td>
				<td>Source</td>
				<td>Destination</td>
				<td>Date</td>
				<td>Time</td>
				<td>Need Seats</td>
				<td>Mobile Number</td>
			</tr>
			<c:set var="count" value="0" />
			<c:forEach items="${ridesList}" var="ride">
				<tr>
					<%-- <td></td> --%>
					<td> <c:set var="count" value="${count + 1}"/> <c:out value="${count}" /></td>
					<td>${ride.source}</td>
					<td>${ride.destination}</td>
					<td>${ride.travelDate}</td>
					<td>${ride.time}</td>
					<td>${ride.seats}</td>
					<td>${ride.mobileNumber}</td>
				</tr>
			</c:forEach>

		</table>

		<!-- <tr>
				<td>Sex:</td>
				<td><select name="sex">
						<option value="M">M</option>
						<option value="F">F</option>
				</select></td>
			</tr>

			<tr>
				<td>User ID &nbsp;&nbsp;&nbsp;:</td>
				<td><input class="txt" type="text" name="userid" /></td>
				<td><p id="useridEmpty" style="color: red;"></p></td>
			</tr>
			<tr>
				<td>Password&nbsp;&nbsp;:</td>
				<td><input class="txt" type="password" name="password" /></td>
				<td><p id="passwordError" style="color: red;"></p></td>
			</tr>
			<tr>
				<td>Re Enter Password:</td>
				<td><input class="txt" type="password" name="password2" /></td>
			</tr>

			<tr>
				<td>Mobile Number:</td>
				<td><input class="txt" type="text" name="mobileNumber" /></td>
				<td><p id="mobileNumberEmpty" style="color: red;"></p></td>
			</tr>

			<tr>
				<td>Role:</td>
				<td><select name="role">
						<option value=""></option>
						<option value="Driver">Driver</option>
				</select><label>by default its passenger</label></td>
			</tr>
			<tr>
				<td>Driver License Id: &nbsp;&nbsp;</td>
				<td><input class="txt" type="text" name="driverLicenseId" /></td>
				<td><p id="driverLicenseIdEmpty" style="color: red;"></p></td>
			</tr>
			<tr>
				<td>State Id :&nbsp;&nbsp;</td>
				<td><input class="txt" type="text" name="stateId" /></td>
				<td><p id="stateIdEmpty" style="color: red;"></p></td>
			</tr>
			<tr>
				<td><input type="submit" name="SignUp" style="width: 100%" /></td>
			</tr>
		</table> -->
	</form>
</body>
<script type="text/javascript">
function searchClick(){
	alert('hello')
}

</script>
</html>
