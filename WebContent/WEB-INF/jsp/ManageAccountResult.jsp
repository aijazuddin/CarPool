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
<center><p class="resultheading">These are the new details:</p></center>
<table class="result" align="center">
<tr>
	<td colspan="2">
		<form action="home" ><input type="submit" value="Continue Login" width=50%  align="left"/></form>
	</td>
</tr>
<tr>
<td>
First Name:</td><td> ${userDetails.fName}<br></td>
</tr><tr>
<td>Last Name:  </td><td>${userDetails.lName}<br></td>
</tr><tr>
<td>Mobile Number: </td><td> ${userDetails.mobileNumber}<br></td>
</tr><tr>
<td>User ID: </td><td> ${userDetails.userid}<br></td>
</tr><tr>
<td>password:  </td><td>${userDetails.password}<br></td>
</tr><tr>
<td>School name: </td><td> ${userDetails.schoolName}<br></td>
</tr><tr>
<td>City: </td><td> ${userDetails.city}<br></td>
</tr><tr>
<td>Zip Code: </td><td> ${userDetails.zip}</td>
</tr>
<</table>
</p>
</body>
</html>