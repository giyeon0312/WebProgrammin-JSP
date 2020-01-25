<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>processUser</title>
</head>
<body>
	<jsp:useBean id="usr" class="petvillage.UserEntity" scope="page" />
	<jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />

	
	
	<jsp:setProperty name="usr" property="id" />
	<jsp:setProperty name="usr" property="passwd" />
	<jsp:setProperty name="usr" property="email" />
	
	
	<%		
		dbcp.insertUser(usr);
		dbcp.insertGame(request.getParameter("id"));
		response.sendRedirect("signin.html");		
	%>
</body>
</html>
