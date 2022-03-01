<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="robots" content="index,follow">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
html{
	overflow-x: hidden;
}
</style>
<script  type="text/javascript">
function iframeloaded(){
	var main = document.getElementById('main');
	main.style.backgroundColor= localStorage.getItem("bgc");
	var menuwidth = parseInt("<%=session.getAttribute("menuWidth") %>",10);
	document.getElementById('main-frame').style.backgroundColor= localStorage.getItem("bgc");
	document.getElementById('main-frame').contentWindow.document.getElementsByTagName('body')[0].style.backgroundColor= localStorage.getItem("bgc");
	document.getElementById('main-frame').contentWindow.document.getElementsByTagName('body')[0].style.alignItems= "center";
	document.getElementById('main-frame').contentWindow.document.getElementsByTagName('body')[0].style.display="flex";
	if(window.innerWidth< 1000){
		document.getElementById('main-frame').style.width = window.innerWidth+"px";
		document.getElementById('main-frame').style.left = "0";
	}else{
		document.getElementById('main-frame').style.width = window.innerWidth-menuwidth+"px";
	}
}
</script>
<body>
<jsp:include page="header.jsp" />
<div id="main"  Style="position: absolute; overflow-x: hidden; top: <%=session.getAttribute("headerHight") %>; display: block; left: 0; right: 0; bottom: 0;">
	 <iframe src="<%=session.getAttribute("firstPageLink") %>" name="main-frame" onload="iframeloaded()" id="main-frame" style=" scrollbar-width: none; overflow:hidden;  display: block; top: 0; left:<%=session.getAttribute("menuWidth") %>; bottom: 0; width: 1000px; height: 100%; margin: 0 auto; border: none;" title="Inhalt" ></iframe>
</div>
</body>
 <script>
 $(function() {
	setInterval(function() {
		var iframeWidth;
		var menuwidth = parseInt("<%=session.getAttribute("menuWidth") %>",10);
		var main = document.getElementById('main');
		
		iframeWidth = document.getElementById('main').clientWidth;
		if(window.innerWidth< 1000){
			document.getElementById('main-frame').style.paddingLeft = "0";
			document.getElementById('main-frame').style.marginLeft= "0";
			document.getElementById('main-frame').style.width = window.innerWidth+"px";
			main.style.width=window.innerWidth +"px";
		}else if((window.innerWidth-menuwidth)<1000){
			main.style.width= window.innerWidth-menuwidth +"px";
			document.getElementById('main-frame').style.width =window.innerWidth-menuwidth+11+"px";
			document.getElementById('main-frame').style.paddingLeft = "0px";
		}else{
			main.style.width= window.innerWidth-menuwidth +"px";
			document.getElementById('main-frame').style.width =(iframeWidth-1000)/2+1010+"px";
			document.getElementById('main-frame').style.paddingLeft = (iframeWidth-1000)/2+"px";
		}
  }, 100);
  });
</script>
</html>