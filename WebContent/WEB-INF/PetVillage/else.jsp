<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ page import="java.util.ArrayList,petvillage.BoardEntity,java.io.*" %>
  <jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>board</title>

    <!--<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">-->
    <!--<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">-->


    <!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/album/">


    <style>
    	img{
    	
    	}
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
    
    <script langusge=JavaScript src="check.js"></script>
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
    <link href="signin.css" rel="stylesheet">
    <link href="album.css" rel="stylesheet">
  </head>
  <body class="text-center">
  
  <%@ page import="java.util.ArrayList,petvillage.BoardEntity,java.io.*" %>

  <main role="main">
  
 

      
      <%	ArrayList<BoardEntity> list=dbcp.getTypeBoardList("Else");
      		int counter=list.size();
      		

      		String saveDirectory="../UploadFile/";
      		String filename;
      		
      	%>
    <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">동물</h1>
      <p class="lead text-muted">양서류 파충류 설치류 등 동물친구들에 대한 이야기를 나누어 보세요</p>
    </div>
 	</section>
      	
      	
    <div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
        <% 	if(counter>0){
	  	
	   for(BoardEntity brd:list){
      		if(brd.getImage()!=null)
      			filename=brd.getImage();
      		else if(brd.getVideo()!=null)
      			filename=brd.getVideo();
      		else 
      			filename="CantFindImage.jpg";
      		
	      	String file=saveDirectory+filename;
			
      %>
      <div class="com-md-4" style="width:30%;margin:5px;">
            <div class="card md-4 shadow-sm">
            <%if (brd.getVideo()==null){ %>
              <img src=<%= file %> style="width:100%;height:225px;">
             <%}else{%>
             <video src=<%=file %> style="width:100%;height:225px;" autoplay></video>
             <%} %>
              <div class="card-body">
                <p class="card-text"><%= brd.getContents() %></p>
                <div class="d-flex">
                  <div class="btn-group">
                    <a href="boardview.jsp?board_id=<%=brd.getBoard_id()%>"><button type="button" class="view-btn">view</button></a>
                  </div>
                  <small class="text-muted"><%=brd.getWdate() %></small>
                </div>
              </div>
            </div>
          </div>


            <%}//end of for

            }//end of if(counter>0) %>

          </div><!-- end of div row -->    
  </div><!-- end of container -->
  </div>
  </main>
  </body>
  </html>
