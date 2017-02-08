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
				<p class="resultheading">Find Passenger</p>
			</td>
			<td>
				<form action="/CarPool/home">
					<input type="submit" value="Home" style="width: 100%" />
				</form>
			</td>
		</tr>
	</table>
	<p class="error">${error}</p>
	<form name="findPassengerDetails" action="findPassengerDetails" method="post">

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
				<td>Mobile Number</td>
				<td>Need Seats</td>
				<td>Details</td>
			</tr>
			
			<c:set var="count" value="0" />
			<c:forEach items="${ridesList}" var="ride">
				<tr>
					<td> <c:set var="count" value="${count + 1}"/> <c:out value="${count}" /></td>
						<td>${ride.source}</td>
					<td>${ride.destination}</td>
					<td>${ride.travelDate}</td>
					<td>${ride.time}</td>
					<td>${ride.mobileNumber}</td>
					<td>${ride.seats}</td>
					<td><a href="openPassenger">See Details</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
<script type="text/javascript">
function searchClick(){
	alert('hello')
}

</script>
</html>
