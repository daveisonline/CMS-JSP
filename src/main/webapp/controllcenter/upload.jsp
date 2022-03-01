<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
 <%@ page import="db.data.DBReader"%>
 <%@ page import="db.data.DBWriter"%>
 <%@ page import="account.DbConention"%>

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
%>

<c:if test="${param.t == 'uplo'}">
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}

tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
</style>
<meta charset="UTF-8">
<title>Welkomen Admin</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >

<h1>Hochladen eine neue Seite</h1><br>

<jsp:include page="pageTable.jsp" />

<div class="center">
<h3  >massage: <%=request.getParameter("massa") %></h3>
	<form  action = "${pageContext.request.contextPath }/controllcenter/UploadPage.jsp" method = "post" enctype = "multipart/form-data">
         <input type = "file" id="pagefile" name = "file" accept=".zip,.rar,.7zip,.pdf" size = "50" />
  		<br />
         <input type = "submit" id="page" value = "Datei Hochladen" />
   	</form>

<h3  >massage: <%=request.getParameter("massa") %></h3>
	<form action = "${pageContext.request.contextPath }/controllcenter/uploadpdf.jsp" method = "post" enctype = "multipart/form-data">
         <input type = "file" id="pagefile" name = "file" accept=".pdf" size = "50" />
  		<br />
         <input type = "submit" id="page" value = "Datei Hochladen" />
   	</form>
   	
<h3  >massage: <%=request.getParameter("massaLogo") %></h3>
	<form  action = "${pageContext.request.contextPath }/controllcenter/uploadLogo.jsp" method = "post" enctype = "multipart/form-data">
         <input type = "file" id="logofile" accept=".png,.svg" name = "file" size = "50" />
  		<br />
         <input type = "submit" id="logo" value = "Logo Hochladen" />
   	</form>
   	</div>
   	<hr>
   	
   	<button onclick="" type="button"><a href="${pageContext.request.contextPath }/controll">Zurück</a></button>
</body>

 <script>
	setInterval(function() {
		var logo = document.getElementById("logo");
        var logofile = document.getElementById("logofile");

        if (logofile.files.length == 0) {
            logo.style.visibility = "hidden"
        } else {
            logo.style.visibility = "visible"
        }
        var page = document.getElementById("page");
        var pagefile = document.getElementById("pagefile");

        if (pagefile.files.length == 0) {
        	page.style.visibility = "hidden"
        } else {
        	page.style.visibility = "visible"
        }
  }, 800);
</script>
</html>
</c:if>



<c:if test="${param.t == 'uploadPage'}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welkomen Admin</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >
<jsp:include page="allPageTable.jsp" />
<h1 class="center">Neue Seite Hochladen</h1><br>
<h3  class="center">massage: <%=request.getParameter("massa") %></h3>
	<form  class="center" action = "${pageContext.request.contextPath }/controllcenter/UploadPage.jsp" method = "post" enctype = "multipart/form-data">
         <input type = "file" id="pagefile" name = "file" accept=".zip,.rar,.7zip" size = "50" />
  		<br />
  		
         <input type = "submit" id="page" value = "Datei Hochladen" />
         
   	</form>
</body>
 <script>
	setInterval(function() {
		var page = document.getElementById("page");
        var pagefile = document.getElementById("pagefile");
        if (pagefile.files.length == 0) {
        	page.style.visibility = "hidden"
        } else {
        	page.style.visibility = "visible"
        }
  }, 200);
</script>
</html>
</c:if>

<c:if test="${param.t == 'uploadPdf'}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welkomen Admin</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >
<jsp:include page="allPageTable.jsp" />
<h1 class="center">PDF Hochladen</h1><br>
   	<h3  class="center">massage: <%=request.getParameter("massa") %></h3>
	<form class="center" action = "${pageContext.request.contextPath }/controllcenter/uploadpdf.jsp" method = "post" enctype = "multipart/form-data">
         <input type = "file" id="pdffile" name = "pdffile" accept=".pdf" size = "50" />
         
  		<br />
         <input type = "submit" id="pdf" value = "Datei Hochladen" />
   	</form>
