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
<div align="center">
<c:if test="${BBS == null }">
	<h2>�������� �ʴ� �Խñ��Դϴ�.</h2>
</c:if>
<c:if test="${BBS != null }">
	<h2>�Խñ� ����</h2>
	<form action="../write/bbsModify.html" method="post" onSubmit="return check()">
	<input type="hidden" name="SEQNO" value="${BBS.seqno }"/>
	<table>
		<tr><th>�۹�ȣ</th><td>${BBS.seqno }</td></tr>
		<tr><th>�ۼ���</th><td>${BBS.id }</td></tr>
		<tr><th>�� ��</th><td><input type="text" name="TITLE"
			value="${BBS.title }"/></td></tr>
		<tr><th>�ۼ���</th><td>${BBS.bbs_date }</td></tr>
		<tr><th>�� ��</th><td><textarea rows="5" cols="40" 
				name="CONTENT">${BBS.content }</textarea></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="����"
			name="BTN"/> <input type="submit" value="����" name="BTN"/></td></tr>
	</table>
	</form>
</c:if>
</div>
<script type="text/javascript">
function check(){
	if( ! confirm("������ �۾��� �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</body>
</html>








