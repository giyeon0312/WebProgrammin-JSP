<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="petvillage.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Sign Up</title>

    <!--<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">-->
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">


    <!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

      @font-face {
         font-family: 'OTEnjoystoriesBA';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/OTEnjoystoriesBA.woff') format('woff');
         font-weight: normal;
         font-style: normal; 
    }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
  </head>
  <body class="text-center">
    <div class="container">
    <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
    </div>
    </header>
    
  <br><br><br>
  <form style="text-align:left" action="processUser.jsp" method="post">
  <div class="form-inline"  style="margin:10px">
	 <div class="form-group mb-2" width="100px">
    <input type="text" readonly class="form-control-plaintext" value="ID"  >
	</div>
  <div class="form-group mx-sm-3 mb-2">
    <label for="inputPassword2" class="sr-only">ID</label>
    <input type="text" class="form-control" name="id" placeholder="ID">
  </div>
  </div>
  <!--end of confirm id  -->
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="passwd" placeholder="Password">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
    <input type="text" class="form-control" name="email" placeholder="email@example.com">  
    </div>
  </div>
  <center> <button type="submit" class="btn btn-primary mb-2">Create account</button></center>
</form>
<a href="main.jsp"  style=" text-decoration:none; color:#ffc107" style=" width:94.21px; height:47.6px"><button class="btn btn-lg btn-outline-warning"  href="main.jsp" style="margin-top:0px; margin-bottom:120px " >Home</button></a></a>
 
  
  
    </div>
    
 </body>
 </html>
    
    
