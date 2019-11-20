<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

</head>
<header>
			<jsp:include page="../include/header.jsp"/>
			</header>
 <jsp:include page="../include/nav_center.jsp" />
		
<body>

<%
		request.setCharacterEncoding("utf-8");
	
		// 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();

		//세션값 없으면 loginForm.jsp 이동
		if (cookies == null) {
			response.sendRedirect("login.jsp");
			return;   
		}
		
		String id = (String)session.getAttribute("id");
		MemberDao memberDao = MemberDao.getInstance();
		MemberVO member = MemberDao.getMember(id);
		%>	
	
	<h1>회원정보수정</h1>ID

	<form action="infoUpdateProcess.jsp" method="post" id="loginMember">                 
		아이디: <input type="text" name="id" value="<%=member.getId()%>" readonly/><br>
		패스워드 <input type="password" name="passwd"/><br>
		이름: <input type="text" name="name" value="<%=member.getName()%>"/><br>
		이메일: <input type="email" name="email" value="<%=(member.getEmail()==null) ? "" : member.getEmail() %>"/><br>
		주소: <input type="text" name="address" /><br>
		전화번호: <input type="text" name="tel" /><br>
		폰번호: <input type="text" name="mtel" /><br>
		<button type="submit">수정하기</button> 
	</form>
	<br>
	<a href="../main/index.jsp">메인ㄱㄱ</a>
</body>
</html>