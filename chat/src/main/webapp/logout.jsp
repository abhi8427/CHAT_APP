<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*, java.text.*" errorPage="" %>
<%
	RequestDispatcher rd;
	rd=request.getRequestDispatcher("chat.jsp");
	session.setAttribute("login", "no");
	session.setAttribute("user", "");
	session.setAttribute("type", "");
	rd.forward(request, response);
%>
