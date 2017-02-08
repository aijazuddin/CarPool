<%@page import="org.hibernate.Session"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ListIterator"%>
<%@page import="com.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Groups</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
	<style>

	</style>
</head>
<body bgcolor="#F1F6FA">

<form action="deleteGroup">
<input type="hidden" value="${groupName}" name="groupName"></input>
<table border="1" align="center">

<tr>
	<td colspan="3" bgcolor="#2C3E50">
	<p align="center"><font color="white" size="12"><b>Edit ' ${groupName} ' Group!!</b></font>
	</td>
</tr>


<tr>


	<td colspan="2">
		 Group Administrator is:
	</td>	
	<td>
		${group.getGroupAdmin()}
	</td>
</tr>

<tr>

	<td colspan="3" >
	<nobr>
	<a href ="addMember?groupName=${groupName}"><font size="4" color="green">AddMember</font></a>
		<input type="submit" name="delete" value="delete" ></input>
	<INPUT type=button value=" Back " onClick="history.back();">
		</nobr>	
	</td>

</tr>
<c:forEach items="${connections}" var="connection">
<tr>
	<td><input type="radio" name="member" value="${connection.getConnectionFrom()}" checked></input></td>
	<td>
		 ${connection.getConnectionFrom()}
	
	</td>
	<td>
		Member
	</td>
</tr>
</c:forEach>

</table>
</form>




</body>
</html>

