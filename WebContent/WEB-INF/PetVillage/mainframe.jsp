<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ page import="java.util.ArrayList,petvillage.BoardEntity,java.io.*" %>

<!DOCTYPE html>

<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>메인 페이지</title>

	<style>

	

      @font-face {

         font-family: 'OTEnjoystoriesBA';

         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/OTEnjoystoriesBA.woff') format('woff');

         font-weight: normal;

         font-style: normal; 

    }

    

	</style>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">

 

    <!-- Bootstrap core CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>

<body>

<div class="jumbotron p-4 p-md-5 text-white rounded bg-dark" style="font-family:OTEnjoystoriesBA;">

    <div class="col-md-6 px-0">

      <h1 class="display-4 font-italic">WELCOME TO PET VILLAGE</h1>

      <p class="lead my-3">동물을 사랑하는 사람들을 위한 공간입니다. 사랑하는 동물들에 관한 이야기를 나누어 주세요:)</p>

      <p class="lead mb-0"><a href="#" class="text-white font-weight-bold">Continue reading...</a></p>

    </div>

  </div>

  

  <jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />

   <%	ArrayList<BoardEntity> list=dbcp.getBoardList();

      		int counter=list.size();
      		String saveDirectory="../UploadFile/";
      		String filename;
      		

   	%>

  <div class="row mb-2">
 <% 	if(counter>0){
		int tmp=4;
	   for(BoardEntity brd:list){
		   if(tmp--<=0)
			   break;
		   
		   if(!brd.getBoard_type().equalsIgnoreCase("Event/Notice")){
			
		      		if(brd.getImage()!=null)
		      			filename=brd.getImage();
		      		else if(brd.getVideo()!=null)
		      			filename=brd.getVideo();
		      		else 
		      			filename="CantFindImage.jpg";
		      		
			      	String file=saveDirectory+filename;
			   
			   
		   %>

 
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary"><%=brd.getBoard_type() %></strong>
          <h3 class="mb-0"><%=brd.getTitle() %></h3>
          <div class="mb-1 text-muted"><%=brd.getWdate() %></div>
          <p class="card-text mb-auto"><%=brd.getContents() %></p>
          <a href="boardview.jsp?board_id=<%=brd.getBoard_id()%>" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <%if (brd.getVideo()==null){ %>
              <img src=<%= file %> style="width:200;height:250px;">
             <%}else{%>
             <video src=<%=file %> style="width:200;height:250px;" autoplay></video>
             <%} %>
        </div>
      </div>
    </div>
  </div>
</div>

<%			}//end of if

		   }

	   			} %>

<main role="main" class="container">

  <div class="row">

    <div class="col-md-8 blog-main">

      <h3 class="pb-4 mb-4 font-italic border-bottom">

        현재 진행중인 이벤트

      </h3>

<%	    for(BoardEntity brd:list){

		   

		   if(brd.getBoard_type().equalsIgnoreCase("Event/Notice")){

		   %>

      <div class="blog-post">

        <h2 class="blog-post-title"><%=brd.getTitle() %></h2>

        <p class="blog-post-meta"><%=brd.getWdate() %> by <%=brd.getUser_id() %></p>

 

        
        <blockquote>

          <p><%=brd.getContents() %></p>
        </blockquote>

        
      </div><!-- /.blog-post -->

 

      <nav class="blog-pagination">

        <a class="btn btn-outline-primary" href="boardview.jsp?board_id=<%=brd.getBoard_id()%>">자세히</a>

        <a class="btn btn-outline-secondary disabled" href="#" tabindex="-1" aria-disabled="true">Newer</a>

      </nav>

<%

			}

		 } %>

    </div><!-- /.blog-main -->

 

    <aside class="col-md-4 blog-sidebar">

      <div class="p-4 mb-3 bg-light rounded">

        <h4 class="font-italic">About</h4>

        <p class="mb-0">Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>

      </div>

	

		<div class="p-4 mb-3 bg-light rounded">

        <h4 class="font-italic">광고문의</h4>

        <p class="mb-0">광고 및 이벤트 문의는<em>admin-petvillage@cbnu.com</em>으로 문의 바랍니다. </p>

      </div>

 

 

    </aside><!-- /.blog-sidebar -->

 

  </div><!-- /.row -->

 

</main><!-- /.container -->

</body>

</html>