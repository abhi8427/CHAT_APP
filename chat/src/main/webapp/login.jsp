<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.Date, java.sql.*, javax.sql.*,  java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>LetUsTalk - Login Console</title>
<%
String type=(String)request.getParameter("type");
%>
<link href="mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="700" height="500" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
  <tr>
    <td width="200" rowspan="2" valign="top">
		<%@ include file="menu.jsp"%> 
	</td>
    <td height="328" bgcolor="#476BC0" valign="top">
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
	<div align="center"><font size="+2"><%=type%> Login</font>	<br/><br/>
	<%
	DateFormat df=new SimpleDateFormat("EEEE, dd MMMM, yyyy");
	String date=df.format(new Date());
	out.println(date+"&nbsp;&nbsp;<br>");
	%></div>
	<form method="post" action="loginhandler.jsp">
	<p>&nbsp;</p>	
	<p align="center">Enter Login id and password.</p>
	<table align="center" bgcolor="#728DCF">
	<tr><td>Login id</td>
	<td><input name=loginid size=20 class="smalltext"></td>
	</tr>
	<tr><td >Password</td>
	<td><input name=password type="password" size=20 class="smalltext"></td>
	</tr>
	<tr><td >Type</td>
	<td><%=type%><input type="hidden" name="type" value="<%=type%>"></input></td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="Login"/></td>
	</tr>
	</table></form>
	</td></tr> 
	<tr><td>&nbsp;</td></tr>
</table></body></html>