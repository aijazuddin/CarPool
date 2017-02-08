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
	  tr.body > td
{
    
    text-align: left;
    font-family:"Bookman Old Style";
    font-size: 18px;
    

}
td.heading{
 font-family:"verdana"; 
 font-color:#2C3E50; 
 font-size=5;
}
p.b{
margin-left: 1050;
}
	
	</style>
</head>
<body bgcolor="#F1F6FA"><font size="12">
<p class="b"><INPUT type=button value=" Home " onClick="history.back();"></p>
<form name="group" action="/CarPool/manageGroup" method="post">
<input type="hidden", name="userid", value=${userid }>
<p class="error">${error}</p>
<table align="center" border="1" >
<tr height="50">
<td colspan="3" bgcolor="#2C3E50"><p align="center"><font color="white" size="9"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Manage your Groups here  !!
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</b></font></p> </td>
</tr>
<tr height="30">
<td class="heading"><b>Group Name</b></td>
<td class="heading"><b>Total Members</b></td>
<td class="heading"><b>Edit Group</b></td></font>
</tr>
<c:forEach items="${groupsMap}" var="group">
	<tr height="25" class="body"><td>
	${group.key}
	</td>
	<td>
	${group.value}
	</td>
    <td>
    	<a href ="editGroup?groupName=${group.key}">Edit</a>
    </td>
	</tr>
</c:forEach>

</table>
</form>
</font>
</body>
</html>