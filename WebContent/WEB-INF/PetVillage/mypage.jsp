<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="petvillage.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.mypageTable{
	display: table;
	width: 100%;
}
.boardInfo, .userInfo {
	display: table-row;
}
.boardCell {
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
	text-align: center;
}
.userCell{
	display: table-cell;
	padding: 3px 10px;
}
</style>
</head>
<body>
	<%
	DBCP dbcp=new DBCP();
	String uid=(String)session.getAttribute("userid");
	%>
	<div class="mainContainer">
		내 정보<br><hr>
		<%
		UserEntity usr=dbcp.getUserData(uid);
		%>
		<div class="mypageTable">
			<div class="userInfo">
				<div class="userCell">ID: </div>
				<div class="userCell"><%=uid %></div>
			</div>
			<div class="userInfo">
				<div class="userCell">Point: </div>
				<div class="userCell"><%=usr.getPoint() %></div>
			</div>
			<div class="userInfo">
				<div class="userCell">E-Mail: </div>
				<div class="userCell"><%=usr.getEmail() %></div>
			</div>
		</div><br><br>
		내가 쓴 게시글<br><hr>
		<div class="mypageTable">
				<div class="boardInfo">
					<div class="boardCell">&nbsp;Board Type</div>
					<div class="boardCell">&nbsp;Title</div>
					<div class="boardCell">&nbsp;Contents</div>
				</div>
				<%
				ArrayList<BoardEntity> list=dbcp.getIdBoardList(uid);
				for(BoardEntity lst:list)
				{
				%>
				<div class="boardInfo">
						<div class="boardCell">&nbsp;<%=lst.getBoard_type() %></div>
						<div class="boardCell">&nbsp;<%=lst.getTitle() %></div>
						<div class="boardCell">&nbsp;<%=lst.getContents() %></div>
				</div>
				<%
				}
				%>
		</div>
	</div>
</body>
</html>
