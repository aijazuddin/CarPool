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
			<td>
				<p class="resultheading">New Post as Passenger</p>
			</td>
			<td>
				<form action="/CarPool/home">
					<input type="submit" value="Home" style="width: 100%" />
				</form>
			</td>
		</tr>
	</table>
	<p class="error">${error}</p>
	<form name="postAsPassengerSubmit" action="postAsPassengerSubmit" method="post">

		<table align="center">
			<tr>
				<td>Source:</td>
				<td><select name="source">
						<c:forEach items="${locations}" var="location">
							<option value="${location}">${location}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><select name="destination">
						<c:forEach items="${locations}" var="location">
							<option value="${location}">${location}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Date:</td>
				<td><input class="txt" type="text" name="travelDate" /></td>
			</tr>

			<tr>
				<td>Estimated Leaving Time:</td>
				<td><select name="time">
						<c:forEach items="${time}" var="time">
							<option value="${time}">${time}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Required Seats:</td>
				<td><select name="seats">
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
				</select></td>
			</tr>
			<tr>
				<td>Mobile Number:</td>
				<td><input class="txt" type="text" name="mobileNumber" /></td>
			</tr>
			<tr>
				<td>Review: &nbsp;&nbsp;</td>
				<td><input class="txt" type="text" name="review" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="Post"
					value="Post a Ride Request" style="width: 100%" /></td>
			</tr>
		</table>
	</form>
	<br>
	<form action="">
		<table border="1" align="center">
			<tr>
				<td>Drivers Applied/Approved</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>

	</form>
</body>
</html>
