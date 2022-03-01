<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="db.data.DBReader"%>
<%@ taglib uri="/WEB-INF/lib/ButtonForm.jar" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Tab</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid <%=session.getAttribute("menuBgColor") %>;
  background-color: <%=session.getAttribute("menuBgColor") %>;
  width: 100%;
  height: 300px;
  
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 5px 16px;
  width: 100%;
  
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #f1f1f1;
  
  margin: 0px 0px 0px 14px;
  border-radius: 15px;
}
html, body
{
margin: 0;
padding: 0;
text-align: center;
background-color: <%=session.getAttribute("menuBgColor") %>;
}

</style>
</head>
<body>
<%
String conPath = request.getContextPath()+"/";
String resPath = "pages/";

String [][]menuData;

DBReader cr1 = new DBReader();
cr1.readContent("Select * from menuData menuData ORDER BY menuData.stelle ASC ");
cr1.readAtrtribut("Select value from  webAttributs");
String attribut[]= cr1.attribut;
menuData=cr1.arrData;
%>
<p>
<img src="<%= request.getContextPath()+"/"+session.getAttribute("logoPath")%>" alt="LOGO" width="<%=session.getAttribute("logoWidth") %>" height="<%=session.getAttribute("logoHeight") %>"></p><%--260 --%>
<p>&nbsp;</p>
<p>
<div class="tab">
<%
if(session.getAttribute("connecte") == null|| !((String) session.getAttribute("connecte")).equals("true")){
	%>
	<form:ButtonForm urlAction="<%=conPath+menuData[0][2] %>"
	 	value="<%= menuData[0][5]%>" 
	 	name="<%= menuData[0][3] %>" 
	 	className="tablinks" 
	 	fontSize='<%=session.getAttribute("fontSizeMenu").toString() %>' 
	 	fontFamilie='<%= session.getAttribute("fontFamily").toString() %>' 
	 	fontColor='<%= session.getAttribute("fontColor").toString() %>' 
	 	published="true"/>
	<%

for(int i = 1; i< menuData.length;i++){
	if(menuData[i][1]!=null){
		if(menuData[i][6].equalsIgnoreCase("1")){
			%>
			<form:ButtonForm urlAction="<%=conPath+menuData[i][2] %>"
			 	value="<%= menuData[i][5]%>" 
			 	name="<%= menuData[i][3] %>" 
			 	className="tablinks" 
			 	fontSize='<%=session.getAttribute("fontSizeMenu").toString() %>' 
			 	fontFamilie='<%= session.getAttribute("fontFamily").toString() %>' 
			 	fontColor='<%= session.getAttribute("fontColor").toString() %>' 
			 	published="true"/>
			<%
		}
	}
}

}else{
	%>
	<form:ButtonForm urlAction="<%=conPath+menuData[0][2] %>"
	 	value="<%= menuData[0][5]%>" 
	 	name="<%= menuData[0][3] %>" 
	 	className="tablinks" 
	 	fontSize='<%=session.getAttribute("fontSizeMenu").toString() %>' 
	 	fontFamilie='<%= session.getAttribute("fontFamily").toString() %>' 
	 	fontColor='<%= session.getAttribute("fontColor").toString() %>' 
	 	published="true"/>
	<%
	for(int i = 1; i< menuData.length;i++){
		if(menuData[i][1]!=null){
			if(menuData[i][6].equalsIgnoreCase("1")){
				%>
				<form:ButtonForm urlAction="<%=conPath+menuData[i][2] %>"
				 	value="<%= menuData[i][5]%>" 
				 	name="<%= menuData[i][3] %>" 
				 	className="tablinks" 
				 	fontSize='<%=session.getAttribute("fontSizeMenu").toString() %>' 
				 	fontFamilie='<%= session.getAttribute("fontFamily").toString() %>' 
				 	fontColor='<%= session.getAttribute("fontColor").toString() %>' 
				 	published="true"/>
				<%
			}else{
				%>
				<form:ButtonForm urlAction="<%=conPath+menuData[i][2] %>"
		 		value="<%= menuData[i][5]%>" 
		 		name="<%= menuData[i][3] %>" 
		 		className="tablinks" 
		 		fontSize='<%=session.getAttribute("fontSizeMenu").toString() %>' 
		 		fontFamilie='<%= session.getAttribute("fontFamily").toString() %>' 
		 		fontColor="#d1270d" 
		 		published="true"/>
				<%
			}
		}
	}
}

%>

</div>
<script>
function openPage(evt, h) {
  var i, tablinks;
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  evt.currentTarget.className += " active";
  var x = evt.currentTarget.getAttribute('name');
  
  if (typeof(Storage) !== "undefined") {
	  // Store
	  localStorage.setItem("title", x);
	  localStorage.setItem("bgc", evt.currentTarget.value);
	} else {
	  alert("Sorry, your browser does not support Web Storage...");
	}
}

// Get the element with id="defaultOpen" and click on it
  //the event occurred
document.addEventListener("DOMContentLoaded", function(event) { 
  //we ready baby
  setTimeout(() => {
	  document.getElementById("defaultOpen").click();
  }, 1000);
	
});
//document.getElementById("defaultOpen").click();
</script>
   
</body>
</html> 
