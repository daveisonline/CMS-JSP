<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <%@ page import="db.data.DBReader"%>
 <%

DBReader dbr = new DBReader();
dbr.readAtrtribut("Select value from  webAttributs");
String attribut[]= dbr.attribut;

if (session.getAttribute("connecte") == null
        || !((String) session.getAttribute("connecte"))
                .equals("true")) {
    String redirectURL = request.getContextPath()+"/account";
    response.sendRedirect(redirectURL);
}else{
%>

 <c:set var = "logoPath" scope = "session" value ="<%=attribut[8] %>"/>
 <c:set var = "logoWidth" scope = "session" value ="<%=attribut[9] %>"/>
 <c:set var = "logoHeight" scope = "session" value ="<%=attribut[10] %>"/>
 <c:set var = "menuBgColor" scope = "session" value ="<%=attribut[1] %>"/>
 <c:set var = "menuWidth" scope = "session" value ="<%=attribut[6] %>"/>
 <c:set var = "headerHight" scope = "session" value ="<%=attribut[7] %>"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<p class="contentCenter" style="background-color: <%=session.getAttribute("menuBgColor") %>; width: <%=session.getAttribute("menuWidth") %>; height: <%=session.getAttribute("headerHight") %>;"  >
<img class="contentCenter" src="<%= request.getContextPath()+"/"+session.getAttribute("logoPath")%>" alt="LOGO" width="<%=session.getAttribute("logoWidth") %>" height="<%=session.getAttribute("logoHeight") %>"></p><%--260 --%>

</body>
</html>
<%
}
%>