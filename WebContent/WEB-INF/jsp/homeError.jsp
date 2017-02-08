<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Car Pool</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
<script src="<%=request.getContextPath()%>/resources/js/angular.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/LoginCheck.js"></script>
<style>
input[type=text],select {
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
input[type=password],select {
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
	<table bgcolor="#F1F6FA" height=100% width=100%>
		<tr>
			<td colspan="2"><img
				src="<%=request.getContextPath()%>/resources/images/Header.jpg"
				alt="hello" height="105" width="1510"></td>
		</tr>
		<tr>
			<td height="15"></td>
			<td align="center" height="15">
				<form action="home">
					<input type="button" value="Home"></input>
				</form>
			</td>
		</tr>
		<tr>
			<td width="600"><br>
			<p> <font color = "red"> Please check Credentials !!</font></p>
				<form action="/CarPool/loginValidation" method="post">
					<p class="firstclass">
						&nbsp;&nbsp;&nbsp; User ID &nbsp; :&nbsp;&nbsp; 
						<input class="border" type="text" name="userid" />
					</p>
					
					<p class="firstclass">
						&nbsp;&nbsp;&nbsp; Password: &nbsp; 
						<input class="border"type="password" name="password" /> <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <input type="submit" name="send" ng-click="checkUserIDPassword()" />
				</form>
				
				Don't have account?? <a href="registration">click here!!</a>
				</td>
			<td><img src="<%=request.getContextPath()%>/resources/images/sharing-is-caring-17.jpg"
				alt="hello" height="480" width=100% height=100% align="left"><br><br>
				<table height=100% width=100% >
				<tr>
					<td>
						<form action="aboutUs" align="right">
							<input type="submit" value="About US" width=50%/></form></td>
					<td>
						<form action="contactUs" align="right">
							<input type="submit" value="Contact Us"/></form></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>