<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <%@ page import="db.data.DBReader"%>
 <%@ page import="db.data.DBWriter"%>
 <%@ page import="upload.*"%>
 <%@ page import="java.io.File"%>
 <%@ page import="account.DbConention"%>
 <%@ page import="java.util.ArrayList"%>
 
 

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

if(request.getParameter("t") != null && request.getParameter("t")!=""){
	String arr =request.getParameter("pages");
	ArrayList<String> pageNames= new ArrayList<String>();
	StringBuilder stringBuilder = new StringBuilder();
	int j=0;
	for(int i=0; i<= arr.length()-1;i++){
		if(arr.charAt(i)==','){
			pageNames.add(j,stringBuilder.toString());
			j++;
			stringBuilder.setLength(0);
		}else if(i== arr.length()-1){
			stringBuilder.append(arr.charAt(i));
			pageNames.add(j,stringBuilder.toString());
			stringBuilder.setLength(0);
		}else{
			stringBuilder.append(arr.charAt(i));
		}
	}
	DBWriter dbwA = new DBWriter();
	for(int i=1;i<=pageNames.size();i++){
		dbwA.updateStelle(pageNames.get(i-1), i);
	}
%>
  <jsp:forward page="/controllcenter/SortPages.jsp" > 
     <jsp:param name="t" value=""/>
	</jsp:forward>
<%
} else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style><%@include file="/stylesheet/stylesheet.css"%></style>
<script>

var source;
function allowDrop(ev) {
	  ev.preventDefault();
	}
	
function isbefore(a, b) {
    if (a.parentNode == b.parentNode) {
        for (var cur = a; cur; cur = cur.previousSibling) {
            if (cur === b) {
                return true;
            }
        }
    }
    return false;
}

function dragenter(e) {
    var targetelem = e.target;
    if (targetelem.nodeName == "TD") {
       targetelem = targetelem.parentNode;   
    }  
	if (isbefore(source, targetelem)) {
        targetelem.parentNode.insertBefore(source, targetelem);
    } else {
        targetelem.parentNode.insertBefore(source, targetelem.nextSibling);
    }
}

function dragstart(e) {
    source = e.target;
    e.dataTransfer.effectAllowed = 'move';
}
function drop(ev){
	ev.target.appendChild(source);
}
</script>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<div >
<jsp:include page="pageTable.jsp" />
</div>
<p id = "massage">Bringen Sie die Seiten in richtiger Reihenfolge, indem Sie sie aus der linken Tabelle in der rechten Tabelle zeihen</p>
<div class="center">
<div class="row ">
	<div  class="column cencon" ondrop="drop(event)" ondragover="allowDrop(event)" style="padding-bottom: 40px !important; height: auto; width: 45%; padding: 10px; ">
		<%
		String data;
		String [][] csvData;

		DBReader cr = new DBReader();
		cr.readContent("Select * from menuData WHERE isPublished is true ORDER BY menuData.stelle ASC ");

		csvData=cr.arrData;
		data ="";
		for(int i = 0; i< 20;i++){
			if(csvData[i][1]!=null){
				data+="<div class=\"row\" draggable=\"true\" ondragenter=\"dragenter(event)\" ondragstart=\"dragstart(event)\"> <input type=\"number\" class=\"column\" style=\"width: 10%; height; 100%;	\"value =\"\"><p class=\"column\" style=\"width: 70%; margin: 0;\">"+csvData[i][3]+"</p></div>";
			}
		}
		%>
		<%=data %>
	</div>
	<form action="<%= request.getContextPath()%>/controllcenter/SortPages.jsp?t=submit" onsubmit="setArray()"  method="post">
	<div class="column cencon" id="divform" ondrop="drop(event)" ondragover="allowDrop(event)" style=" padding-bottom: 40px !important; height: auto; width: 45%; padding: 10px;">
	
	</div>
	<input type="hidden" name="pages" id="pages"/>
	<input class="center" type="submit" value="Okay">
	</form>
</div>
</div>
<script>

var divform = document.getElementById("divform");

function setArray(){
	var inArray = document.getElementById("pages");
	var arr=[];	
	for(var i=0;i< divform.children.length ;i++){
		arr.push(divform.children[i].children[1].innerText);
	}
	inArray.value=  arr;
}


var source;
function allowDrop(ev) {
	ev.preventDefault();
}
	
function isbefore(a, b) {
    if (a.parentNode == b.parentNode) {
        for (var cur = a; cur; cur = cur.previousSibling) {
            if (cur === b) {
                return true;
            }
        }
    }
    return false;
}

function dragenter(e) {
    var targetelem = e.target;
    if (targetelem.nodeName == "DIV") {
       targetelem = targetelem.parentNode;
    }  
    if(!divform.firstChild){
		if (isbefore(source, targetelem)) {
      	  	targetelem.parentNode.insertBefore(source, targetelem);
    	} else {
        	targetelem.parentNode.insertBefore(source, targetelem.nextSibling);
    	}
	}
}

function dragstart(e) {
    source = e.target;
    e.dataTransfer.effectAllowed = 'move';
}

function drop(ev){
	if(!ev.firstChild){
		ev.target.appendChild(source);
	}
	var j= divform.children.length;
	for(var i=0; i<= j-1; i++){
		divform.children[i].children[0].value= i+1;
	}
}

</script>
</body>
</html>

<%
}
%>

