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
<h2>공지사항 보기</h2>
<form:form action="../notice/noticeModify.html" method="post" 
	modelAttribute="notice"	onSubmit="return check()">
<table>
	<tr><th>글 번호</th><td><form:input path="no" readonly="true"/></td></tr>
	<tr><th>작성자</th><td><form:input path="id" readonly="true"/></td></tr>
	<tr><th>제 목</th><td><form:input path="title"/>
			<font color="red"><form:errors path="title"/></font></td></tr>
	<tr><th>작성일</th><td><form:input path="notice_date" readonly="true"/></td></tr>
	<tr><th>내 용</th><td><form:textarea rows="5" cols="40" 
					path="content" ></form:textarea>
			<font color="red"><form:errors path="content"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="수정"
		name="BTN"/> <input type="submit" value="삭제" name="BTN"/></td></tr>
</table>
</form:form>
</div>
<script type="text/javascript">
function check(){
	if( ! confirm("작업을 진행하시겠습니까?")) return false;
}
</script>
</body>
</html>









