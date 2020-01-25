<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="petvillage.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<form method="post" name="brickform" action="gameover.jsp">
			Level : <input type="text" id="levelTextbox" name="levelTextBox" style="width:70px;"> <br>
			Score : <input type="text" id="scoreTextbox" name="scoreTextBox" style="width:70px;"> <br>
			<input type="text" id="gameTextbox" name="gameTextbox" value="brickout" style="visibility:hidden">
			<canvas id="brickoutCanvas" width="480" height="320"></canvas><br>
			<script type="text/javascript" src="brickout.js"></script>
			<input type="button" id="startBtn" value="Start" onclick="startBtnClicked();">
		</form>
		<%
			DBCP dbcp=new DBCP();
			ArrayList<GameEntity> list=dbcp.getBrickList();
			int rank=1;
			
			for(GameEntity e:list)
			{
				String id=e.getUser_id();
				int score=e.getBrick_out();
				
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
</body>
</html>
