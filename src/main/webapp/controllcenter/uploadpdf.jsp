<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "upload.*" %>

<%
if (session.getAttribute("connecte") == null
        || !((String) session.getAttribute("connecte"))
                .equals("true")) {
    String redirectURL = request.getContextPath()+"/account";
    response.sendRedirect(redirectURL);
}else{
	
	String filePath = application.getRealPath("/res/pages/");
   // Verify the content type
   String contentType = request.getContentType();
   String massege ="";
   
   UploadPage up = new UploadPage(filePath, contentType, request);
   up.uploadFile();
   massege= up.getInfo();   
      
      filePath="res/pages/"+up.fileName;
      String pageName =up.fileName;
      String newFolderName= up.fileName.replaceFirst("[.][^.]+$", "");
      MakeDir md= new MakeDir();
      
      String pageFolderPath = "res/pages/"+newFolderName;
      md.mkdir(application.getRealPath("/")+pageFolderPath);
      MoveFileToDir mf = new MoveFileToDir();
      mf.moveFile(application.getRealPath("/")+filePath, application.getRealPath("/")+pageFolderPath+"/"+up.fileName);
      filePath = pageFolderPath+"/"+up.fileName;
      %>
      <jsp:forward page="upload.jsp" > 
     <jsp:param name="t" value="dbForm"/>
     <jsp:param name="type" value="pdf"/>
     <jsp:param name="filePath" value="<%=filePath %>"/>
     <jsp:param name="pageName" value="<%=pageName %>"/>
     <jsp:param name="pageFolderPath" value="<%= pageFolderPath %>"/>
      <jsp:param name="massa" value="<%= massege %>"/>
	</jsp:forward>
	<%
}
	%>