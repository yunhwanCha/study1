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
<section>
<div align="center">
<c:choose>
	<c:when test="${sessionScope.USER != null }">
		<h3>�α��� �Ǿ����ϴ�~.</h3>
		<h3>ȯ���մϴ�~ ${sessionScope.USER }��~</h3>
	</c:when>
	<c:when test="${sessionScope.ADMIN != null }">
		<h3>�α��� �Ǿ����ϴ�~.</h3>
		<h3>ȯ���մϴ�~ ${sessionScope.ADMIN }��~</h3>
	</c:when>
	<c:otherwise>
		<h3>�α��� ���� �ʾҽ��ϴ�. ������ ��ȣ�� Ȯ���ϼ���.</h3>
	</c:otherwise>
</c:choose>
</div>
</section>
</body>
</html>





