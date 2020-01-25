<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="petvillage.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />
	
	<%
	String level=request.getParameter("levelTextBox");
	String scr= request.getParameter("scoreTextBox");
	String uid=(String)session.getAttribute("userid");
	int score=Integer.parseInt(scr);
	String game=request.getParameter("gameTextbox");
	
	if(game.equals("dinojump"))
	{
		dbcp.updateDinoPoint(uid, score);
		dbcp.updatePoint(uid);
		response.sendRedirect("dinojump.jsp");
	}
	else if(game.equals("brickout"))
	{
		dbcp.updateBrickPoint(uid, score);
		dbcp.updatePoint(uid);
		response.sendRedirect("brickout.jsp");
	}


	
	%>
	
	
</body>
</html>
