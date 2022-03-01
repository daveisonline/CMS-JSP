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
   UnzipPage uz = new UnzipPage();
   
   UploadPage up = new UploadPage(filePath, contentType, request);
   up.uploadFile();
   massege= up.getInfo();     
         //unzip Page and delet Zip file:
         uz.unzip(filePath +up.fileName, filePath);
      // search for *.html file in unziped dir:
      File dir = new File(filePath+uz.newFileName);
      File [] files = dir.listFiles(new FilenameFilter() {
          @Override
          public boolean accept(File dir, String name) {
              return name.endsWith(".html");
          }
      });
      
      String htmlFileN="";
      
      for (File htmlFile : files) {
    	  htmlFileN = htmlFile.getName();
    	    
      }
      
      filePath="res/pages/"+uz.newFileName+"/"+htmlFileN;
      String pageName =uz.newFileName;
      String pageFolderPath = "res/pages/"+uz.newFileName;
      RemoveFile rf = new RemoveFile();
      if(rf.remove(application.getRealPath("/res/pages/")+up.fileName)){
      %>
      <jsp:forward page="upload.jsp" > 
     <jsp:param name="t" value="dbForm"/>
     <jsp:param name="type" value="page"/>
     <jsp:param name="filePath" value="<%=filePath %>"/>
     <jsp:param name="pageName" value="<%=pageName %>"/>
     <jsp:param name="pageFolderPath" value="<%= pageFolderPath %>"/>
      <jsp:param name="massa" value="<%= massege %>"/>
	</jsp:forward>
	<%
      }
}
	%>