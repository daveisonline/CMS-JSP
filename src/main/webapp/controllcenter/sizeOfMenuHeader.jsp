<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<h1 class="center"> die Größe ändern </h1>
<hr>
<form class="center" action="${pageContext.request.contextPath }/controll" method="post">
<label for="widthValue" >Menu bereite: </label>
<select id="widthValue" name="widthValue">
  	 <option value=""><%=attribut[6] %></option>
  	 <%
  	 String data, y;
  	data="";

 	 y="px";
   	for(int i=100;i<800;i++){
   		data+="<option value=\""+i+y+"\">"+i+y+"</option>";
   	}
   	 %>
   	 <%=data %>
  </select><br>
  <input type="submit" name="menuWidth" value="Okay">
</form>

<form class="center" action="${pageContext.request.contextPath }/controll" method="post">
<label for="headerHeightValue" >Kopfhöhe: </label>
<select id="headerHeightValue" name="headerHeightValue">
  	 <option value=""><%=attribut[7] %></option>
  	 <%
  	data="";
  	 y="px";
   	for(int i=50;i<300;i++){
   		data+="<option value=\""+i+y+"\">"+i+y+"</option>";
   	}
   	 %>
   	 <%=data %>
  </select><br>
  <input type="submit" name="value" value="Okay">
</form>

<form class="center" action="${pageContext.request.contextPath }/controll" method="post">
<label for="logoWidth" >Logo breite: </label>
<select id="logoWidth" name="logoWidth">
  	 <option value=""><%=attribut[9] %></option>
  	 <%
  	data="";
  	 y="px";
   	for(int i=50;i<300;i++){
   		data+="<option value=\""+i+y+"\">"+i+y+"</option>";
   	}
   	 %>
   	 <%=data %>
  </select><br>
  <label for="logoHeight" >Logo Höhe: </label>
<select id="logoHeight" name="logoHeight">
  	 <option value=""><%=attribut[10] %></option>
  	 <%
  	data="";
  	 y="px";
   	for(int i=50;i<300;i++){
   		data+="<option value=\""+i+y+"\">"+i+y+"</option>";
   	}
   	 %>
   	 <%=data %>
  </select><br>
  <input type="submit" name="logo" value="Okay">
  <label for="" >vorschau:</label>
</form>

<jsp:include page="showLogo.jsp" />
</body>
</html>