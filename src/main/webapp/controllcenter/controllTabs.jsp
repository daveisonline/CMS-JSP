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
<title>Welcome Admin</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<div class ="center">
<h1 class="contentCenter">Welkommen in Administration</h1>
<hr>
<br>
<form method="post" action="${pageContext.request.contextPath }/controll" class="contentCenter">
  <button type="submit" name="t" value="t">
    Ihre Seite anpassen
  </button>
</form>
<hr>
<br>
<form method="post" action="${pageContext.request.contextPath }/controll" class="contentCenter">
  <button  type="submit" name="t" value="upload">
    inhalt hochladen
  </button>
</form>
<hr>
<br>
<form method="post" action="${pageContext.request.contextPath }/controll" class="contentCenter">
  <button type="submit" name="t" value="changePass">
    Kennwort ändern
  </button>
</form>
<form method="get" action="${pageContext.request.contextPath }/account" class="contentCenter">
  <button type="submit" name="action" value="logout">
    sich auslogen
  </button>
</form>
</div>
</body>
</html>
</c:if>




<c:if test="${param.t == 'sbf' }">
<!DOCTYPE html>
<html>
<head>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >
<div class="tab">
	<form action="<%= request.getContextPath()%>/controllcenter/editPageContent.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Seitenübersicht</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/changePageName.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Seiten umbenennen</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/SortPages.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Seiten ordenen</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/publishPages.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Seiten veröffentlichen</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/bgColor.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Hintergründfarbe</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/font.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Schrift</button>
  </form >
  <form action="${pageContext.request.contextPath }/controllcenter/sizeOfMenuHeader.jsp" method="post" target="frame">
  <button class="tablinks" onclick="openTab(event)">Seitenaussicht</button>
  </form >
  <form action="${pageContext.request.contextPath }/controll" method="post" >
  <button class="tablinks" onclick="openTab(event)">zurück</button>
  </form >
  <form action="${pageContext.request.contextPath }/account" method="get" >
  <button class="tablinks" onclick="openTab(event)" type="submit" name="action" value="logout">auslogen</button>
  </form >
</div>
<div class="tabcontent">
<iframe src="<%= request.getContextPath()%>/controllcenter/editPageContent.jsp" id="frame" name="frame" class="frame" ></iframe>
</div>

<script>
function openTab(evt) {
  var i, tablinks;
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  evt.currentTarget.className += " active";
}
</script>
   
</body>
</html> 
</c:if>


<c:if test="${param.t == 'upload'}">
<!DOCTYPE html>
<html>
<head>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >
<div class="tab">
	<form action="<%= request.getContextPath()%>/controllcenter/upload.jsp?t=uploadPage" method="post" target="frame">
  <button class="tablinks" onclick="openCity(event)">seite Hochladen</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/upload.jsp?t=uploadPdf" method="post" target="frame">
  <button class="tablinks" onclick="openCity(event)">PDF Hochladen</button>
  </form >
  <form action="<%= request.getContextPath()%>/controllcenter/upload.jsp?t=uploadLogo" method="post" target="frame">
  <button class="tablinks" onclick="openCity(event)">logo ändern</button>
  </form >
  
  <form action="${pageContext.request.contextPath }/controll" method="post" >
  <button class="tablinks" onclick="openCity(event)">zurück</button>
  </form >
  <form action="${pageContext.request.contextPath }/account" method="get" >
  <button class="tablinks" onclick="openCity(event)" type="submit" name="action" value="logout">auslogen</button>
  </form >
</div>
<div class="tabcontent">
<iframe src="<%= request.getContextPath()%>/controllcenter/upload.jsp?t=uploadPage" id="frame" name="frame" class="frame" ></iframe>
</div>
<script>
function openCity(evt ) {
  var i, tablinks;
  
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  evt.currentTarget.className += " active";
}
</script>
</body>
</html>
</c:if>
