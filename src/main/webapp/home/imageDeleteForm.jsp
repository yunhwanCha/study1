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
<div align="center">
<form:form action="../image/deleteDo.html" method="post" 
		onsubmit="return check(this)" modelAttribute="imageBBS">
<form:hidden path="w_id" value="${imageBBS.w_id }"/>
	<table width="100%">
		<tr><th>�� ��</th><td>${imageBBS.title }</td></tr>
		<tr><th>�ۼ���</th><td>${imageBBS.id }</td></tr>
		<tr><th>�� ȣ</th><td><form:password path="password" /></td></tr>
		<tr><th>�̹���</th><td><img alt="" 
			src="${pageContext.request.contextPath }/upload/${imageBBS.image_name }"
			width="250" height="200"></td></tr>
		<tr><th>�� ��</th><td>${imageBBS.content }</td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="����"/>
			<input type="reset" value="���"/></td></tr>
	</table>
</form:form>
</div>
<script type="text/javascript">
function check(frm){
	if(frm.password.value == '') {
		alert("��ȣ�� �Է��ϼ���."); frm.password.focus(); return false;
	}
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</body>
</html>
















