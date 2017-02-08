<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
<style>
p.b{
margin-left: 1050;
}
</style>


</head>

<body>
<form action="home" ><p class="b"><input type="submit" value="Home"/></p></form>
<h1 align="center"> Here is the message you posted: </h1>
<table border="1" bgcolor="#E3E7EC" align="center">
	<tr>
		<td>
			<b>Posted Message</b>
		</td>
		
		<td>
			<b>Posted At</b>
		</td>
	
		<td>
			<b>Posted by</b>
		</td>
		<td>
			<b>Posted To</b>
		</td>
	</tr>
	<tr>
		<td>
			${post.getMessage()}
		</td>
		
		<td>
			${post.getPostedAt()}
		</td>
	
		<td>
			${post.getPostedBy()}
		</td>
		<td>
			${post.getPostedTo()}
		</td>
	
	</tr>
</table>
${postedMessage}
</body>
</html>
