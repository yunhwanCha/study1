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
<h2>공지사항 쓰기</h2>
<form:form action="../notice/write.html" method="post" modelAttribute="notice"
	onsubmit="return check()">
<table>
	<tr><th>제 목</th><td><form:input path="title" size="20"/>
		<font color="red"><form:errors path="title"/></font></td></tr>
	<tr><th>내 용</th><td><form:textarea rows="6" cols="40" path="content"></form:textarea>
		<font color="red"><form:errors path="content"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="올리기"/>
		<input type="reset" value="취 소"/></td></tr>
</table>
</form:form>
</div>
<script type="text/javascript">
function check(){
	if( ! confirm("정말로 올리시겠습니까?")) return false;
}
</script>
</body>
</html>












