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
<h2>�̹��� �Խñ� �ۼ�</h2>
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
	<tr><th>�� ��</th><td><form:input path="title" value="${title}"/></td></tr>
	<tr><th>�� ȣ</th><td><form:password path="password"/></td></tr>
	<tr><th>�̹���</th><td><input type="file" name="image_name"/></td></tr>
	<tr><th>�� ��</th><td><form:textarea rows="8" cols="40" path="content"></form:textarea>
		</td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="�� �ø���"/>
		<input type="reset" value="�� ��"/></td></tr>
	</table>	
</form:form>
</div>
<script type="text/javascript">
function check(frm){
	if(frm.title.value == ''){
		alert("������ �Է��ϼ���."); frm.title.focus(); return false;
	}else {
		if(frm.title.value.length > 30){
			alert("������ 30�� �̳��� �ۼ��ϼ���."); frm.title.focus(); return false;
		}
	}
	if(frm.password.value == ''){
		alert("��ȣ�� �Է��ϼ���. ���� �� ������ �ʿ��մϴ�."); frm.password.focus();
		return false;
	}else {
		if(frm.password.value.length > 20){
			alert("��ȣ�� 20�� �̳��� �ۼ��ϼ���."); frm.password.focus(); return false;
		}
	}
	if(frm.image_name.value == ''){
		alert("�̹��� ������ �����ϼ���."); frm.image_name.focus(); return false;
	}
	if(frm.content.value == ''){
		alert("������ �Է��ϼ���."); frm.content.focus(); return false;
	}else {
		if(frm.content.value.length > 150){
			alert("������ 150�� �̳��� �ۼ��ϼ���."); frm.content.focus(); return false;
		}
	}
	if( ! confirm("�Է��� ������ �½��ϱ�?")) return false;
}
</script>
</body>
</html>















