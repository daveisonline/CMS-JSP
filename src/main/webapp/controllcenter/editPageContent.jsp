<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="db.data.DBReader"%>
 <%@ page import="db.data.DBWriter"%>
 <%@ page import="upload.*"%>
 <%@ page import="java.io.File"%>
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
}
%>

<c:if test="${param.t == null}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
<script>
function myFunction() {
	if(document.getElementById("method").value=="add"){
		document.getElementById("link").style.display = "inline-block";
		document.getElementById("path1").style.display = "inline-block";
		document.getElementById("path2").style.display = "inline-block";
		document.getElementById("lastPos").style.display = "none";
	}else if(document.getElementById("method").value=="delet"){
		document.getElementById("link").style.display = "none";
		document.getElementById("path1").style.display = "none";
		document.getElementById("path2").style.display = "none";
		document.getElementById("lastPos").style.display = "none";
		document.getElementById("farbe").style.display = "none";
		document.getElementById("newPos").style.display = "inline-block";
	}else if(document.getElementById("method").value== "update"){
		document.getElementById("link").style.display = "inline-block";
		document.getElementById("path1").style.display = "inline-block";
		document.getElementById("path2").style.display = "inline-block";
		document.getElementById("lastPos").style.display = "inline-block";
		document.getElementById("farbe").style.display = "inline-block";
		document.getElementById("newPos").style.display = "inline-block";
	}
}
function invisTabel(){
	document.getElementById("link").style.display = "none";
	document.getElementById("path1").style.display = "none";
	document.getElementById("path2").style.display = "none";
	document.getElementById("lastPos").style.display = "none";
	document.getElementById("farbe").style.display = "none";
	document.getElementById("newPos").style.display = "none";
}
</script>
</head>
<body onload="invisTabel()">
<div>
<jsp:include page="pageTable.jsp" />
</div>
<div  class="center">
<form   id="form"  action="${pageContext.request.contextPath }/controllcenter/editPageContent.jsp"  method="post" accept-charset="UTF-8">
  <label class="contentCenter"for="method" >Aus der Liste: </label>
  <select class="contentCenter"id="method" name="method"  onchange="myFunction()">
  	 <option value="">--none--</option>
 	 <option value="delet">delet</option>
 	 <option value="update">update</option>
  </select><br>
  <table id="table">
  <tr>
  	<th> <label style="width: 51px;" for="newPos">Welchen? </label> </th>
  	<th> <label style="width: 201px;" for="link">Link:</label></th>
  	<th> <label style="width: 141px;" for="path1">Name:</label></th>
  	<th> <label style="width: 201px;" for="path2">Ordner</label></th>
  	<th> <label style="width: 100px;" for="farbe">Farbe:</label></th>
  	<th> <label style="width: 51px;" for="lastPos">die Stelle: </label></th>
  </tr>
  <tr>
  	<td><input style="width: 51px;" type="number" id="newPos" name="newPos" value="newPos"></td>
  	<td><input style="width: 201px;" type="text" id="link" name="link" value="link"></td>
  	<td><input style="width: 141px;" type="text" id="path1" name="path1" value="Name"></td>
  	<td><input style="width: 201px;" type="text" id="path2" name="path2" value="Ordner"></td>
  	<td><input style="width: 100px;" type="color" id="farbe" name="farbe" value=""></td>
  	<td><input style="width: 51px;" type="number" id="lastPos" name="lastPos" value="lastPos"></td>
  </tr>
  </table><br>
  <input class="contentCenter" type="submit" value="Okay">
</form>

</div>
</body>
</html>
</c:if >

<c:if test="${param.method == 'update'}">
<% 
DBWriter cw = new DBWriter();
cw.updateRow(Integer.parseInt(request.getParameter("newPos")),
				request.getParameter("link"),
				request.getParameter("path1"),
				request.getParameter("path2"),request.getParameter("farbe"),Integer.parseInt(request.getParameter("lastPos")));
System.out.println("test  !!!");
%>
	<jsp:forward page="editPageContent.jsp">
        <jsp:param name="method" value=""/>
    </jsp:forward>
</c:if>





<c:if test="${param.method == 'delet'}">
<% 
DBReader dbRR = new DBReader();
dbRR.readRow(Integer.parseInt(request.getParameter("newPos")));
String path =dbRR.row[3];
RemoveFile rf = new RemoveFile();
File file = new File(application.getRealPath("/")+path);
rf.deleteDir(file);

DBWriter dw1 = new DBWriter();
dw1.removeRow(Integer.parseInt(request.getParameter("newPos")));
%>
<jsp:forward page="editPageContent.jsp">
	<jsp:param name="method" value=""/>
</jsp:forward>
</c:if>
