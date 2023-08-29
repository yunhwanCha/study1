<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<c:if test="${COUNT == 0 }">
	<h2>��ϵ� �������� �������� �ʽ��ϴ�.</h2>
</c:if>
<c:if test="${COUNT > 0 }">
	<h2>������ ���</h2>
	<table>
		<tr><th>�۹�ȣ</th><th>�� ��</th><th>�ۼ���</th><th>�ۼ���</th></tr>
		<c:forEach items="${NOTICES }" var="notice">
		<tr><td>${notice.no }</td>
			<td><a href="../notice/noticeDetail.html?NO=${notice.no }">${notice.title }</a></td>
			<td>${notice.id }</td><td>${notice.notice_date }</td></tr>
		</c:forEach>
	</table>
	<c:forEach begin="1" end="${COUNT }" var="page">
		<a href="../notice/noticeList.html?PAGE_NO=${page }">${page }</a>
	</c:forEach>
</c:if>
</div>
</body>
</html>













