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
<title></title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<h1 class="center"> Schriftbearbeitung </h1>
<hr>
<form class="center" action="${pageContext.request.contextPath }/controll" method="post">
  <label for="fontColor">Schriftfarbe:</label>
  <input type="color" id="fontColor" name="fontColor" value="<%=attribut[3] %>"><br>
  <label for="fontSizeMenu" >Schriftgröße für Menubar: </label>
  <select id="fontSizeMenu" name="fontSizeMenu">
  	 <option value=""><%=attribut[2] %></option>
  	 <%
  	 String data;
  	data="";
  	 String y= "px";
   	for(int i=12;i<80;i++){
   		data+="<option value=\""+i+y+"\">"+i+y+"</option>";
   	}
   	 %>
   	 <%=data %>
  </select><br>
  <label for="fontSizeHeader" >Schriftgröße für Kopfseite: </label>
  <select id="fontSizeHeader" name="fontSizeHeader">
  	 <option value=""><%=attribut[5] %></option>
  	 <%
  	data="";
   	for(int i=12;i<80;i++){
   		data+="<option value=\""+i+y+"\">"+i+y+"</option>";
   	}
   	 %>
   	 <%=data %>
  </select><br>
  <label for="fontFamily" >Schriftart: </label>
  <select id="fontFamily" name="fontFamily">
  	 <option value=""><%=attribut[4] %></option>
  	 <%
	String fontFamily[]={"Arial, sans-serif","Arial Black, sans-serif","Verdana, sans-serif","Tahoma , sans-serif",
			"Trebuchet MS , sans-serif","Impact, sans-serif","Times New Roman, serif","Didot, serif","Georgia, serif",
			"American Typewriter, serif","Andalé Mono , monospace","Courier , monospace","Lucida Console, monospace",
			"Monaco, monospace","Bradley Hand, cursive","Brush Script MT, cursive","Luminari, fantasy","Comic Sans MS, cursive"};
  	 data="";
  	for(int i=0;i<18;i++){
  		data+="<option value=\""+fontFamily[i]+"\">"+fontFamily[i]+"</option>";
  	}

  	 
  	 %>
  	 <%=data %>
  </select><br>
  <input type="submit" name="font" value="Okay">
</form>

</body>
</html>