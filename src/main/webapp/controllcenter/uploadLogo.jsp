<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "upload.*" %>
<%@ page import = "db.data.*" %>
<%
DBReader dbr = new DBReader();
dbr.readAtrtribut("Select value from  webAttributs");
String attribut[]= dbr.attribut;

if (session.getAttribute("connecte") == null
        || !((String) session.getAttribute("connecte"))
                .equals("true")) {
    String redirectURL = request.getContextPath()+"/account";
    response.sendRedirect(redirectURL);
}else{
	
	String filePath = application.getRealPath("/res/");
	   // Verify the content type
	   String contentType = request.getContentType();
	   String massege ="";
	   
	   
	   UploadPage up = new UploadPage(filePath, contentType, request);
	   RemoveFile rf = new RemoveFile();
	   
	   if(rf.remove(application.getRealPath("/")+attribut[8])){
		   up.uploadFile();
		   massege= up.getInfo();
	   }else{
		   massege="es scheint eine Datei bereits zu existiern!";
	   }
	   DBWriter dbwA = new DBWriter();
	   dbwA.updateAttribut( "res/"+up.fileName, "logoPath");
%>
      <jsp:forward page="/controll" > 
     <jsp:param name="t" value="upload"/>
      <jsp:param name="type" value="logo"/> 
      <jsp:param name="massaLogo" value="<%= massege %>"/>
	</jsp:forward>
<%
}
%>