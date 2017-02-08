<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Result</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
</head>
<body bgcolor="#F1F6FA">
	<center>
		<p class="resultheading">you have entered below details:</p>
	</center>
	<table class="result" align="center">
		<tr>
			<td colspan="2">
				<form action="login">
					<input type="submit" value="Continue Login" width=50% align="left" />
				</form>
			</td>
		</tr>
		<tr>
			<td>First Name:</td>
			<td>${userDetails.fName}<br></td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td>${userDetails.lName}<br></td>
		</tr>
		<tr>
			<td>Sex :</td>
			<td>${userDetails.sex}<br></td>
		</tr>
		<tr>
			<td>User ID:</td>
			<td>${userDetails.userid}<br></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td>${userDetails.password}<br></td>
		</tr>
		<tr>
			<td>Mobile Number:</td>
			<td>${userDetails.mobileNumber}<br></td>
		</tr>
		<tr>
			<td>Role :</td>
			<td>${userDetails.role}<br></td>
		</tr>
		<tr>
			<td>Driver Id :</td>
			<td>${userDetails.driverLicenseId}<br></td>
		</tr>
		<tr>
			<td>State Id:</td>
			<td>${userDetails.stateId}<br></td>
		</tr>
	</table>
</body>
</html>