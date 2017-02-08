<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
<style>
p{
margin-left: 1050;
}

</style>
</head>
<body>

	<!-- <form action="home" ><p><input type="submit" value="Home"/></p></form> -->
	<p><INPUT type=button value=" Home " onClick="history.back();"></p>
<table width="400" height="80" align="center" bgcolor="#BDC0E3">
<tr><td>


${userid } Connected With ${friend} !!
</td></tr>
<tr><td>
Result is : ${result}
</td></tr>
</table>

</body>

</html>
