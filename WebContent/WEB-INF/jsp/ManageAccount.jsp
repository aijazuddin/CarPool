<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
<title>Registration Page</title>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/RegistrationValidator.js"></script>
	
</head>
<body bgcolor="#F1F6FA">
<center><p class="resultheading">welcome to registration page</p>
<p class="error">${error}</p></center>
<form name="updateDetails" action="manageAccount" onsubmit="return registrationValidator()" method="post">
	<input  name="userid" value=${userDetails.getUserid()} type="hidden"/>
	<table align="center">
	<tr>
	<td>First Name:</td><td width="360"> <input  type="text" name="fName" value="${userDetails.getfName()}" class="txt"/><br>
	<p id="fNameEmpty" style="color:red;"></p>
	</td>
	
	</tr><tr>
	<td>Last  Name: </td><td><input type="text" name="lName" value="${userDetails.getlName()}" class="txt"/><br>
	<p id="lNameEmpty" style="color:red;"></p>
	</td>
	</tr><tr>
	<td>Mobile Number:</td><td> <input  type="text" name="mobileNumber" value="${userDetails.getMobileNumber()}" class="txt"/><br>
	<p id="mobileNumberEmpty" style="color:red;"></p>
	</td>
	</tr><tr>
	<td>Password&nbsp;&nbsp;:</td><td> <input  type="password" name="password" value="${userDetails.getPassword()}" class="txt"/><br>
	<p id="passwordError" style="color:red;"></p>
	</td>
	</tr>
	<tr>
	<td>Re Enter Password:</td><td><input type="password" name="password2" class="txt"/><br></td>
	</tr><tr>
	<td>Name of School:</td><td><input type="text" name="schoolName" value="${userDetails.getSchoolName()}" class="txt"/><br>
	<p id="schoolNameEmpty" style="color:red;"></p>
	</td>
	</tr><tr>	
	<td>City&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;</td><td><input type="text" name="city" value="${userDetails.getCity()}" class="txt"/><br>
	<p id="cityEmpty" style="color:red;"></p>
	</td>
	</tr><tr>
	<td>Zip Code&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp; </td><td><input  type="text" name="zip" value="${userDetails.getZip()}" class="txt"/><br>
	<p id="zipEmpty" style="color:red;"></p>
	</td>
	</tr><tr><td></b>
	</td><td><input type="submit" name="SignUp"  width="200" /></td></tr>
	</table>
	</form>
</body>
</html>
