<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="db.data.DBReader"%>
    
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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<br>
<h1 class="center"> Hintergrungfarben </h1>
<hr>
<form class="center" action="${pageContext.request.contextPath }/controll" method="post">
  <label for="favcolor">Hintergrungfarbe von Menubar:</label>
  <input type="color" id="bgcolorValue" name="menuBgColorValue" value="<%=attribut[1] %>">
  <input type="submit" name="menubgcolor" value="change color">
</form>
</body>
</html>