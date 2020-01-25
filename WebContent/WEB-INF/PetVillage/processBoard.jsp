<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="petvillage.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>processBoard</title>
</head>
<body>

	<jsp:useBean id="dbcp" class="petvillage.DBCP" scope="page" />
	<jsp:useBean id="brd" class="petvillage.BoardEntity" scope="page" />
	
	<% 	
	

	String uploadPath=application.getRealPath("/UploadFile//");
		

	File f=new File(uploadPath);
	if(! f.isDirectory()){
		f.mkdir();
		}
		

		int maxSize=1024*1024*10;
		MultipartRequest multi=null;
		multi =new MultipartRequest(request,uploadPath,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
	String menu = multi.getParameter("menu"); 

	
	// out.println(menu);
	 if(menu.equalsIgnoreCase("delete")||menu.equalsIgnoreCase("update")){ 

 		String board_id = multi.getParameter("board_id");
 		int idnum = Integer.parseInt(board_id);
 		
			if ( menu.equals("delete") ) {
				
	
				dbcp.deleteBoard(idnum);
			} else if ( menu.equals("update") ) { 
				

				brd.setBoard_id(idnum);
				brd.setBoard_type(multi.getParameter("board_type"));
				brd.setTitle(multi.getParameter("title"));
				brd.setImage(multi.getFilesystemName("image"));
				brd.setVideo(multi.getFilesystemName("video"));
				brd.setContents(multi.getParameter("contents"));
		
				dbcp.updateBoard(brd);
			}
	
			response.sendRedirect("mainframe.jsp");					 		
		
 	} else {


		brd.setUser_id((String)session.getAttribute("userid"));
		brd.setBoard_type(multi.getParameter("board_type"));
		brd.setTitle(multi.getParameter("title"));
		brd.setImage(multi.getFilesystemName("image"));
		brd.setVideo(multi.getFilesystemName("video"));
		brd.setContents(multi.getParameter("contents"));
		
		
		dbcp.insertBoard(brd);

		response.sendRedirect("mainframe.jsp");					 		
 	} 
%>
</body>
</html>