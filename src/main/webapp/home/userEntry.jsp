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
<h2>개인 정보 입력</h2>
</header>
<section>
<form:form action="../entry/entry.html" method="post" modelAttribute="user"
	onsubmit="return check(this)" name="fm">
이 름 : <form:input path="name"/><br/>
계 정 : <form:input path="id" />
<input type="button" value="중복검사" onClick="idCheck()"/><br/>
<input type="hidden" name="idChecked"/>
주 소 : <form:input path="addr"/><br/>
연락처 : <form:input path="phone"/><br/>
암 호 : <form:password path="pwd"/><br/>
암호 확인 : <input type="password" name="CONFIRM"/><br/>
성 별 : 남<form:radiobutton path="gender" value="M"/>,
여<form:radiobutton path="gender" value="F"/><br/>
이메일 : <form:input path="email"/><br/>
직 업 : <form:select path="job">
	<form:option value="--선택하세요--"></form:option>
	<form:option value="회사원"></form:option>
	<form:option value="학 생"></form:option>
	<form:option value="자영업"></form:option>
	<form:option value="기 타"></form:option></form:select><br/><br/>
<input type="submit" value="가 입"/>
<input type="reset" value="취 소"/><br/><br/>
</form:form>
<script type="text/javascript">
function idCheck(){
	var url = "../entry/idcheck.html?ID="+document.fm.id.value;
	window.open(url,"_blank_","width=450,height=200");
}
function check(frm){
	if(frm.name.value == ''){
		alert("이름을 입력하세요."); frm.name.focus();
		return false;
	}
	if(frm.id.value == ''){
		alert("계정을 입력하세요."); frm.id.focus();
		return false;
	}
	if(frm.idChecked.value == ''){
		alert("ID 중복검사를 하세요."); return false;
	}
	if(frm.addr.value == ''){
		alert("주소를 입력하세요."); frm.addr.focus();
		return false;
	}
	if(frm.phone.value == ''){
		alert("연락처를 입력하세요."); frm.phone.focus();
		return false;
	}
	if(frm.pwd.value == ''){
		alert("암호를 입력하세요."); frm.pwd.focus();
		return false;
	}
	if(frm.pwd.value != frm.CONFIRM.value){
		alert("암호가 일치하지 않습니다."); fm.pwd.focus();
		return false;
	}//암호와 암호확인이 다른 경우
	if(! frm.gender[0].checked && ! frm.gender[1].checked){
		alert("성별을 선택하세요."); return false;
	}
	if(frm.job.selectedIndex < 1){
		alert("직업을 선택하세요."); frm.job.focus();
		return false;
	}
	if( ! confirm("입력한 내용이 맞습니까?")) return false;
}
</script>
</section>
</div>
</body>
</html>










