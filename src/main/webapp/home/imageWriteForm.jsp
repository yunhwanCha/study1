<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>   
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
<h2>이미지 게시글 작성</h2>
<form:form action="../image/write.html" method="post" enctype="multipart/form-data" 
	onsubmit="return check(this)" modelAttribute="imageBBS">
<form:hidden path="order_no" value="${imageBBS.order_no + 1 }"/>
<c:if test="${ ! empty imageBBS.group_id }">
<form:hidden path="group_id" value="${imageBBS.group_id }"/>
</c:if>	
<c:if test="${ ! empty imageBBS.parent_id }">
<form:hidden path="parent_id" value="${imageBBS.parent_id }"/>
</c:if>
	<table>
	<tr><th>제 목</th><td><form:input path="title" value="${title}"/></td></tr>
	<tr><th>암 호</th><td><form:password path="password"/></td></tr>
	<tr><th>이미지</th><td><input type="file" name="image_name"/></td></tr>
	<tr><th>내 용</th><td><form:textarea rows="8" cols="40" path="content"></form:textarea>
		</td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="글 올리기"/>
		<input type="reset" value="취 소"/></td></tr>
	</table>	
</form:form>
</div>
<script type="text/javascript">
function check(frm){
	if(frm.title.value == ''){
		alert("제목을 입력하세요."); frm.title.focus(); return false;
	}else {
		if(frm.title.value.length > 30){
			alert("제목은 30자 이내로 작성하세요."); frm.title.focus(); return false;
		}
	}
	if(frm.password.value == ''){
		alert("암호를 입력하세요. 수정 및 삭제에 필요합니다."); frm.password.focus();
		return false;
	}else {
		if(frm.password.value.length > 20){
			alert("암호는 20자 이내로 작성하세요."); frm.password.focus(); return false;
		}
	}
	if(frm.image_name.value == ''){
		alert("이미지 파일을 선택하세요."); frm.image_name.focus(); return false;
	}
	if(frm.content.value == ''){
		alert("내용을 입력하세요."); frm.content.focus(); return false;
	}else {
		if(frm.content.value.length > 150){
			alert("내용은 150자 이내로 작성하세요."); frm.content.focus(); return false;
		}
	}
	if( ! confirm("입력한 내용이 맞습니까?")) return false;
}
</script>
</body>
</html>















