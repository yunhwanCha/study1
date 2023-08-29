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
<form:form action="../image/updateDo.html" method="post" enctype="multipart/form-data"
	onSubmit="return check(this)" modelAttribute="imageBBS">
<form:hidden path="w_id" value="${imageBBS.w_id }"/>
<table width="100%" border="1">
<tr><th>������</th><td><form:input path="title" size="20"
		value="${imageBBS.title }"/></td></tr>
<tr><th>�ۼ���</th><td>${imageBBS.id }</td></tr>
<tr><th>�� ȣ</th><td><form:password path="password" size="10"/></td></tr>
<tr><th>�̹���</th><td><input type="file" name="image_name"/><br/>
	<img alt="" src="${pageContext.request.contextPath }/upload/${imageBBS.image_name }" 
	width="250" height="200"></td></tr>
<tr><th>�۳���</th><td><form:textarea rows="4" cols="40" 
	path="content" value="${imageBBS.content }"></form:textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="����"/>
	<input type="reset" value="���"/></td></tr>
</table>
</form:form>
<script type="text/javascript">
function check(frm){
	if(frm.title.value == ''){
		alert("������ �Է��ϼ���."); frm.title.focus(); return false;
	}
	if(frm.password.value == ''){
		alert("��ȣ�� �Է��ϼ���."); frm.password.focus(); return false;
	}
	if(frm.content.value == ''){
		alert("�۳����� �Է��ϼ���."); frm.content.focus(); return false;
	}
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</div>
</body>
</html>










