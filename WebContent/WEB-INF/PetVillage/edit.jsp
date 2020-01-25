<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="petvillage.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>글쓰기 페이지</title>

    <!--<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">-->
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">


    <!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!--   check.js파일에는 폼에 입력한 갑들이 있는지 맞는지 확인하는 메소드들이 들어있다,외장형으로 첨부함 -->
<script type="text/javascript" src="check.js"></script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      @font-face {
         font-family: 'OTEnjoystoriesBA';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/OTEnjoystoriesBA.woff') format('woff');
         font-weight: normal;
         font-style: normal; 
    }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
    <link href="signin.css" rel="stylesheet">
  </head>
  
  <body class="text-center">
  
 
    <div class="container">

 <!-- 여기까지 네비바 -->   

  <%
    String user_id="";
    String board_type="";
    String title="";
    String image="";
    String video="";
    String contents="";
    
    String board_id=request.getParameter("board_id");//detail.jsp에서 넘어오도록 

    //등록이 아닌경우(수정/삭제)이미 작성된 내용을 보여준다
    if(board_id!=null){
    	int boardnum=Integer.parseInt(board_id);
    	DBCP dbcp=new DBCP();
    	BoardEntity brd=dbcp.getBoard(boardnum);
    	
    	board_type=brd.getBoard_type();
    	title=brd.getTitle();
    	image=brd.getImage();
    	video=brd.getVideo();
    	contents=brd.getContents();
    }
    
    %> 
    
    <form method="post" name="boardform" action="processBoard.jsp" enctype="Multipart/form-data" style="text-align:left">
 <!--menu:등록,수정,삭제를 구분하는 매개변수 ,default가 insert이다 -->
 <input type="hidden" name="menu" value="insert">
 <input type="hidden" name="board_id" value="<%=board_id%>">
  <div class="form-group">
    <label for="exampleFormControlInput1">title</label>
    <input type="text" class="form-control" name="title" placeholder="Title" value="<%=title %>">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">type</label>
    <select class="form-control" name="board_type" value="<%=board_type%>">
      <option>Dog</option>
      <option>Cat</option>
      <option>Bird</option>
      <option>Else</option>
      <option>Event/Notice</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlFile1">image file input</label>
    <input type="file" class="form-control-file" name="image" value="<%=image %>">
  </div>
  <div class="form-group">
    <label for="exampleFormControlFile1">video file input</label>
    <input type="file" class="form-control-file" name="video" value="<%=video %>">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">text area</label>
    <textarea class="form-control" name="contents" rows="10"> <%=contents %></textarea>
  </div>
  
  <%if(board_id==null){%>
  <button type="submit" class="btn btn-primary"  value="share">share</button>
  <%}else{ %>
  <input type="button" class="btn btn-primary" onClick="updateCheck()" value="edit">
  <input type="button" class="btn btn-primary" onClick="deleteCheck()" value="delete">
  <%} %>
</form>


</div>

</body>
</html>
