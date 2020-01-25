<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,petvillage.BoardEntity,java.io.*" %>
<jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />
<!DOCTYPE html>
<html>
	<head>
		<title>view</title>
		<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<style>
		 @font-face {
         font-family: 'OTEnjoystoriesBA';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/OTEnjoystoriesBA.woff') format('woff');
         font-weight: normal;
         font-style: normal; 
  		  }
    
   		 .show{
    		font-family:OTEnjoystoriesBA; font-size:30px;
  		  }
		</style>
	</head>
	<body>
	<%	String board_id=request.getParameter("board_id");
		int boardnum=Integer.parseInt(board_id);
		BoardEntity brd=dbcp.getBoard(boardnum);
		
		String saveDirectory="../UploadFile/";
  		String filename;
  		if(brd.getImage()!=null)
  			filename=brd.getImage();
  		else if(brd.getVideo()!=null)
  			filename=brd.getVideo();
  		else 
  			filename="CantFindImage.jpg";
  		
      	String file=saveDirectory+filename;
	%>
	
		<div id="container" style="width:800px">
			<div id="titleDiv" style="height:60px;width:800px">
				<div class="show">post# <%=board_id %><br> title:<%=brd.getTitle()%></div>
			</div>
			<hr size="1">
			<div id="postInfo" style="height:50px;width:800px">
				<div id="userInfo" style="float:left">
					<div class="show">posted by <%=brd.getUser_id() %></div>
				</div>
				<div id="boardInfo" style="float:right">
					<div class="show">Date:<%=brd.getWdate() %></div>
				</div>
			</div>
			<br>
			<div id="contentDiv" style="width:800px">
				<div class="show">contents</div><%=brd.getContents() %>
			</div>
			<br>
			<div id="multimedia" style="width:800px">
			 <%if (brd.getVideo()==null){ %>
              <img src=<%= file %> style="width:100%;height:600px;">
             <%}else{%>
             <video src=<%=file %> style="width:100%;height:600px;" autoplay></video>
             <%} %>
			</div>
		</div>
		<%
		String usingId=(String)session.getAttribute("userid");
		if((usingId!=null)&&(usingId.equalsIgnoreCase(brd.getUser_id()))){%>
		<a href="edit.jsp?board_id=<%=brd.getBoard_id() %>">	<button class="btn btn-primary">edit</button></a>
		<%}
		%>
	</body>
</html>