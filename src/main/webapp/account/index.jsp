<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <%
if (session.getAttribute("connecte") == null
        || !((String) session.getAttribute("connecte"))
                .equals("true")) {
	%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Einlogen bitte</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body >

<br>
${error }
<form class="cencon" width="500px"action="${pageContext.request.contextPath }/account" method="post">
  <div class="contentCenter" >
  	<label  for="username">Benutzername:</label>
  	<input  type="text" id="username" name="username" value="username">
  </div><br>
  <div class="contentCenter">
  	<label  for="password">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kennwort:</label>
  	<input  type="password" id="password" name="password" >
  </div><br>
  
  <input class="contentCenter" type="submit" value="Login">
</form>
</body>
</html>
	<%
}else{
	

    String redirectURL = request.getContextPath()+"/controll";
    response.sendRedirect(redirectURL);
	
}
%>
