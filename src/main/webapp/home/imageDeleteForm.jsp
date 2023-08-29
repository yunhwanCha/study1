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
		<tr><th>제 목</th><td>${imageBBS.title }</td></tr>
		<tr><th>작성자</th><td>${imageBBS.id }</td></tr>
		<tr><th>암 호</th><td><form:password path="password" /></td></tr>
		<tr><th>이미지</th><td><img alt="" 
			src="${pageContext.request.contextPath }/upload/${imageBBS.image_name }"
			width="250" height="200"></td></tr>
		<tr><th>내 용</th><td>${imageBBS.content }</td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="삭제"/>
			<input type="reset" value="취소"/></td></tr>
	</table>
</form:form>
</div>
<script type="text/javascript">
function check(frm){
	if(frm.password.value == '') {
		alert("암호를 입력하세요."); frm.password.focus(); return false;
	}
	if( ! confirm("정말로 삭제하시겠습니까?")) return false;
}
</script>
</body>
</html>
















