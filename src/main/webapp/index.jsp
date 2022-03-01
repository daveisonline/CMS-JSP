<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ page import="db.data.DBReader"%>
 
 
 <% 
 String conPath = request.getContextPath()+"/";
 
 String [][]menuData;
 DBReader dbr = new DBReader();
 dbr.readContent("Select * from menuData menuData ORDER BY menuData.stelle ASC ");
 dbr.readAtrtribut("Select value from  webAttributs");
 String attributs[]= dbr.attribut;
 menuData=dbr.arrData;
 
%>
 <c:set var = "bgcolor" scope = "session" value ="<%=attributs[0] %>"/>
 <c:set var = "menuBgColor" scope = "session" value ="<%=attributs[1] %>"/>
 <c:set var = "fontSizeMenu" scope = "session" value ="<%=attributs[2] %>"/>
 <c:set var = "fontColor" scope = "session" value ="<%=attributs[3] %>"/>
 <c:set var = "fontFamily" scope = "session" value ="<%=attributs[4] %>"/>
 <c:set var = "fontSizeHeader" scope = "session" value ="<%=attributs[5] %>"/>
 <c:set var = "menuWidth" scope = "session" value ="<%=attributs[6] %>"/>
 <c:set var = "headerHight" scope = "session" value ="<%=attributs[7] %>"/>
 <c:set var = "logoPath" scope = "session" value ="<%=attributs[8] %>"/>
 <c:set var = "logoWidth" scope = "session" value ="<%=attributs[9] %>"/>
 <c:set var = "logoHeight" scope = "session" value ="<%=attributs[10] %>"/>
 <c:set var = "firstPageLink" scope = "session" value ="<%=(conPath+menuData[0][2]) %>"/>
  
 <link rel="icon" href="favicon.ico">

 
	<jsp:include page="loadPage.jsp"  flush="true" />
