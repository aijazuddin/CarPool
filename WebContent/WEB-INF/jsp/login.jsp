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

<body ng-controller="loginCheck">
	<table bgcolor="" height=100% width=100%>
		<tr>
			<td colspan="2"><img
				src="<%=request.getContextPath()%>/resources/images/Header.jpg"
				alt="hello" height="105" width="1400"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<table>
					<tr>
						<td>
							<form action="/CarPool/login">
								<input type="submit" value="Home" style="width: 100%" />
							</form>
						</td>
						<td><form action="aboutUs">
								<input type="submit" value="About US" style="width: 100%" />
							</form></td>
						<td><form action="contactUs">
								<input type="submit" value="Contact Us" style="width: 100%" />
							</form></td>
					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td width="500" align="center"><br>
				<form name="login" action="/CarPool/validateLogin"
					onsubmit="return loginCheck()" method="post">
					<p class="firstclass">
						&nbsp;&nbsp;&nbsp; User ID: &nbsp; <input class="border"
							type="text" name="userid" />
					</p>
					<p id="useridEmpty" style="color: red;"></p>
					<p class="firstclass">
						&nbsp;&nbsp;&nbsp; Password: &nbsp; <input class="border"
							type="password" name="password" /> <br>
					<p id="passwordEmpty" style="color: red;"></p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" name="send" ng-click="checkUserIDPassword()" />
				</form> <br>
				Don't have account?? <a href="registration">click here!!</a><br>
				<br> Forgot Password?? <a href="forgotPassword">click
					here!!</a></td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img
				src="<%=request.getContextPath()%>/resources/images/sharing-is-caring.jpg"
				alt="hello" height="480" width=80% height=100% align="center"><br>
				<br>
			</td>
		</tr>
	</table>
</body>
</html>