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
	<script>alert("�α׾ƿ� �Ͻðڽ��ϱ�?");</script>
	<% 	session.removeAttribute("userid");
	
	}


	if(request.getMethod().equals("POST")){
		String userid=request.getParameter("userid");
		String passwd= request.getParameter("passwd");						
	
	if(!dbcp.isPasswd(userid, passwd)){%>
		<script>alert("���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");histoy.go(-1);</script>
	<%}else{
		session.setAttribute("userid",userid);
		session.setAttribute("passwd",passwd);
	}
	}

	response.sendRedirect("main.jsp");
%>

</body>
</html>
