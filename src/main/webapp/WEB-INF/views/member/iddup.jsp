<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function useIdId(){
	opener.document.aaa.id.value = wfrm.userid.value;
	close();
}
</script>
</head>
<body>

<%
String userid=request.getParameter("userid");

MemberDao memberDao = MemberDao.getInstance();

boolean isIdDup= memberDao.isIdDuplicated(userid);
if(isIdDup){
	%>
	이미 사용중인 ID입니다.
	<%
}else{
	%>
	사용가능한 ID입니다.<br>
	<button type="button" onclick="useIdId();">사용</button>
	<%	
}
%>	
	<form action="iddup.jsp" method="get" name="wfrm">
	<input type="text" name="userid" value="<%=userid %>"/>
	<button type="submit">중복확인 </button>
</form>
</body>
</html>