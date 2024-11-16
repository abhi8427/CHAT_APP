<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.io.*, javax.sql.*, java.util.*, java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String loginid=request.getParameter("loginid");
	String password=request.getParameter("password");
	String type=request.getParameter("type");
	boolean flag=false;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CHATAPP","root","root");
   	Statement stmt = con.createStatement();
   	String query = "select * from login where loginid ='" + loginid + "' and type='"+type+"'";
   	ResultSet rs = stmt.executeQuery(query);
	while(rs.next())
	{
		String pass= rs.getString(3);
	 	if( pass.equals(password)) {
			flag=true;
			break;
		}		
	}
	if (!flag){
		RequestDispatcher rd=request.getRequestDispatcher("loginfail.jsp");
		rd.forward(request, response);
	}
	else{
	session.setAttribute("login", rs.getString(1));
	session.setAttribute("type", rs.getString(5));
	session.setAttribute("user", rs.getString(2));
	session.setAttribute("loginid", rs.getString(1));	%>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>LetUsTalk - <%=session.getAttribute("type").equals("Admin")?"Admin Console":"User Console"%></title>
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
		<div align="center"><font size="+2">Welcome, <%=session.getAttribute("user")%></font></div>
		<p>&nbsp;</p><p>&nbsp;</p>
		<table align="center" width="200" cellpadding="5" cellspacing="3"> 
		<%
		if ("Admin".equals(type)){
		%>
		<tr><td height="30" bgcolor="#728DCF"><a href="adduser.jsp">Add Users</a></td></tr>
		<tr><td height="30" bgcolor="#728DCF"><a href="viewuser.jsp">View Users</a></td></tr>
		<tr><td height="30" bgcolor="#728DCF"><a href="AdminChatServlet">Configure Rooms</a></td></tr>
		<tr><td height="30" bgcolor="#728DCF"><a href="logout.jsp">Logoff</a></td></tr>
		<%
		} else{
		%>
		<tr><td height="30" bgcolor="#728DCF"><a href="RoomListServlet">Select Chat Rooms</a></td></tr>
		<tr><td height="30" bgcolor="#728DCF"><a href="logout.jsp">Logoff</a></td></tr>
		<%}%>
		</table>
		</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table> 
	</body>
</html>
<% }%>