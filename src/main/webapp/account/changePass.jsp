<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import="account.DbConention"%>
<c:if test="${param.t == 'form'}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="/stylesheet/stylesheet.css"%></style>
</head>
<body>
<script type="text/javascript">

  function checkPassword(str)
  {
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
    return re.test(str);
  }

  function checkForm(form)
  {
    if(form.oldPass.value == "") {
      alert("Error: old password cannot be blank!");
      form.oldPass.focus();
      return false;
    }
    re = /^\w+$/;
   /* if(!re.test(form.username.value)) {
      alert("Error: Username must contain only letters, numbers and underscores!");
      form.username.focus();
      return false;
    }*/
    if(form.newPass.value != "" && form.newPass.value == form.conNewPass.value) {
      if(!checkPassword(form.newPass.value)) {
        alert("The password you have entered is not valid!");
        form.newPass.focus();
        return false;
      }
    } else {
      alert("Error: Please check that you've entered and confirmed your password!");
      form.newPass.focus();
      return false;
    }
    return true;
  }

</script>

<form class="cencon" method="POST" action="changePass.jsp?t=execut" onsubmit="return checkForm(this);">
<div class="contentCenter" >
<p>Benutzername: <br><input type="text" name="username"></p>
</div>
<div class="contentCenter" >
<p>letztes Kennwort:<br> <input type="password" name="oldPass"></p>
</div>
<div class="contentCenter" >
<p>Neues Kennwort: <br><input type="password" name="newPass"></p>
</div>
<div class="contentCenter" >
<p>Kennwort wiederholen: <br><input type="password" name="conNewPass"></p>
</div>
<input class="contentCenter" type="submit" value="ändern"></p>
</form>
</body>
</html>
</c:if>


<c:if test="${param.t == 'execut'}">
<%
String oldPass = request.getParameter("oldPass");
String newPass = request.getParameter("newPass");
String conNewPass = request.getParameter("conNewPass");

String username = request.getParameter("username");

DbConention dc = new DbConention();
dc.setUsername(username);
dc.conect();
dc.setPassword(oldPass, newPass, conNewPass);
%>

<jsp:forward page="changePass.jsp" > 
        <jsp:param name="t" value="form"/>
         <jsp:param name="method" value=""/>
</jsp:forward>
</c:if>
