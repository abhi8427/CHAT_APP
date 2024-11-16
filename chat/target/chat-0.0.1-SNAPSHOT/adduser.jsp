<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*, java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>LetUsTalk.com/Admin Console/Adding User</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
</head>  
<body>
<table width="700" height="500" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
  <tr>
    <td width="200" rowspan="2" valign="top">
	<%@ include file="menu.jsp"%> 	
	</td>
    <td height="328" bgcolor="#476BC0" valign="top">
	  <p>&nbsp;</p><p>&nbsp;</p> 
	<div align="center">
	<table align="center"><tr>
	<td height="25" width="120" bgcolor="#993366">Add Users</td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="viewuser.jsp">View Users</a></td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="AdminChatServlet">Configure Rooms</a></td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="logout.jsp">Logout</a></td></tr></table>
	<br /><br />Enter New User Information.</div>
	<form name="form" method="post" action="adduserhandler.jsp">
	<table align="center">
	<tr>
	<td>Name</td><td><input type="text" size="25" name="name" class="smalltext"/></td>
	</tr>
	<tr>
	<td>E Mail </td><td><input type="text" size="25" name="email" class="smalltext"/></td>
	</tr>
	<tr>
	<td>Login id</td><td><input type="text" size="25" name="loginid" class="smalltext" /></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" size="25" name="password" class="smalltext" /></td>
	</tr>
	<tr>
	<td>Type</td><td>
	<select name="type" class="smalltext">
	<option value="Admin">Admin</option>
	<option value="User">User</option>
	</select></td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" name="submit" value="Submit" />
	<input type="reset" name="reset" value="Reset" />
	</td></tr></table>
	</form>
	</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
</table></body></html>