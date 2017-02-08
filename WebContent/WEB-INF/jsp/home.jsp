<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Car Pool</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/LoginCheck.js"></script>
<style>
input[type=text], select {
	width: 50%;
	padding: 12px 20px;
	margin: 15px 0;
	display: inline-block;
	border: 3px solid #ccc;
	border-radius: 34px;
	box-sizing: border-box;
	border-style: dotted;
	border-color: #2FACDC;
}

input[type=password], select {
	width: 50%;
	padding: 12px 20px;
	margin: 15px 0;
	display: inline-block;
	border: 3px solid #ccc;
	border-radius: 34px;
	box-sizing: border-box;
	border-style: dotted;
	border-color: #2FACDC;
}
</style>
</head>

<body>
	<table bgcolor="" height=100% width=100%>
		<tr>
			<td></td>
			<td>
				<table>
					<tr>
						<td>
							<form action="/CarPool/home">
								<input type="submit" value="Home" style="width: 100%" />
							</form>
						</td>
						<td><form action="aboutUs">
								<input type="submit" value="About Us" style="width: 100%" />
							</form></td>
						<td><form action="contactUs">
								<input type="submit" value="Contact Us" style="width: 100%" />
							</form></td>
						<td><form action="login">
								<input type="submit" value="log out" style="width: 100%" />
							</form></td>
					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
						<td><c:if test="${userDetails.role == 'Driver'}">
								<form action="/CarPool/myPostsAsDriver">
									<input type="submit" value="My Posts as Driver"
										style="width: 100%" />
								</form>
							</c:if></td>
						<td><form action="myPostsAsPassenger">
								<input type="submit" value="My Posts as Passenger"
									style="width: 100%" />
							</form></td>

					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
					</tr>
					<tr>
						<td><c:if test="${userDetails.role == 'Driver'}">
								<form action="/CarPool/findPassengers">
									<input type="submit" value="Find Passengers"
										style="width: 100%" />
								</form>
							</c:if></td>
						<td><form action="findDrivers">
								<input type="submit" value="Find Drivers" style="width: 100%" />
							</form></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
</body>
</html>