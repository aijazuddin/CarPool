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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Car Pool</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleHomeSpecific.css">
	<style>
	
	input[type="text"]{
	background-color:#E3E7EC;
	height: 40px;
	border: 3px dashed #ccc;
	}
	
	small.input[type=submit] {
    width: 10%;
    background-color: #6F7A88;
    font-family: "verdana";
    font-size: 17px;
    align: right;
    color: white;
    padding: 5px 8px;
    margin: 1px 0;
    margin-right: 50px;
    border: none
    border-radius: 9px;
    cursor: pointer;
    float: center;
}
.right {
    position: absolute;
    right: 0px;
    width: 15px;
   
}

	p{
	padding-top: 0px;
    padding-right: 30px;
    padding-bottom: 0px;
    padding-left: 140px;
	}
		hr {
  border:none;
  border-top:2px dashed blue;
  }
  		hr.side {
  border:none;
  border-top:2px dashed #2C3E50;
    }
  tr.body > td
{
    
    text-align: left;
    font-family:"Bookman Old Style";
    font-size: 18px;
    

}
 tr.heading > td
{
    text-align: left;
    font-family:"Bookman Old Style";
    font-size: 19px;
    font-weight: 450;
}
div {
    font-size:0; /* The white space has no size, therefore isn't visible. */
	margin-bottom: 0;
	align:left;
}
  </style>
	
</head>
<body bgcolor="#2C3E50">
<center><h1><font color=white>welcome ${fname}   ${lname} !!</font></h1></center>
<table bgcolor="#EEF1F5	" align=center width="990" height="620"  >
	<tr height = 50>
			<td>
			<table border="1" class="homeHeading" width="990">
			<tr><div>
			<td width="440">
				<%-- <c:forEach var="j" begin="1" end="7">  
  				 Item <c:out value="${users}"/><p>  
				</c:forEach> --%> 
				<form action="/CarPool/addFriend" method="post"><nobr> 
				<input type="hidden", value=${userid }  name="userid"/>
				<select name = "friend">
					<c:forEach items="${users }" var="user">
						<option value="${user.getUserid()}">${user.getUserid()}</option>
					</c:forEach>
				</select><input type = "submit" value=" Add Friend " align="left" class="home"/>
				 </nobr>
				</form>
			</td>
			<td>
			<form action="/CarPool/group" method="post"><nobr>
				<input type="hidden", name="userid", value=${userid }>
				<select name = "group">
					<option value="start">Start A Group</option>
					<option value="manage">Manage Groups</option>
					
				</select>
				<input type = "submit" value=" submit " align="left" width= "30%"/>
				
				</form></nobr>
			</td>
			<td><form action="accountSettings" method="post"><nobr>
				<input type="hidden", name="userid", value=${userid }>
				<select name = "AccountSettings">
					<option value="settings">Account settings</option>
					<option value="logout">Logout</option>
				</select>
				<input type = "submit" value=" submit " align="left" class="home" width="30%"/></nobr>
				</form>
			</td>
			</div>
			</tr>
			</table>
			</td>
					
	</tr>
	<tr>
		<td>
		<p align="center">
			<textarea rows="4" cols="90" name="WritePost" form="PublishPost" ></textarea>
			<form action="/CarPool/PublishPost" method="post" id="PublishPost"  align="right">
				<input type="hidden" value=${userid} name="userid"></input>
				To:
				<!--  Here we have fetch data from DB -->
				 <select name = "friend">
					<c:forEach items="${connections }" var="connection">
						<option value="${connection.getConnectionTo()}">${connection.getConnectionTo()}</option>
					</c:forEach>
				</select>
				<input type="submit" width=150 height=300 value="  post  " class="home"> </input>
			</form>
		</p>
		
		</td>
		
	</tr><tr class="heading" bgcolor="#2C3E50" height="28"><td colspan="2"><font color="white"> From &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Post</font> </td></tr>
	<c:forEach items="${postMap }" var="postmap">
	
		<tr class="body"><td colspan="2"  bgcolor="#BDC0E3">
		<font face="verdana" color=#2C3E50 size="4">
		<b>${postmap.post.getPostedBy()}:</b>&nbsp;&nbsp;&nbsp;&nbsp;
		</font>(${postmap.post.getPostedAt()})
		
		<p>${postmap.post.getMessage()}</p>
				<hr class="side" width="350" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<u>Comments:</u>(&nbsp;${postmap.comment.size()}&nbsp;)<br>
				<c:forEach items="${postmap.comment}" var="comment">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font face="verdana" color=#2C3E50 size="3">		${comment.getUserid()} :</font>
					${comment.getContent()}<br>
				</c:forEach>
				
				
		
		<form action="comment">
			<div align="right"><input type="text" name="content" size=50></input>
			<input type="hidden" name="postId" value="${postmap.post.getPostId()}"></input>
			<input type="hidden" name="userid" value="${userid}"></input>
			<input type="submit"  name="comment" value="  Comment  "/></div>
		</form>
		</td></tr>
	</c:forEach>
	<tr><td>
	
		</td></tr>
</table>

</body>
</html>