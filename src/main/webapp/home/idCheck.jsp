<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">���� �ߺ� Ȯ��</h2>

<form action="../entry/idcheck.html" >
	�� �� : <input type="text" name="ID" value="${ID }"/>
	<input type="submit" value="�ߺ� �˻�"/>
</form><br/>

<c:if test="${DUP == 'YES' }">
${ID }�� �̹� ��� ���Դϴ�.
	<script type="text/javascript">
		opener.document.fm.id.value = "";
	</script>
</c:if>
<c:if test="${DUP == 'NO' }">
${ID }�� ��� �����մϴ�.
<input type="button" value="���" onClick="idOk()"/>
</c:if>

<script type="text/javascript">
function idOk(){
	opener.document.fm.id.value = "${ID}";
	opener.document.fm.id.readOnly = true;
	opener.document.fm.idChecked.value = "OK";
	self.close();
}
</script>
</body>
</html>