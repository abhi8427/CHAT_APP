<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.util.*, kogent.*, java.text.*, java.net.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>LetUsTalk! - Select Chat Room</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
<%
String chRoomPath = (String)session.getAttribute("chRoomPath");
String roomListPath = (String)session.getAttribute("roomListPath");
String adminChatPath = (String)session.getAttribute("adminChatPath");
%>
</head>
<body>
<table width="700" height="500" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
  <tr>
    <td width="200" rowspan="2" valign="top">
		<%@ include file="menu.jsp"%> 
	</td>
    <td height="328" bgcolor="#476BC0" align="center" valign="top">
	<p>&nbsp;</p>
	  <p>&nbsp;</p> <p>&nbsp;</p>
	<div align="center"><font size="+2">Select Your Room.</font></div>
	<br /><br />
	<div align="left">
	<%
	DateFormat df=new SimpleDateFormat("EEEE, dd MMMM, yyyy");
	String date=df.format(new java.util.Date());
	out.println(date+"&nbsp;&nbsp;<br>");
	String login = (String)session.getAttribute("login");
	out.println("User: <font color=yellow>"+ (String)session.getAttribute("user")+". <br><a href=logout.jsp>Logout</a></font>");
	%></div>
	<%       
        String s = request.getParameter("expand");
        String s1 = (String)session.getAttribute("profileName");
        if(s1 == null)
        {
            s1 = "";
        }
	%>
	<table border="0" align="center">
	<form method="post" action="<%=chRoomPath%>">
	<%	
	HashMap hashmap = (HashMap)getServletContext().getAttribute("roomList");
	if(hashmap == null){
		out.println("<tr><td>No Rooms configured.</td></tr>");
	}
	else{
	%>
	<tr>
	<td><br />Your Login id i.e. "<%=session.getAttribute("loginid")%>" will be used while chatting.
	<input name=profileName type="hidden" value="<%=session.getAttribute("loginid")%>"></td>
	</tr>
	<tr><td colspan="2" align="left">Select your Chat Room.</td></tr>
	<tr><td colspan="2" align="left">
	<%
		Iterator iterator = hashmap.keySet().iterator();
		while(iterator.hasNext()){
			String s2 = (String)iterator.next();
			ChatRooms  chatroom = (ChatRooms )hashmap.get(s2);
			String s3 = roomListPath + "?expand=" + URLEncoder.encode(s2);
			s3 = response.encodeURL(s3);
			%>
			<br><input type=radio name=roomName value="<%=s2%>" <%=((s != null && s.equals(s2)) ? " CHECKED" : "")%>>
			<a href="<%=s3%>"> <%=s2%> </a>
			<%
			if(s != null && s.equals(s2)){
				if(chatroom.getDescription().length() == 0){
					out.println("<br><div class=smallesttext>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;There is no Subject available.</div>");
				} 
				else{
					out.println("<br><div class=smallesttext>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;About: "+chatroom.getDescription()+"</div>");		}
			}
		}
		%>
	</td></tr>
	<tr><td colspan="2" align="center"><input type=submit value="Enter the Room"/></td></tr>
	</form>
	<%}%>
	</table>
	</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
</table></body></html>
