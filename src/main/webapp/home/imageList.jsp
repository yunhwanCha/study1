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
<h2>�̹��� �Խñ� ���</h2>
<table width="100%">
	<tr><td align="right">${startRow} ~ ${endRow } / ${total }</td></tr>
</table>
<table>
	<tr><th>�̹���</th><th>�۹�ȣ</th><th>�� ��</th><th>�ۼ���</th><th>�ۼ���</th></tr>
	<c:forEach items="${IMAGES }" var="bbs">
	<tr><td><img alt="" src="${pageContext.request.contextPath}/upload/${bbs.image_name }" 
				width="50" height="50"></td>
		<td>${bbs.w_id }</td>
		<td><a href="../image/detail.html?W_ID=${bbs.w_id }">${bbs.title }</a></td>
		<td>${bbs.id }</td><td>${bbs.reg_date }</td></tr>
	</c:forEach>
</table>
<c:set var="startPage" 
value="${currentPage - (currentPage % 10 == 0 ? 10 :(currentPage%10)) + 1 }"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>
<c:if test="${startPage > 10 }">
	<a href="">[����]</a>
</c:if>
<c:forEach var="pageNo" begin="${startPage }" end="${endPage }">
	<c:if test="${currentPage == pageNo}">
		<font size="6">
	</c:if>
		<a href="../image/imageList.html?PAGE_NUM=${pageNo }">${pageNo }</a>
	<c:if test="${currentPage == pageNo}">
		</font>
	</c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
	<a href="">[����]</a>
</c:if>
</div>
</body>
</html>









