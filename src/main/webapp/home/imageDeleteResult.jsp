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
<c:if test="${empty param.id }">
	<script type="text/javascript">
		alert("삭제되었습니다.");
		location.href="../image/imageList.html";
	</script>
</c:if>
<c:if test="${ ! empty param.id }">
	<script type="text/javascript">
		alert("삭제되지 않았습니다. 암호를 확인하세요.");
		location.href="../image/detail.html?W_ID="+${param.id};
	</script>
</c:if>
</body>
</html>






