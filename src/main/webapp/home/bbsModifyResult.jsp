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
<c:if test="${param.R == 'OK' }">
	<script type="text/javascript">
		setTimeout(function(){
			location.href = "../write/bbsRead.html";
			alert("�۾��� ���������� �Ϸ�Ǿ����ϴ�."); 
		},100);
	</script>
</c:if>
<c:if test="${param.R == 'NOK' }">
	<script type="text/javascript">
		setTimeout(function(){
			location.href = "bbsList.do";
			alert("�۾� �� ������ �߻��߽��ϴ�. �����ڿ��� ������ �ּ���.");	
		},100);
	</script>
</c:if>
</body>
</html>