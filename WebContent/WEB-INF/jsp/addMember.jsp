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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHome.css">
</head>
<body>
<form action="memberAdded" method="post"> 
				<input type="hidden"  name="groupName"  value=${groupName }><nobr>
				<select name = "friend">
					<c:forEach items="${userDetails }" var="userDetail">
						<option value="${userDetail.getUserid()}">${userDetail.getUserid()}</option>
					</c:forEach>
				</select>
				 <input type = "submit" value="Add Friend" align="left"/></nobr>
				</form>
				
</body>
</html>