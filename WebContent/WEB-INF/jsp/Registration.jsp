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
	width: 50%;
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
				<p class="resultheading">Registration page</p>
			</td>
			<td>
				<form action="/CarPool/login">
					<input type="submit" value="Home" style="width: 100%" />
				</form>
			</td>
		</tr>
	</table>
	<p class="error">${error}</p>
	<form name="updateDetails" action="updateDetails"
		onsubmit="return registrationValidator()" method="post">

		<table align="center">
			<tr>
				<td>First Name:</td>
				<td width="360"><input class="txt" type="text" name="fName" /></td>
				<td><p id="fNameEmpty" style="color: red;"></p></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input class="txt" type="text" name="lName" /></td>
				<td><p id="lNameEmpty" style="color: red;"></p></td>
			</tr>
			<tr>
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
		</table>
	</form>
</body>
</html>
