<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pet Village</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
    </style>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
  </head>
  <body>
  	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script>
		$(document).ready(function(e){
			$('a').click(function(){
				$('#iframe').attr('src',$(this).attr('data-url'));
			})
		});
	</script>
	<script>
		function calcHeight(){
			var the_height=
				 document.getElementById('iframe').contentWindow.
				 document.body.scrollHeight;

				 //change the height of the iframe
				 document.getElementById('iframe').height=the_height;

				 //document.getElementById('iframe').scrolling = "no";
				 document.getElementById('iframe').style.overflow = "hidden";
		}
	</script>
	<script langusge=JavaScript src="check.js"></script>
  
    <div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <!--<div class="col-4 pt-1">-->
      <!--</div>-->
      <!--<div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="#">Large</a>-->
        
        <img src="logo.png" width="60%" height="80%">
		<%
			if(session.getAttribute("userid")==null){
		%>
        <a class="btn btn-sm btn-outline-secondary" href="signin.html">Sign in</a>
		<%	}else{%>
		<a class="btn btn-sm btn-outline-secondary" onClick="signoutCheck()" href="signinok.jsp">Sign out</a>	
		 	<%}
		%>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 text-muted" data-url="mainframe.jsp">Home</a>
      <a class="p-2 text-muted" data-url="dogboard.jsp">Dog</a>
      <a class="p-2 text-muted" data-url="catboard.jsp">Cat</a>
      <a class="p-2 text-muted" data-url="birdboard.jsp">Bird</a>
      <a class="p-2 text-muted" data-url="else.jsp">Else</a>
      <a class="p-2 text-muted" data-url="edit.jsp">Post</a>
      <a class="p-2 text-muted" data-url="brickout.jsp">BrickOut</a>
      <a class="p-2 text-muted" data-url="dinojump.jsp">DinoJump</a>
      <a class="p-2 text-muted" data-url="chatting.html">Chat</a>
      <a class="p-2 text-muted" data-url="mypage.jsp">mypage</a>
    </nav>
  </div>
  
  <iframe id="iframe" src="mainframe.jsp" onload="calcHeight();" frameborder="0" style="width:100%; min-height:500px;"></iframe>
	<footer class="blog-footer">
 	 <p>구기연 201518631@jbnu.ac.kr<br>조기은 jge4786@naver.com</p>
 	 <p>
   	 <a href="#">Back to top</a>
 	 </p>
	</footer>
</body>
</html>

