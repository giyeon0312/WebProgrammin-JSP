<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="petvillage.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>signinok</title>
</head>
<body>
<jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />


<%

	if(session.getAttribute("userid")!=null){%>
	<script>alert("로그아웃 하시겠습니까?");</script>
	<% 	session.removeAttribute("userid");
	
	}


	if(request.getMethod().equals("POST")){
		String userid=request.getParameter("userid");
		String passwd= request.getParameter("passwd");						
	
	if(!dbcp.isPasswd(userid, passwd)){%>
		<script>alert("아이디와 비밀번호가 일치하지 않습니다.");histoy.go(-1);</script>
	<%}else{
		session.setAttribute("userid",userid);
		session.setAttribute("passwd",passwd);
	}
	}

	response.sendRedirect("main.jsp");
%>

</body>
</html>
