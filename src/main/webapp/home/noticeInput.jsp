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
<h2>�������� ����</h2>
<form:form action="../notice/write.html" method="post" modelAttribute="notice"
	onsubmit="return check()">
<table>
	<tr><th>�� ��</th><td><form:input path="title" size="20"/>
		<font color="red"><form:errors path="title"/></font></td></tr>
	<tr><th>�� ��</th><td><form:textarea rows="6" cols="40" path="content"></form:textarea>
		<font color="red"><form:errors path="content"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="�ø���"/>
		<input type="reset" value="�� ��"/></td></tr>
</table>
</form:form>
</div>
<script type="text/javascript">
function check(){
	if( ! confirm("������ �ø��ðڽ��ϱ�?")) return false;
}
</script>
</body>
</html>












