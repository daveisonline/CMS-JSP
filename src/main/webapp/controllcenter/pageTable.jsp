<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="db.data.DBReader"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  word-wrap: break-word;
word-break: break-all;
}

tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
.center {
  border: 3px solid #73AD21;
  margin: auto;
	display: flex;
  justify-content: center;
  align-items: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="center">
	<h3 >Veröffentlichte Seiten</h3><br>
</div>
<div >
<%
String data ="";
String [][]csvData;

DBReader cr = new DBReader();
cr.readContent("Select * from menuData WHERE isPublished is true ORDER BY menuData.stelle ASC ");

csvData=cr.arrData;
data="<table style=\"width:800px\" class=\"center\"><tr>"
													+"<th>Stelle:</th>"
													+"<th>Link:</th>"
													+"<th>Name:</th>"
													+"<th>Ordner</th>"
													+"<th>Farbe</th>"+
													"</tr>";
for(int i = 0; i< 20;i++){
	if(csvData[i][1]!=null){
		data+="<tr>";
		  data+="<td>"+ csvData[i][1]+"</td>";
		  data+="<td>"+ csvData[i][2]+"</td>";
		  data+="<td>"+csvData[i][3] +"</td>";
		  data+="<td>"+csvData[i][4] +"</td>";
		  data+="<td><div style=\" background-color:"+csvData[i][5] +"; height: 40px; width: 40px;\"></div></td>";
		data+="</tr>";
	}
}
data+="</table>";
%>
<%=data %>
</div>
</body>
</html>