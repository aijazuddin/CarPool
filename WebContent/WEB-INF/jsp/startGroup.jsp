<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Car Pool</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
	<style>
	p.b{
margin-left: 1050;
}
	</style>
</head>
<body bgcolor="#F1F6FA">
<p class="b"><INPUT type=button value=" Home " onClick="history.back();"></p>
<form name="group" action="/CarPool/startGroup" method="post">
<input type="hidden", name="userid", value=${userid }>
<p class="error">${error}</p>
<table align="center">
<tr height="50">
<td colspan="1" bgcolor="#2C3E50"><p align="center"><font color="white" size="12"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Start A Group !!
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</b></p> </font></td>
</tr>
<tr>
<td colspan="1"><br>please enter below details:</td>
</tr>
<tr>
	<td><nobr>
		<p class="firstclass" style="display:inline">Group Name:	
		<input type="text" name="groupName" class="txt"/></p>
		<p class="error2">${error2}</p>	
	</nobr></td>

</tr>
<tr><td><nobr>
	<p class="firstclass" style="display:inline">Description:	
		<input type="text" name="groupDescription" class="txt" /></p>	
</nobr></td></tr>
<tr><td><nobr>
	<p class="firstclass" style="display:inline">Group Type:	
		<select name="groupType">
		<option value="StudentLocal">Student Local Sharing</option>
		<option value="carPooling"> Car Pooling</option>
		<option value="business"> Business purpose </option>
		</select></p>

</nobr></td></tr>
<tr><td>

		<input type="submit" value="create"/>
 </td></tr>
</table>
</form>

</body>
</html>