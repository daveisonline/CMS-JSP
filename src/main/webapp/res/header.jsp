<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seitenkopf</title>
<style type="text/css">
body {
	text-align: center;
	overflow: hidden;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: <%=session.getAttribute("menuBgColor") %>;
	height: <%=session.getAttribute("headerHight") %>; 
}
.Titel_Name {
	text-align: left;
}
.tabelle_titel {
	text-align: left;
}
.headerTabel{
	width: 1%;
	border: 0;
	margin: 0 auto;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
var menuWidth2 = "<%=session.getAttribute("menuWidth") %>";
$(function() {
	setInterval(function() {
		document.getElementById("header").innerHTML = localStorage.getItem("title");
		if(window.innerWidth<1000){
			document.getElementById('headercontainer').style.width = window.innerWidth+"px";
		}else{
			document.getElementById('headercontainer').style.width = window.innerWidth- parseInt(menuWidth2,10)+"px";
		}
  }, 100);
  });
</script>
</head>

<body >
<div style="align-items: center; display: flex;" id="headercontainer">
	<table class="headerTabel">
  <tbody><tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1 align="center" id="header" name="header" style="  font-size: <%=session.getAttribute("fontSizeHeader")%>; color: <%=session.getAttribute("fontColor")%>; font-family: <%=session.getAttribute("fontFamily")%>;">  </h1>
    </td>
  </tr>


</tbody>
</table>
</div>
</body>
</html>