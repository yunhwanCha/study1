<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="right"><a href="../entry/userEntry.html">가입하기</a></div>
<form:form action="../login/logindo.html" modelAttribute="customer" method="post">
계 정 : <form:input path="id" size="10" placeHolder="계정"/>
<font color="red"><form:errors path="id"/></font><br/>
암 호 : <form:password path="pwd" size="10"/>
<font color="red"><form:errors path="pwd"/></font><br/>
<input type="submit" value="로그인"/>
<input type="reset" value="취 소"/>
</form:form>
</body>
</html>