</body>
 <script>
	setInterval(function() {
		var pdf = document.getElementById("pdf");
        var pdffile = document.getElementById("pdffile");
        if (pdffile.files.length == 0) {
        	pdf.style.visibility = "hidden"
        } else {
        	pdf.style.visibility = "visible"
        }
  }, 200);
</script>
</html>
</c:if>


<c:if test="${param.t == 'uploadLogo'}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welkomen Admin</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >
<jsp:include page="showLogo.jsp" />
<h1 class="center">Logo ändern</h1><br>
<h3  class="center">massage: <%=request.getParameter("massaLogo") %></h3>
	<form  class="center" action = "${pageContext.request.contextPath }/controllcenter/uploadLogo.jsp" method = "post" enctype = "multipart/form-data">
         <input type = "file" id="logofile" accept=".png,.svg" name = "file" size = "50" />
         
  		<br />
         <input type = "submit" id="logo" value = "Logo Hochladen" />
   	</form>
</body>
 <script>
	setInterval(function() {
		var logo = document.getElementById("logo");
        var logofile = document.getElementById("logofile");
        if (logofile.files.length == 0) {
        	logo.style.visibility = "hidden"
        } else {
        	logo.style.visibility = "visible"
        }
  }, 200);
</script>
</html>
</c:if>


<c:if test="${param.t == 'dbForm'}">
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  position: relative;
  word-wrap: break-word;
}
hr{
	width: 600px
}
tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
.center {
  margin: auto;
  border: 3px solid #73AD21;
  padding: 10px;
}
label{
word-wrap: break-word;
word-break: break-all;
}
</style>
<meta charset="UTF-8">
<title>Welkomen Admin</title>
</head>
<body >

<h1 class="center">Hochladen eine neue Seite</h1><br>
<jsp:include page="pageTable.jsp" />
<hr>

<form  action="${pageContext.request.contextPath }/controllcenter/upload.jsp?t=52" style="width: 800px; margin: auto;" method="post" accept-charset="UTF-8">
  <table style="width:100%;">
  <tr>
  	<th ><label style="width: 60px;" for="newPos">Stelle auf Menubar: </label></th>
  	<th ><label style="width: 213px;" for="link">Link:</label></th>
  	<th ><label style="width: 123px;" for="pageFolderPath">Ordner: </label></th>
  	<th ><label style="width: 203px;" for="pageName">Seite benennen:</label></th>
  	<th ><label style="width: 136px;" for="bgc">Hintergrungfarbe:</label></th>
  </tr>
  <tbody>
  <tr >
  	<td > <input style="width: 60px;" type="number" id="newPos" name="newPos" value="20"></td>
  	<td > <input style="width: 213px;" type="text" id="link" name="link" value="<%=request.getParameter("filePath") %>"></td>
  	<td > <input style="width: 133px;" type="text" id="pageFolderPath" name="pageFolderPath" value="<%=request.getParameter("pageFolderPath") %>"></td>
  	<td > <input style="width: 203px;" type="text" id="pageName" name="pageName" value="<%=request.getParameter("fileName") %>"></td>
  	<td > <input style="width: 136px;" type="color" id="bgc" name="bgc" value="null"></td>
  </tr>
  </tbody>
  </table><br>
  <input type="hidden" name="type" value="<%=request.getParameter("type") %>"/>
  <input class="center" type="submit" value="Fortfahren">
</form>
</body>
</html>
</c:if>



<c:if test="${param.t == '52'}">
<% 
DBWriter cw = new DBWriter();
    	    cw.insertRow(Integer.parseInt(request.getParameter("newPos")),
    	    							  request.getParameter("link"),
    	    							  request.getParameter("pageName"),
    	    							  request.getParameter("pageFolderPath"),
    	    							  request.getParameter("bgc"));
%>
<jsp:forward page="/controll" > 
	     <jsp:param name="t" value="upload"/>
	     <jsp:param name="type" value='<%=request.getParameter("type") %>'/>
	     <jsp:param name="massa" value="Upload war erfolgreich"/>
</jsp:forward>
</c:if>
<%
}
%>

