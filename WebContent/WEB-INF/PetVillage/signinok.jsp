<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
	<script>alert("�α׾ƿ� �Ͻðڽ��ϱ�?.");</script>
	<% 	session.removeAttribute("userid");
	}


	if(request.getMethod().equals("POST")){
		String userid=request.getParameter("userid");
		String passwd= request.getParameter("passwd");						
	
		if(!dbcp.isPasswd(userid, passwd)){%>
			<script>alert("��й�ȣ�� �ٸ��ϴ�.");histoy.go(-1);</script>
		<%}else{
			session.setAttribute("userid",userid);
			session.setAttribute("passwd",passwd);
			dbcp.updatePoint(userid);
		%>
			<script>alert("���ΰ�ħ�� �ؾ� �α���/�α׾ƿ��� ���������� �˴ϴ�.");</script>
		<%
		}
	}
	%>
	<%
	response.sendRedirect("main.jsp");
	%>

</body>
</html>
