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
<div align="right"><a href="../entry/userEntry.html">�����ϱ�</a></div>
<form:form action="../login/logindo.html" modelAttribute="customer" method="post">
�� �� : <form:input path="id" size="10" placeHolder="����"/>
<font color="red"><form:errors path="id"/></font><br/>
�� ȣ : <form:password path="pwd" size="10"/>
<font color="red"><form:errors path="pwd"/></font><br/>
<input type="submit" value="�α���"/>
<input type="reset" value="�� ��"/>
</form:form>
</body>
</html>





