<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <%@ page import="db.data.DBReader"%>
 <%@ page import="db.data.DBWriter"%>
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
	String arr =request.getParameter("pagesToPublish");
	String arrStat =request.getParameter("stat");
	ArrayList<String> pageNames= new ArrayList<String>();
	ArrayList<String> stat= new ArrayList<String>();
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
	j=0;
	for(int i=0; i<= arrStat.length()-1;i++){
		if(arrStat.charAt(i)==','){
			stat.add(j,stringBuilder.toString());
			j++;
			stringBuilder.setLength(0);
		}else if(i== arrStat.length()-1){
			stringBuilder.append(arrStat.charAt(i));
			stat.add(j,stringBuilder.toString());
			stringBuilder.setLength(0);
		}else{
			stringBuilder.append(arrStat.charAt(i));
		}
	}
	DBWriter dbwA = new DBWriter();
	for(int i=1;i<=pageNames.size();i++){
		dbwA.publishPages(pageNames.get(i-1),Integer.parseInt(stat.get(i-1)));
	}
%>
  <jsp:forward page="/controllcenter/publishPages.jsp" > 
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
</head>
<body>
<div>
<jsp:include page="pageTable.jsp" />
</div>
<div class="center">
<h3>alle Seiten</h3>
</div>
<div class="center">
<div class="row ">
	<form action="<%= request.getContextPath()%>/controllcenter/publishPages.jsp?t=submit" onsubmit="setArray()"  method="post">
	<div class="column" id="divform" ondrop="drop(event)" ondragover="allowDrop(event)" style=" padding-bottom: 40px !important; height: auto; width: 95%; padding: 10px;">
	<%
		String data;
		String [][] csvData;

		DBReader cr = new DBReader();
		cr.readContent("Select * from menuData ORDER BY menuData.stelle ASC ");

		csvData=cr.arrData;
		data ="";
		for(int i = 0; i< 20;i++){
			if(csvData[i][1]!=null){
				data+="<div class=\"row\"><input type=\"checkbox\" id=\"scales\" name=\"\"><label for=\"\">"+csvData[i][3]+"</label></div>";
			}
		}
		%>
		<%=data %>
	</div>
	<input type="hidden" name="pagesToPublish" id="pagesToPublish"/>
	<input type="hidden" name="stat" id="stat"/>
	<input class="center" type="submit" value="Okay">
	</form>
</div>
</div>
<script type="text/javascript">
var divform = document.getElementById("divform");

function setArray(){
	var inArray = document.getElementById("pagesToPublish");
	var stat = document.getElementById("stat");
	var arr=[];
	var arrStat=[];
	for(var i=0;i< divform.children.length ;i++){
		if(divform.children[i].children[0].checked){
			arrStat.push('1');
		}else{
			arrStat.push('0')
		}
		arr.push(divform.children[i].children[1].innerText);
	}
	inArray.value=  arr;
	stat.value=arrStat;
}
</script>
</body>
</html>
<%
}
%>