<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<!--  <meta name="verify-v1" content="wn2e98k3/4JD55r/y8epjE2gutRlNwtrnQpX5U2oR14=">
<meta name="msvalidate.01" content="909C5D3553ED80D82D15BC6C1520259D"> -->
<title>public Title</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript"> 
$(function() {
	setInterval(function() {
		var bodyWidth = window.innerWidth;
		var mainFrame = document.getElementById("mainframe1");
		var menuFrame = document.getElementById("menu");
		mainFrame.width = bodyWidth+"px";
		mainFrame.height= window.innerHeight+"px";
		menuFrame.height= window.innerHeight+"px";
  }, 200);
  });
</script>
<style>

html {
    scrollbar-width: none;
    overflow: -moz-scrollbars-none;
}
::-webkit-scrollbar {
    width: 0;  /* Remove scrollbar space */
    background: transparent;  /* Optional: just make scrollbar invisible */
    display: none;
}
@-moz-document url(chrome://browser/content/places/places.xul) {
.hidevscroll-scrollbar {
	display: none !important;
}
}

@-moz-document url-prefix() { /* Disable scrollbar Firefox */
            html{
              scrollbar-width: none;
            }
          }
          body {
            margin: 0; /* remove default margin */
            scrollbar-width: none; /* Also needed to disable scrollbar Firefox */
            -ms-overflow-style: none;  /* Disable scrollbar IE 10+ */
            overflow-y: scroll;
          }
          body::-webkit-scrollbar {
            width: 0px;
            background: transparent; /* Disable scrollbar Chrome/Safari/Webkit */
          }
          
/* Optional: show position indicator in red */
.menu {
  float: left;
  width: 256px;
  border: none;
  position: absolute;
}

.menuline {
  width: 35px;
  height: 5px;
  background-color: black;
  margin: 6px 0;
}
.menuIcon{
  	position: absolute; 
	margin-left: 20px;
	margin-top: 20px; 
  display: none;
}
.activ { 
  display: block !important;
}
body{
	width: 100%;
	height: 100%;
	margin:0px;
	padding:0px;
	overflow:hidden
}

.main {
  float: left;
  padding: 0;
  overflow: hidden;
  border: none;
  position: absolute;
  margin-left: <%=session.getAttribute("menuWidth") %>;
}

@media screen and (max-width:1000px) {
  /* For mobile phones: */
  .menuIcon{
  display: block;
}
.menu {
  display: none;
}
.main{
	margin-left: 0;
}
}
</style>
<script>
function mainLoaded(){
	var bodyWidth = window.innerWidth-2;
	var mainFrame = document.getElementById("mainframe1");
	var menuFrame = document.getElementById("menu");
	mainFrame.height= window.innerHeight+"px";
	menuFrame.height= window.innerHeight+"px";
	mainFrame.width = (bodyWidth)+"px";
}

function menuIconClicked(ev){
	menuIcon = document.getElementById("menu-icon");
	
	var menuFrame = document.getElementById("menu");
	if (menuFrame.className === "menu") {
		menuIcon.style.left= "<%=session.getAttribute("menuWidth") %>";
		menuFrame.className += " activ";
	  } else {
		  menuIcon.style.left= "12px";
		  menuFrame.className = "menu";
	  }
}
</script>
</head>
<body onload="mainLoaded()"  style="position: relative;" id="outer-container">
	<iframe  class="main" src="res/mainFrame.jsp" name="mainFrame1" id="mainframe1" title="mainFrame1" ></iframe>
	
	<div class="menuIcon" onclick="menuIconClicked()" id="menu-icon">
		<div class="menuline"></div>
		<div class="menuline"></div>
		<div class="menuline"></div>
	</div>
	<iframe  class="menu" src="res/menu_Tabs.jsp"width="<%=session.getAttribute("menuWidth") %>" name="menu" scrolling="no" noresize="noresize"  id="menu" title="leftFrame"></iframe>

</body>
</html>