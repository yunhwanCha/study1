<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>�Խñ� ��</h2>
<table width="100%">
	<tr><th width="100">�� ��</th><td>${BBS.title }</td></tr>
	<tr><th width="100">�ۼ���</th><td>${BBS.id }</td></tr>
	<tr><td colspan="2" align="center"><img alt="" src="${pageContext.request.contextPath }/upload/${BBS.image_name }"
			width="250" height="200"></td></tr>
	<tr><th width="100">�� ��</th><td><textarea rows="4" 
			cols="50" readonly="readonly">${BBS.content }</textarea></td></tr>
	<tr><td colspan="2" align="center">
		<a href="javascript:goReply()">[���]</a>
		<a href="javascript:goModify()">[����]</a>
		<a href="javascript:goDelete()">[����]</a>
		<a href="../image/imageList.html">[���]</a></td></tr>
</table>
<br/>
</div>
<form name="move" method="post">
	<input type="hidden" name="id" value="${BBS.w_id }"/>
	<input type="hidden" name="parentid" value="${BBS.w_id }"/>
	<input type="hidden" name="groupid" value="${BBS.group_id }"/>
</form>
<script type="text/javascript">
function goReply(){
	document.move.action="../image/writeReplyForm.html";
	document.move.submit();
} 
function goModify(){
	document.move.action="../image/update.html";
	document.move.submit();//���� ȣ��
}
function goDelete(){
	document.move.action="../image/delete.html";
	document.move.submit();//���� ȣ��
}
</script>
</body>
</html>










