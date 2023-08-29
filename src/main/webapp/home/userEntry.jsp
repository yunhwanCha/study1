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
<header>
<h2>���� ���� �Է�</h2>
</header>
<section>
<form:form action="../entry/entry.html" method="post" modelAttribute="user"
	onsubmit="return check(this)" name="fm">
�� �� : <form:input path="name"/><br/>
�� �� : <form:input path="id" />
<input type="button" value="�ߺ��˻�" onClick="idCheck()"/><br/>
<input type="hidden" name="idChecked"/>
�� �� : <form:input path="addr"/><br/>
����ó : <form:input path="phone"/><br/>
�� ȣ : <form:password path="pwd"/><br/>
��ȣ Ȯ�� : <input type="password" name="CONFIRM"/><br/>
�� �� : ��<form:radiobutton path="gender" value="M"/>,
��<form:radiobutton path="gender" value="F"/><br/>
�̸��� : <form:input path="email"/><br/>
�� �� : <form:select path="job">
	<form:option value="--�����ϼ���--"></form:option>
	<form:option value="ȸ���"></form:option>
	<form:option value="�� ��"></form:option>
	<form:option value="�ڿ���"></form:option>
	<form:option value="�� Ÿ"></form:option></form:select><br/><br/>
<input type="submit" value="�� ��"/>
<input type="reset" value="�� ��"/><br/><br/>
</form:form>
<script type="text/javascript">
function idCheck(){
	var url = "../entry/idcheck.html?ID="+document.fm.id.value;
	window.open(url,"_blank_","width=450,height=200");
}
function check(frm){
	if(frm.name.value == ''){
		alert("�̸��� �Է��ϼ���."); frm.name.focus();
		return false;
	}
	if(frm.id.value == ''){
		alert("������ �Է��ϼ���."); frm.id.focus();
		return false;
	}
	if(frm.idChecked.value == ''){
		alert("ID �ߺ��˻縦 �ϼ���."); return false;
	}
	if(frm.addr.value == ''){
		alert("�ּҸ� �Է��ϼ���."); frm.addr.focus();
		return false;
	}
	if(frm.phone.value == ''){
		alert("����ó�� �Է��ϼ���."); frm.phone.focus();
		return false;
	}
	if(frm.pwd.value == ''){
		alert("��ȣ�� �Է��ϼ���."); frm.pwd.focus();
		return false;
	}
	if(frm.pwd.value != frm.CONFIRM.value){
		alert("��ȣ�� ��ġ���� �ʽ��ϴ�."); fm.pwd.focus();
		return false;
	}//��ȣ�� ��ȣȮ���� �ٸ� ���
	if(! frm.gender[0].checked && ! frm.gender[1].checked){
		alert("������ �����ϼ���."); return false;
	}
	if(frm.job.selectedIndex < 1){
		alert("������ �����ϼ���."); frm.job.focus();
		return false;
	}
	if( ! confirm("�Է��� ������ �½��ϱ�?")) return false;
}
</script>
</section>
</div>
</body>
</html>










