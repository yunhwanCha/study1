<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="../logout/logout.html">
<c:if test="${sessionScope.USER != null }">
ȯ���մϴ�~<font color="red">${sessionScope.USER }��~</font><br/>
</c:if>
<c:if test="${sessionScope.ADMIN != null }">
ȯ���մϴ�~<font color="red">${sessionScope.ADMIN }��~</font><br/>
</c:if>
<br/>
<input type="submit" value="�α� �ƿ�"/>
</form>
</body>
</html>






