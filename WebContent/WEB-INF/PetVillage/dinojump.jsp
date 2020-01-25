<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@page import="petvillage.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
<style>
.divTable{
	display: table;
	width: 100%;
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
	width: 30px;
}
.divRankCell{
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
	width: 20px;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group;
}
.divContainer{
	width: 100%;
	Height: 1000;
}
</style>
</head>
<body>
<div class="divContainer">
	<form method="post" action="gameover.jsp" name="dinoform">
		Level : <input type="text" id="levelTextbox" name="levelTextBox" style="width:70px;"> <br>
		Score : <input type="text" id="scoreTextbox" name="scoreTextBox" style="width:70px;"> <br>
		<input type="text" id="gameTextbox" name="gameTextbox" value="dinojump" style="visibility:hidden"><br>
		<canvas id="dinojumpCanvas" width="480" height="320"></canvas> <br>
		<input type="button" id="startBtn" value="Start" onclick="startBtnClicked();">
	</form>
		
	<script type="text/javascript" src="dinojump.js"></script>
	<div class="divTable">
	<div class="divTableBody">
		<div class="divTableCell">&nbsp;Ranking</div>
		<div class="divTableCell">&nbsp;User Name</div>
		<div class="divTableCell">&nbsp;Score</div>
	
	<%
		DBCP dbcp=new DBCP();
		ArrayList<GameEntity> list=dbcp.getDinoList();
		int rank=1;
		
		for(GameEntity e:list)
		{
			String id=e.getUser_id();
			int score=e.getDino_jump();
			
		%>
                <div class="divTableRow">
                        <div class="divTableCell">&nbsp;<%=rank%></div>
                        <div class="divTableCell">&nbsp;<%=id %></div>
                        <div class="divTableCell">&nbsp;<%=score %></div>
                </div>
                <%
			rank+=1;
			if(rank>5)
				break;
                }
                %>
        </div>
	</div>
</div>			
</body>
</html>
